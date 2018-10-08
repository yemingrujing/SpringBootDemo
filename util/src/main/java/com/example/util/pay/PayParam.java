package com.example.util.pay;

/**
 * 支付所需参数
 *
 * @author Wei.Guang
 * @create 2018-06-19 14:51
 **/
public class PayParam {

    /**
     * 商户秘钥  32位，在微信商户平台中设置
     */
    public static final String APIKEY = "";

    public static final String APPID = "";

    public static final String MCHID = "";

    public static final String NOTIFYURL = "";

    /**
     * 预支付请求地址
     */
    public static final String PREPAYURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";

    /**
     * 支付订单查询
     */
    public static final String ORDERPAYQUERY = "https://api.mch.weixin.qq.com/pay/orderquery";

    /**
     * 申请退款
     */
    public static final String ORDERREFUND = "https://api.mch.weixin.qq.com/secapi/pay/refund";

    /**
     * 申请退款_查询
     */
    public static final String ORDERREFUNDQUERY = "https://api.mch.weixin.qq.com/pay/refundquery";
}
