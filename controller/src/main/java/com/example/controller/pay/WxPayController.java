package com.example.controller.pay;

import com.example.util.common.StringUtil;
import com.example.util.common.XMLUtil;
import com.example.util.pay.PayCommonUtil;
import com.example.util.pay.PayParam;
import lombok.extern.slf4j.Slf4j;
import org.jdom2.JDOMException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.math.BigDecimal;
import java.util.*;

/**
 * 微信支付
 *
 * @author Wei.Guang
 * @create 2018-06-19 14:13
 **/
@RestController
@RequestMapping("/pay")
@Slf4j
public class WxPayController {

    /**
     * 微信统一下单接口
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = {"/wxPrePay"}, method = RequestMethod.POST)
    public Map<String, Object> wxPrePay(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        //根据订单id查询订单信息

        //获取订单应支付价格
        String price = "";
        int price100 = new BigDecimal(price).multiply(new BigDecimal(100)).intValue();
        if (price100 <= 0) {
            resultMap.put("msg", "付款金额错误");
            resultMap.put("code", "500");
            return resultMap;
        }
        //设置回调地址 - 获取当前的地址拼接回调地址
        String url = request.getRequestURL().toString();
        String domain = url.substring(0, url.length() - 13);
        //生产环境
        String notify_url = domain + "wxNotify";
        //测试环境
//        String notify_url  = "http://1f504p5895.51mypc.cn/cia/app/wxNotify";

        SortedMap<Object, Object> parameters = new TreeMap<Object, Object>();
        parameters.put("appid", PayParam.APPID);
        parameters.put("mch_id", PayParam.MCHID);
        parameters.put("nonce_str", PayCommonUtil.CreateNoncestr());
        parameters.put("body", "购买测试");
        //订单id
        parameters.put("out_trade_no", "");
        parameters.put("fee_type", "CNY");
        parameters.put("total_fee", String.valueOf(price100));
        parameters.put("spbill_create_ip", PayCommonUtil.getLocalIp(request));
        parameters.put("notify_url", PayParam.NOTIFYURL);
        parameters.put("trade_type", "APP");
        //设置签名
        String sign = PayCommonUtil.createSign("UTF-8", parameters);
        parameters.put("sign", sign);
        //封装请求参数
        String requestXML = PayCommonUtil.getRequestXml(parameters);
        //调用统一接口
        String result = PayCommonUtil.httpsRequest(PayParam.PREPAYURL, "POST", requestXML);
        System.out.println("/n" + result);
        try {
            Map<String, String> map = XMLUtil.doXMLParse(result);
            SortedMap<Object, Object> parameterMap2 = new TreeMap<Object, Object>();
            parameterMap2.put("appid", PayParam.APPID);
            parameterMap2.put("partnerid", PayParam.MCHID);
            parameterMap2.put("prepayid", map.get("prepay_id"));
            parameterMap2.put("package", "Sign=WXPay");
            parameterMap2.put("package", PayCommonUtil.CreateNoncestr());
            //本来生成的时间戳是13位，但是ios必须是10位，所以截取了一下
            parameterMap2.put("timestamp", Long.parseLong(String.valueOf(System.currentTimeMillis()).toString().substring(0,10)));
            String sign2 = PayCommonUtil.createSign("UTF-8", parameterMap2);
            parameterMap2.put("sign", sign2);
            resultMap.put("code", 200);
            resultMap.put("msg", parameterMap2);
        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return resultMap;
    }

    /**
     * 微信异步通知
     *
     * @param request
     * @param response
     */
    @RequestMapping(value = {"/wxNotify"}, method = RequestMethod.POST)
    public void wxNotifu(HttpServletRequest request, HttpServletResponse response) throws IOException, JDOMException {
        //读取参数
        InputStream inputStream;
        StringBuffer sb = new StringBuffer();
        inputStream = request.getInputStream();
        String s;
        BufferedReader in =  new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        while((s = in.readLine()) != null) {
            sb.append(s);
        }
        in.close();
        inputStream.close();
        //解析xml成map
        Map<String, String> m = new HashMap<String, String>();
        m = XMLUtil.doXMLParse((sb.toString()));
        for(Object keyValue : m.keySet()) {
            System.out.println(keyValue + "=" + m.get(keyValue));
        }
        //过滤空，设置TreeMap
        SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>();
        Iterator it = m.keySet().iterator();
        while (it.hasNext()) {
            String parameter = (String) it.next();
            String  parameterValue = m.get(parameter);

            String  v = "";
            if(null != parameterValue) {
                v = parameterValue.trim();
            }
            packageParams.put(parameter, v);
        }
        //判断签名是否正确
        String resXml = "";
        if (PayCommonUtil.isTenpaySign("UTF-8", packageParams)) {
            if("SUCCESS".equals(packageParams.get("result_code"))) {
//                //支付成功
//                //执行自己的业务逻辑
//                String mch_id = (String) packageParams.get("mch_id"); //商户号
//                String openid = (String) packageParams.get("openid");  //用户标识
//                String out_trade_no = (String) packageParams.get("out_trade_no"); //商户订单号
//                String total_fee = (String) packageParams.get("total_fee");
//                String transaction_id = (String) packageParams.get("transaction_id"); //微信支付订单号
//                //根据订单号查询订单信息
//                GoodsTrade gt = new GoodsTrade();
//                gt.setTid(out_trade_no);
//                GoodsTrade trade = 订单查询;
//                if (!PayParam.MCHID.equals(mch_id) || trade == null || new BigDecimal(total_fee).compareTo(new BigDecimal(trade.getPrice()).multiply(new BigDecimal(100))) != 0) {
//                    log.info("支付失败,错误信息：" + "参数错误");
//                    resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
//                            + "<return_msg><![CDATA[参数错误]]></return_msg>" + "</xml> ";
//                } else {
//                    if ("no_pay".equals(trade.getPayStatus()) && "wait_buyer_pay".equals(trade.getStatus())) {//支付的价格
//                        //订单状态的修改。根据实际业务逻辑执行
//
//
//                        resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
//                                + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
//
//                    } else {
//                        resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
//                                + "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
//                        log.info("订单已处理");
//                    }
//                }
            } else {
                log.info("支付失败,错误信息：" + packageParams.get("err_code"));
                resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                        + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
            }
        } else {
            resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
                    + "<return_msg><![CDATA[通知签名验证失败]]></return_msg>" + "</xml> ";
            log.info("通知签名验证失败");
        }

        /**
         * 处理业务完毕
         */
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        out.write(resXml.getBytes());
        out.flush();
        out.close();
    }

