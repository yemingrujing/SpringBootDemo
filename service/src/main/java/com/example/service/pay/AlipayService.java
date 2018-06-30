package com.example.service.pay;

import java.util.Map;

/**
 * 支付宝支付接口
 *
 * @author Wei.Guang
 * @create 2018-06-28 9:28
 **/
public interface AlipayService {

    /**
     * 获取签名
     * @return
     */
    String getSign();

    /**
     * 支付回调函数
     * @param requestParams
     * @return
     */
    String aliPayNotify(Map requestParams);
}
