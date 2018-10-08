package com.example.service.unionpay;

/**
 * chinapay支付
 */
public interface ChinaPayService {

    /**
     * 查询签约接口
     *
     * @param cardNo
     * @return
     */
    String querySign(String cardNo);
}
