package com.example.util.pay;

/**
 * WXPAY变量
 *
 * @author Wei.Guang
 * @create 2018-11-02 9:49
 **/
public class WXpayConstants {

    /**
     * 商户秘钥  32位，在微信商户平台中设置
     */
    public static final String APIKEY = "apiKey";

    public static final String APPID = "appId";

    public static final String MCHID = "mchId";

    public static final String NOTIFYURL = "notifyUrl";

    /**
     * 预支付请求地址
     */
    public static final String  PREPAYURL = "prepayUrl";

    /**
     * 支付订单查询
     */
    public static final String ORDERPAYQUERY = "orderPayQuery";

    /**
     * 申请退款
     */
    public static final String ORDERREFUND = "orderRefund";

    /**
     * 申请退款_查询
     */
    public static final String ORDERREFUNDQUERY = "orderRefundQuery";
}
