package com.example.service.pay.impl;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradeAppPayRequest;
import com.alipay.api.response.AlipayTradeAppPayResponse;
import com.example.service.pay.AlipayService;
import com.example.util.pay.AlipayParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

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
    public String getSign() {
        AlipayTradeAppPayResponse response = new AlipayTradeAppPayResponse();
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayParam.GATE,
                AlipayParam.APPID,
                AlipayParam.APP_PRIVATE_KEY,
                "json",
                AlipayParam.CHARSET,
                AlipayParam.ALIPAY_PUBLIC_KEY,
                "RSA2");

        //实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay
        AlipayTradeAppPayRequest request = new AlipayTradeAppPayRequest();
        //SDK已经封装掉了公共参数，这里只需要传入业务参数。以下方法为sdk的model入参方式(model和biz_content同时存在的情况下取biz_content)。
        AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
        model.setBody("我是测试数据");
        //订单名称，必填
        model.setSubject("App支付测试Java");
        //OutTradeNo只能为数字、英文或下划线,OutTradeNo不可以重复，若重复则会出现系统繁忙等错误  商户订单号
        model.setOutTradeNo("100342312764512");
        model.setTimeExpire("30m");
        // 付款金额，必填
        model.setTotalAmount("0.01");
        //销售产品码 必填 商品ID
        model.setProductCode("QUICK_MSECURITY_PAY");
        request.setBizModel(model);
        request.setNotifyUrl("商户外网可以访问的异步地址");
        try {
            //这里和普通的接口调用不同，使用的是sdkExecute
            response = alipayClient.sdkExecute(request);
            //就是orderString即为加签过的订单详情,可以直接给客户端请求，无需再做处理。
            System.out.println(response.getBody());
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return response.getBody();
    }

    @Override
    public String aliPayNotify(Map requestParams) {
        String result = "success";
        System.out.println("支付宝支付结果通知：" + requestParams.toString());
        Map<String, String> params = new HashMap<String,String>();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        // 切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
        // boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)

        try {
            boolean flag = AlipaySignature.rsaCheckV1(params, "", "RSA2");
            if (flag) {
                /*
                TODO 验签成功后
                按照支付结果异步通知中的描述，对支付结果中的业务内容进行1\2\3\4二次校验，校验成功后在response中返回success，校验失败返回failure
                 */
                if ("TRADE_SUCCESS".equals(params.get("trade_status"))) {
                    //付款金额
                    String amount = params.get("buyer_pay_amount");
                    //商户订单号
                    String out_trade_no = params.get("out_trade_no");
                    //支付宝交易号
                    String trade_no = params.get("trade_no");
                    //附加数据
                    String passback_params = URLDecoder.decode(params.get("passback_params"), "UTF-8");
                }
            } else {
                // TODO 验签失败则记录异常日志，并在response中返回failure.

                result = "failure";
            }
        } catch (AlipayApiException e) {
            log.error("支付异步通知失败", e);
            result = "failure";
        } catch (UnsupportedEncodingException e) {
            log.error("支付异步通知编码失败", e);
            result = "failure";
        }
        return result;
    }
}
