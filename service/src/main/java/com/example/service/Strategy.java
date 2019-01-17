package com.example.service;

import java.math.BigDecimal;

/**
 * 策略者模式
 *
 * @author Wei.Guang
 * @create 2019-01-17 9:37
 **/
public interface Strategy {

    /**
     * 计算价格
     * @param price 价格
     * @param sale 打折
     * @return
     */
    BigDecimal calculatePrice(String price, String sale);
}
