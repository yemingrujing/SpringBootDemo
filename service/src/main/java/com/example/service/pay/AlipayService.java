package com.example.service.pay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;

/**
 * 支付宝支付接口
 *
 * @author Wei.Guang
 * @create 2018-06-28 9:28
 **/
public interface AlipayService {

    /**
     * 获取签名
     * @param orderCode
     * @param subject
     * @param totalFee
     * @param method
     * @param passbackParams 	公用回传参数，如果请求时传递了该参数，则返回给商户时会回传该参数。
     *                          支付宝会在异步通知时将该参数原样返回。本参数必须进行UrlEncode之后才可以发送给支付宝
     * @param notifyUrl
     * @return
     * @throws UnsupportedEncodingException
     */
    String getSign(String orderCode, String subject, BigDecimal totalFee,
                   String passbackParams, String method, String notifyUrl) throws UnsupportedEncodingException;

    /**
     * 支付宝回调函数
     *
     * @param request
     * @return
     */
    void aliPayNotify(HttpServletRequest request, HttpServletResponse response);

    /**
     * 旁听支付回调
     * @param request
     * @param response
     */
    void signAlipayNotify(HttpServletRequest request, HttpServletResponse response);

    /**
     * 退款回调函数
     * @param request
     * @param response
     */
    void refundAliPayNotify(HttpServletRequest request, HttpServletResponse response);

    /**
     * 订单退款
     *
     * @param tradeNo
     * @param refundReason
     * @return
     */
    boolean refundOrder(String tradeNo, String refundReason);

    /**
     * 手机网站支付
     * @param response
     */
    void wapPay(HttpServletResponse response);
}
