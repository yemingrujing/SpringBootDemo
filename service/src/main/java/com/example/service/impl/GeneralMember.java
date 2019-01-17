package com.example.service.impl;

import com.example.service.Strategy;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

/**
 * 普通会员计算价格
 *
 * @author Wei.Guang
 * @create 2019-01-17 9:43
 **/
@Component(value = "generalMember")
public class GeneralMember implements Strategy {

    /**
     * 普通会员没有折扣，直接返回原价
     * @param price
     * @return
     */
    @Override
    public BigDecimal calculatePrice(String price, String sale) {
        return new BigDecimal(price).multiply(new BigDecimal(sale));
    }
}
