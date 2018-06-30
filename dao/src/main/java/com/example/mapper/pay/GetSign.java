package com.example.mapper.pay;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeAppPayModel;
import com.alipay.api.request.AlipayTradeAppPayRequest;
import com.alipay.api.response.AlipayTradeAppPayResponse;

/**
 * 获取加签后的订单详情
 *
 * @author Wei.Guang
 * @create 2018-06-28 9:08
 **/
public class GetSign {

    //支付宝支付业务：入参app_id
    public static final String APPID = "";

    //支付宝网关
    public static final String GATE = "https://openapi.alipay.com/gateway.do";

    //支付宝私钥
    public static final String APP_PRIVATE_KEY = "";

    //支付宝公钥
    public static final String ALIPAY_PUBLIC_KEY = "";

    //编码方式
    public static final String CHARSET = "UTF-8";

    public static AlipayTradeAppPayResponse response;

    public static String getSign() {
        AlipayClient alipayClient = new DefaultAlipayClient(GATE,
                APPID,
                APP_PRIVATE_KEY,
                "json",
                CHARSET,
                ALIPAY_PUBLIC_KEY,
                "RSA2");

        //实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay
        AlipayTradeAppPayRequest request = new AlipayTradeAppPayRequest();
        //SDK已经封装掉了公共参数，这里只需要传入业务参数。以下方法为sdk的model入参方式(model和biz_content同时存在的情况下取biz_content)。
        AlipayTradeAppPayModel model = new AlipayTradeAppPayModel();
         model.setBody("我是测试数据");
         model.setSubject("App支付测试Java");
         //OutTradeNo只能为数字、英文或下划线,OutTradeNo不可以重复，若重复则会出现系统繁忙等错误
         model.setOutTradeNo("100342312764512");
         model.setTimeExpire("30m");
         model.setTotalAmount("0.01");
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
}
