package com.example.util.pay;

/**
 * 支付宝支付参数
 *
 * @author Wei.Guang
 * @create 2018-06-28 11:17
 **/
public class AlipayParam {

    /**
     * 支付宝支付业务：入参app_id
     */
    public static final String APPID = "2016091900544640";

    /**
     * 支付宝网关
     */
    public static final String GATE = "https://openapi.alipaydev.com/gateway.do";

    /**
     * 应用私钥
     */
    public static final String APP_PRIVATE_KEY = "MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQCWsIYoxjLFABWDkufoZ3RBdy2B7pzl/CRhmLGHny8V5qksYFgT38oQW9kn+XMvmJEYY7U6ol9tOE/Bij5szXtudgkcijKrRbcKw3gK/vI4fcH5RIfwZEEiwmHm0kQBLU0uNIhUaxIczA6mCSuTl5llCPXuTyxOtGU0fvE2ZAFaDog2PMztoVJD0yCzVeIUqNMqDLMP+gcCLpSbrZvQtwwa6PvyYvh4cfm52sUi05+zgYYh+e23E0GotUHmj4yA/Af/uBKyFiUjJs9BVZnFc/nNb2OKWAWRECslfsQrvJt1EtOuDuDhnQotET+Hh8N/pyb/fVUDq7meN/z97gIGcyGNAgMBAAECggEBAIhymVisd2ZY+CIm0OVpYCSzVLq1pM6/rPXOvNowcwNi1McBCmAcoSyE7rK6tulfPesWxhCs3LnaZqW6l2IQAnd4XDHClbTusJsHeliCmDQ883rR6kHrletylhHbTYa/TYbMPLIsLb9zqsP/w7ymZljNb1t1x4oQ4R9S3vpAPdUbtXozGooRmOBJzUhki0bdYoYJoLOhaoHogl2/vWy7cffIzwU9yVrPYKkOqmLhe0jAaahL9FVU+vKHfJy+cRsbihWFYaYZ94e8sWKtI9n71CHDYneoFG/Ul0VjD9UJnt4UGQ09NuUEU1NgLJGdCFrv9OEqGJDB9KshBsvONhQ39YUCgYEAzaoVz2BXSLVk3oOfNMp8+rb/AbPX0L6KD8wzqcMQ2AxiarOAq2kTW1rEVGO+SIdRatfisNatC404Z+3Vgi7wTFncmxhJ5hDaI0nIKDafKz7j/Bn19Xf0ZxHGDxyrl0T+xVPuQr32HYm/m1G7l7DMNdlME5s5YATC5ikOyDQbVusCgYEAu5H8jAxMb6QeOpWeC8Mw0D4YaOBm2HhNamL9ZeazFgFN89kr7Zunk+Ho4jincFSN7qea3X/NDJ9nrrlE2pAuNpS4cAPM/W2W4QWpOQyw2H07ChKv4G4JQkNc4obnntwc18nRSwfppn2pIuOLymIJIbpAAGge8oxtJ/9NsmKBO2cCgYEAtdiM3kbmBlD1NlYVAB2GMjx576xvx4+iDWPVzmW+z/jrUEMVIvqOdfkknSVwSzryv1DRjODUMuGUHTjKzwfnyuqtx6jLNpRx/D+xrfTV+evqs67Urk15GWU6xYPpKKCF0D5s7jB+nBF/DLtQ7kgR2A8hWDiom4C6P73P5y9DeS8CgYEAppyIfkY2Zzya9WMNXllltLRTrmUWNda2vXdsquV/0l4aRi50TL1k34FeAgRdBvS0lnceov3wv/Ogf51mQdasliMIqcdWgQ6lZQBITrqtI8Apf0sWGv7jDo8TpMw8VeojXLKSTFmc/BzG7oy9EWp/vgvY6gOS6dQ+6bZn57qEHKUCgYEAgr6cjcpHqQLrW7RCcuGC3pfV8b6h/QLRqsMqwSDIFApCugjkIVfie08qogpZ1US4dlgb0A36vLFNNJT+gL8mg4WdiNQuoRn7jDS6fR5TpnYYkDFw+oMCUXsVns1JdRb5yz5sfPGCwTpPfT5LasuieqQdljisN4yz2JfqcAxdapI=";

    /**
     * 支付宝公钥
     */
    public static final String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyqDRvP0dneNw70pY+ygzSiVW3upfPq74I5EblvwlLYTBAk7rZ4n+kbrOWQ3musPHQ8tgEIH9dO7cMvB8yj/zMa5D+4DqenqJ3Zz2xIYJkuECGd0cf1BsbsKlEqDf9NZdg9fcYTwcSAcNHk/cOHeytU619k78/kEbHAqCB9q6nKS59t0/l48ajqdfiE+do8kl2BaG6KawH/qL5i9VQByEY5BnRdcJrwKLzODwFtsIGtIa5wHhQJgCIzDqwk3UxhOsGFbVzXI3JaHK4qK0abl9walFjPMBfmy//23vV7v+AmnBkR7U/WvbBUrX21hr0X7iWUkrpNE7eOz3holyE9u5iwIDAQAB";

    /**
     * 编码方式
     */
    public static final String CHARSET = "utf-8";

    /**
     * 返回格式
     */
    public static final String FORMAT = "JSON";

    /**
     * 支付异步回调地址
     */
    public static final String PAY_NOTIFY_URL = "http://180.175.0.40:7000/ba/pay/aliPayNotify";

    /**
     * 旁听支付异步回调地址
     */
    public static final String SIGN_PAY_NOTIFY_URL = "http://180.175.0.40:7000/ba/pay/signAlipayNotify";

    /**
     * 支付退款异步回调地址
     */
    public static final String REFUND_NOTIFY_URL = "http://180.175.0.40:7000/ba/pay/refundAliPayNotify";

    /**
     * 签名方式
     */
    public static final String SIGN_TYPE  = "RSA2";

    /**
     * 当前调用接口名称
     */
    public static final String APP_METHOD = "alipay.trade.app.pay";

    /**
     * 当前调用接口名称
     */
    public static final String WAP_METHOD = "alipay.trade.wap.pay";

    /**
     * 版本
     */
    public static final String VERSION = "1.0";

    /**
     * wap网页支付同步地址
     */
    public static final String RETURN_URL = "http://www.baidu.com";
}