    /**
     * 查询支付结果
     * @param request
     * @param response
     * @param tradeno 微信交易订单号
     * @param orderno 商品订单号
     * @param callback
     */
    @RequestMapping(value = {"/wxPayQuery"}, method = RequestMethod.POST)
    public Map<String, Object> wxPayQuery(HttpServletRequest request, HttpServletResponse response, String tradeno, String orderno, String callback) {
        Map<String, Object> result = new HashMap<String, Object>();
        log.info("查询支付结果");
        if (StringUtil.isEmpty(tradeno) && StringUtil.isEmpty(orderno)) {
            result.put("info", "订单号不能为空");
            return result;
        }
        Map<String, String> restMap = null;
        SortedMap<Object, Object> param = new TreeMap<Object, Object>();
        param.put("appid", PayParam.APPID);
        param.put("mch_id", PayParam.MCHID);
        param.put("transaction_id", tradeno);
        param.put("out_trade_no", orderno);
        param.put("nonce_str", PayCommonUtil.CreateNoncestr());
        param.put("sign", PayCommonUtil.createSign("UTF-8", param));
        String requestXML = PayCommonUtil.getRequestXml(param);
        String restXML = PayCommonUtil.httpsRequest(PayParam.ORDERPAYQUERY, "UTF-8", requestXML);
        try {
            Map<String, String> map = XMLUtil.doXMLParse(restXML);
            if (!map.isEmpty() && "success".equals(map.get("result_code"))) {
                result.put("info", "订单支付成功");
                return result;
            } else {
                result.put("info", "订单支付失败");
                result.put("err_code", map.get("err_code"));
                result.put("err_code_des", map.get("err_code_des"));
                return result;
            }
        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        result.put("info", "查询支付结果失败，请联系管理员！");
        return result;
    }

    /**
     * 订单退款 需要双向证书验证
     * @param request
     * @param response
     * @param tradeno 微信订单号
     * @param orderno 商家订单号
     */
    @RequestMapping(value = {"/wxPayRefund"}, method = RequestMethod.POST)
    public Map<String, Object> wxPayRefund(HttpServletRequest request, HttpServletResponse response, String tradeno, String orderno) {
        log.info("微信退款");
        Map<String, Object> result = new HashMap<String, Object>();
        if (StringUtil.isEmpty(tradeno) && StringUtil.isEmpty(orderno)) {
            result.put("info", "订单号不能为空");
        }

        Map<String, String> restmap = null;
        SortedMap<Object, Object> param = new TreeMap<Object, Object>();
        param.put("appid", PayParam.APPID);
        param.put("mch_id", PayParam.MCHID);
        param.put("nonce_str", PayCommonUtil.CreateNoncestr());
        param.put("transaction_id", tradeno);
        //订单号
        param.put("out_trade_no", orderno);
        //退款单号
        param.put("out_refund_no", PayCommonUtil.getRefundNo());
        //订单总金额 从业务逻辑获取
        param.put("total_fee", "10");
        //退款金额
        param.put("refund_fee", "10");
        param.put("op_user_id", PayParam.MCHID);
        //退款方式
        param.put("refund_account", "REFUND_SOURCE_RECHARGE_FUNDS");
        param.put("sign", PayCommonUtil.createSign("UTF-8", param));
        String resultXML = PayCommonUtil.getRequestXml(param);
        String restXML = PayCommonUtil.httpsRequest(PayParam.ORDERREFUND, "UTF-8", resultXML);
        try {
            restmap = XMLUtil.doXMLParse(restXML);
            Map<String, String> refundMap = new HashMap<String, String>();
            if(!restmap.isEmpty() && "SUCCESS".equals(restmap.get("result_code"))) {
                refundMap.put("transaction_id", restmap.get("transaction_id"));
                refundMap.put("out_trade_no", restmap.get("out_trade_no"));
                refundMap.put("refund_id", restmap.get("refund_id"));
                refundMap.put("out_refund_no", restmap.get("out_refund_no"));
                result.put("info", "退款成功");
                result.put("refundMap", refundMap);
                return result;
            } else {
                result.put("info", "订单退款失败");
                result.put("err_code", restmap.get("err_code"));
                result.put("err_code_des", restmap.get("err_code_des"));
                return result;
            }
        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        result.put("info", "退款失败，请联系管理员！");
        return result;
    }

    /**
     * 订单退款查询
     * @param request
     * @param response
     * @param refundid 微信退款号
     * @param refundno 商家退款号
     * @param tradeno 微信订单号
     * @param orderno 商户订单号
     * @return
     */
    @RequestMapping(value = {"/wxPayReFundQuery"}, method = RequestMethod.POST)
    public Map<String, Object> wxPayReFundQuery(HttpServletRequest request, HttpServletResponse response, String refundid, String refundno, String tradeno, String orderno) {
        log.info("微信退款查询");
        Map<String, Object> result = new HashMap<String, Object>();
        if (StringUtil.isEmpty(refundid) && StringUtil.isEmpty(refundno)
                && StringUtil.isEmpty(tradeno) && StringUtil.isEmpty(orderno)) {
            result.put("info", "退单号或订单号不能为空！");
        }
        Map<String, String> restMap = null;
        SortedMap<Object, Object> param = new TreeMap<Object, Object>();
        param.put("appid", PayParam.APPID);
        param.put("mch_id", PayParam.MCHID);
        param.put("transaction_id", tradeno);
        param.put("out_trade_no", orderno);
        param.put("refund_id", refundid);
        param.put("out_refund_no", refundno);
        param.put("nonce_str", PayCommonUtil.CreateNoncestr());
        param.put("sign", PayCommonUtil.createSign("UTF-8", param));
        String restXML = PayCommonUtil.httpsRequest(PayParam.ORDERREFUNDQUERY, "UTF-8", PayCommonUtil.getRequestXml(param));
        try {
            restMap = XMLUtil.doXMLParse(restXML);
            Map<String, String> refundMap = new HashMap<>();
            if(!restMap.isEmpty() && "SUCCESS".equals(restMap.get("result_code"))) {
                // 订单退款查询成功 处理业务逻辑
                log.info("退款订单查询：订单" + restMap.get("out_trade_no") + "退款成功，退款状态" + restMap.get("refund_status_0"));
                refundMap.put("transaction_id", restMap.get("transaction_id"));
                refundMap.put("out_trade_no", restMap.get("out_trade_no"));
                refundMap.put("refund_id", restMap.get("refund_id_0"));
                refundMap.put("refund_no", restMap.get("out_refund_no_0"));
                refundMap.put("refund_status", restMap.get("refund_status_0"));
                result.put("info", "订单退款成功");
                result.put("refundMap", refundMap);
                return result;
            } else {
                result.put("info", "订单退款失败");
                result.put("err_code", restMap.get("err_code"));
                result.put("err_code_des", result.get("err_code_des"));
                return result;
            }
        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        result.put("info", "查询退款信息失败，请联系管理员！");
        return result;
    }
}
