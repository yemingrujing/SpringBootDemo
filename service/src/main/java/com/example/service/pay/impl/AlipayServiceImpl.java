package com.example.service.pay.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.AlipayConstants;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeRefundApplyModel;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.internal.util.StringUtils;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.example.service.pay.AlipayService;
import com.example.util.common.StringUtil;
import com.example.util.pay.AlipayParam;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * 支付宝支付service
 *
 * @author Wei.Guang
 * @create 2018-06-28 10:23
 **/
@Service
@Slf4j
public class AlipayServiceImpl implements AlipayService {


    @Override
    public String getSign(String orderCode, String subject, BigDecimal totalFee, String passbackParams, String method, String notifyUrl) throws UnsupportedEncodingException {
        String sign;
        StringBuffer content;
        // 签名参数集合
        Map<String, String> params = new HashMap<String, String>();
        // 业务请求参数的集合，除公共参数外所有请求参数都必须放在这个参数中传递
        Map<String, String> bizContent = new HashMap<>();
        bizContent.put("timeout_express", "30m");
        bizContent.put("total_amount", String.valueOf(totalFee));
        if (StringUtil.isNotBlank(subject)) {
            bizContent.put("subject", subject);
        }
        bizContent.put("product_code", "QUICK_MSECURITY_PAY");
        bizContent.put("out_trade_no", orderCode);
        if (StringUtil.isNotEmpty(passbackParams)) {
            bizContent.put("passback_params", URLEncoder.encode(passbackParams, "UTF-8"));
        }
        params.put("app_id", AlipayParam.APPID);
        params.put("biz_content", JSON.toJSONString(bizContent));
        params.put("notify_url", notifyUrl);
        params.put("charset", AlipayParam.CHARSET);
        params.put("format", AlipayParam.FORMAT);
        params.put("method", method);
        params.put("sign_type", AlipayParam.SIGN_TYPE);
        params.put("timestamp", LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        params.put("version", AlipayParam.VERSION);
        content = payParams(params, 0);
        try {
            sign = AlipaySignature.rsaSign(content.toString(),
                    AlipayParam.APP_PRIVATE_KEY,
                    AlipayParam.CHARSET,
                    AlipayConstants.SIGN_TYPE_RSA2);
            content = payParams(params, 1);
            content.append("&sign=" + URLEncoder.encode(sign, AlipayParam.CHARSET));
        } catch (AlipayApiException e) {
            log.error("签名生成失败", ExceptionUtils.getStackTrace(e));
        }
        System.out.println(content.toString());
        return content.toString();
    }

    @Override
    public void aliPayNotify(HttpServletRequest request, HttpServletResponse response) {
        String outTradeNo = null;
        Map<String, String> map = new HashMap<>();
        BigDecimal receiptAmount = new BigDecimal(BigInteger.ZERO);
        int step = 0;
        // 获取支付宝POST过来反馈信息
        Map<String, String> params = convertResultStringToMap(request);
        try {
            PrintWriter out = response.getWriter();
            boolean flag = AlipaySignature.rsaCheckV1(params,
                    AlipayParam.ALIPAY_PUBLIC_KEY,
                    AlipayParam.CHARSET,
                    AlipayParam.SIGN_TYPE);
            if (flag) {
                // 付款成功
                if ("TRADE_SUCCESS".equals(params.get("trade_status"))) {
                    // 商户订单号
                    outTradeNo = params.get("out_trade_no");
                    // 通知时间
                    String notifyTime = params.get("notify_time");
                    // 买家支付宝账号
                    String buyerLoginId = params.get("buyer_logon_id");
                    // 卖家支付宝账号
                    String sellerEmail = params.get("seller_email");
                    // 交易退款时间
                    String gmtRefund = params.get("gmt_refund");
                    // 支付宝交易号
                    String tradeNo = params.get("trade_no");
                    // 附加数据
                    String passbackParams = params.get("passback_params");
                    // 保存交易信息
                    if (StringUtil.isBlank(gmtRefund)) {
                        // 付款金额
                        BigDecimal amount = BigDecimal.valueOf(Double.parseDouble(params.get("buyer_pay_amount")));
                        // 实收金额
                        receiptAmount = BigDecimal.valueOf(Double.parseDouble(params.get("receipt_amount")));
                        // 交易付款时间
                        String gmtPayment = params.get("gmt_payment");
                    }
                } else if ("TRADE_CLOSED".equals(params.get("trade_status"))) {
                    // 通知时间
                    String notifyTime = params.get("notify_time");
                    // 买家支付宝账号
                    String buyerLoginId = params.get("buyer_logon_id");
                    // 卖家支付宝账号
                    String sellerEmail = params.get("seller_email");
                    // 付款金额
                    String amount = params.get("buyer_pay_amount");
                    // 支付宝交易号
                    String tradeNo = params.get("trade_no");
                    // 商户订单号
                    outTradeNo = params.get("out_trade_no");
                    // 交易关闭时间
                    String gmtClose = params.get("gmt_close");
                }
                out.print("success");
            } else {
                log.error("notify_url varify failure");
                out.print("failure");
            }
            out.close();
        } catch (AlipayApiException e) {
            log.error("支付异步回调失败 {}", ExceptionUtils.getStackTrace(e));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void signAlipayNotify(HttpServletRequest request, HttpServletResponse response) {
        // 获取支付宝POST过来反馈信息
        Map<String, String> params = convertResultStringToMap(request);
        try {
            PrintWriter out = response.getWriter();
            boolean flag = AlipaySignature.rsaCheckV1(params,
                    AlipayParam.ALIPAY_PUBLIC_KEY,
                    AlipayParam.CHARSET,
                    AlipayParam.SIGN_TYPE);
            if (flag) {
                // 付款成功
                if ("TRADE_SUCCESS".equals(params.get("trade_status"))) {
                    // 商户订单号
                    String outTradeNo = params.get("out_trade_no");
                    // 通知时间
                    String notifyTime = params.get("notify_time");
                    // 买家支付宝账号
                    String buyerLoginId = params.get("buyer_logon_id");
                    // 卖家支付宝账号
                    String sellerEmail = params.get("seller_email");
                    // 交易退款时间
                    String gmtRefund = params.get("gmt_refund");
                    // 支付宝交易号
                    String tradeNo = params.get("trade_no");
                    // 附加数据
                    String passbackParams = params.get("passback_params");
                    if (StringUtil.isBlank(gmtRefund)) {
                        // 付款金额
                        BigDecimal amount = BigDecimal.valueOf(Double.parseDouble(params.get("buyer_pay_amount")));
                        // 实收金额
                        BigDecimal receiptAmount = BigDecimal.valueOf(Double.parseDouble(params.get("receipt_amount")));
                        // 交易付款时间
                        String gmtPayment = params.get("gmt_payment");
                    }
                }
                out.print("success");
            } else {
                log.error("notify_url varify failure");
                out.print("fail");
            }
            out.close();
        } catch (AlipayApiException e) {
            log.error("支付异步回调失败 {}", ExceptionUtils.getStackTrace(e));
        } catch (UnsupportedEncodingException e) {
            log.error("支付异步回调失败 {}", ExceptionUtils.getStackTrace(e));
        } catch (IOException e) {
            log.error("支付异步回调失败{}", ExceptionUtils.getStackTrace(e));
        } catch (Exception e) {
            log.error("支付异步回调失败 {}", ExceptionUtils.getStackTrace(e));
        }
    }

    @Override
    public void refundAliPayNotify(HttpServletRequest request, HttpServletResponse response) {
        // 获取支付宝POST过来反馈信息
        Map<String, String> params = convertResultStringToMap(request);
        try {
            PrintWriter out = response.getWriter();
            boolean flag = AlipaySignature.rsaCheckV1(params,
                    AlipayParam.ALIPAY_PUBLIC_KEY,
                    AlipayParam.CHARSET,
                    AlipayParam.SIGN_TYPE);
            if (flag) {
                // 付款成功
                if ("TRADE_SUCCESS".equals(params.get("trade_status"))) {
                    // 商户订单号
                    String outTradeNo = params.get("out_trade_no");
                    // 通知时间
                    String notifyTime = params.get("notify_time");
                    // 买家支付宝账号
                    String buyerLoginId = params.get("buyer_logon_id");
                    // 卖家支付宝账号
                    String sellerEmail = params.get("seller_email");
                    // 交易退款时间
                    String gmtRefund = params.get("gmt_refund");
                    // 支付宝交易号
                    String tradeNo = params.get("trade_no");
                    String outBizNo = params.get("out_biz_no");
                    // 退款金额
                    BigDecimal refundFee = BigDecimal.valueOf(Double.parseDouble(params.get("refund_fee")));
                }
                out.print("success");
            } else {
                log.error("notify_url varify failure");
                out.print("fail");
            }
            out.close();
        } catch (AlipayApiException e) {
            log.error("退款异步回调失败", ExceptionUtils.getStackTrace(e));
        } catch (IOException e) {
            log.error("退款异步回调失败", ExceptionUtils.getStackTrace(e));
        }
    }

    @Override
    public boolean refundOrder(String tradeNo, String refundReason) {
        String refundNo = "";
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayParam.GATE,
                AlipayParam.APPID,
                AlipayParam.APP_PRIVATE_KEY,
                AlipayParam.FORMAT,
                AlipayParam.CHARSET,
                AlipayParam.ALIPAY_PUBLIC_KEY,
                AlipayParam.SIGN_TYPE);
        AlipayTradeRefundApplyModel refundApplyModel = new AlipayTradeRefundApplyModel();
        AlipayTradeRefundResponse response;
        // 订单支付时传入的商户订单号
        refundApplyModel.setOutTradeNo(tradeNo);
        // 支付宝交易号(和订单号不能同时为空)
        refundApplyModel.setTradeNo("");
        // 标识一次退款请求，同一笔交易多次退款需要保证唯一
        refundApplyModel.setOutRequestNo(refundNo);
        // 商户的操作员编号
        refundApplyModel.setOperatorId("");
        // 退款金额
        refundApplyModel.setRefundAmount(String.valueOf(""));
        // 退款说明
        refundApplyModel.setRefundReason(refundReason);
        AlipayTradeRefundRequest refundRequest = new AlipayTradeRefundRequest();
        refundRequest.setBizModel(refundApplyModel);
        refundRequest.setNotifyUrl(AlipayParam.REFUND_NOTIFY_URL);
        try {
            response = alipayClient.execute(refundRequest);
            if (response.isSuccess()) {
                String body = response.getBody();
                JSONObject json = JSON.parseObject(body);
                Map<String, String> params = (Map<String, String>) json.get("alipay_trade_refund_response");
                String orderCode = params.get("out_trade_no");
                String reTrageNo = params.get("trade_no");
                BigDecimal refundPayment = BigDecimal.valueOf(Double.parseDouble(params.get("refund_fee")));
                BigDecimal actualRefundPayment = BigDecimal.valueOf(Double.parseDouble(params.get("refund_fee")));
                // 买家支付宝账号
                String buyerLoginId = params.get("buyer_logon_id");
                // 卖家支付宝账号
                String sellerEmail = params.get("seller_email");
                Date refundDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(params.get("gmt_refund_pay"));
                return true;
            }
            return false;
        }  catch (ParseException e) {
            log.error("支付宝退款失败，付款日期转换失败", ExceptionUtils.getStackTrace(e));
            return false;
        } catch (AlipayApiException e) {
            log.error("支付宝退款失败", ExceptionUtils.getStackTrace(e));
            return false;
        }
    }

    @Override
    public void wapPay(HttpServletResponse response) {
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayParam.GATE,
                AlipayParam.APPID,
                AlipayParam.APP_PRIVATE_KEY,
                AlipayParam.FORMAT,
                AlipayParam.CHARSET,
                AlipayParam.ALIPAY_PUBLIC_KEY,
                AlipayParam.SIGN_TYPE);
        AlipayTradeWapPayModel wapPayModel = new AlipayTradeWapPayModel();
        AlipayTradeWapPayRequest wapPayRequest = new AlipayTradeWapPayRequest();
        // 商户订单号，商户网站订单系统中唯一订单号，必填
        String outradeNo = StringUtil.generateOrderNo("1");
        // 订单名称，必填
        String subject = "手机网站支付测试商品";
        // 付款金额，必填
        String totalAmount= new BigDecimal("0.01").toString();
        // 商品描述，可空
        String body = "购买测试商品0.01元";
        // 超时时间 可空
        String timeoutExpress = "2m";
        // 销售产品码 必填
        String productCode = "QUICK_WAP_WAY";
        wapPayModel.setOutTradeNo(outradeNo);
        wapPayModel.setSubject(subject);
        wapPayModel.setTotalAmount(totalAmount);
        wapPayModel.setBody(body);
        wapPayModel.setTimeoutExpress(timeoutExpress);
        wapPayModel.setProductCode(productCode);
        wapPayRequest.setBizModel(wapPayModel);
        // 设置异步通知地址
        wapPayRequest.setNotifyUrl(AlipayParam.SIGN_PAY_NOTIFY_URL);
        // 设置同步地址
        wapPayRequest.setReturnUrl(AlipayParam.RETURN_URL);
        // form表单生产
        String form;
        try {
            // 调用SDK生成表单
            form = alipayClient.pageExecute(wapPayRequest).getBody();
            response.setContentType("text/html;charset=" + AlipayParam.CHARSET);
            //直接将完整的表单html输出到页面
            response.getWriter().write(form);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (AlipayApiException e) {
            e.printStackTrace();
            log.error("支付失败", ExceptionUtils.getStackTrace(e));
        } catch (IOException e) {
            e.printStackTrace();
            log.error("支付失败", ExceptionUtils.getStackTrace(e));
        }
    }

    /**
     * 支付宝参数拼接
     *
     * @param params
     * @param type
     * @return
     * @throws UnsupportedEncodingException
     */
    private StringBuffer payParams(Map<String, String> params, int type) throws UnsupportedEncodingException {
        List<String> keys = new ArrayList<String>(params.keySet());
        StringBuffer content = new StringBuffer();
        Collections.sort(keys);
        int index = 0;
        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);
            if (StringUtils.areNotEmpty(key, value)) {
                if (type == 0) {
                    content.append((index == 0 ? "" : "&") + key + "=" + value);
                } else {
                    content.append((index == 0 ? "" : "&") + key + "=" + URLEncoder.encode(value, AlipayParam.CHARSET));
                }
                index++;
            }
        }
        return content;
    }

    /**
     * 返回参数组装
     *
     * @param request
     * @return
     */
    public Map<String, String> convertResultStringToMap(HttpServletRequest request) {
        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用。
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        return params;
    }
}
