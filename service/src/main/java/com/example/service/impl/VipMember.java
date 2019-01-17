package com.example.service.impl;

import com.example.service.Strategy;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

/**
 * VIP会员计算价格
 *
 * @author Wei.Guang
 * @create 2019-01-17 9:46
 **/
@Component(value = "vipMember")
public class VipMember implements Strategy {


    /**
     *  VIP会员打8折
     * @param price
     * @return
     */
    @Override
    public BigDecimal calculatePrice(String price, String sale) {
        return new BigDecimal(price).multiply(new BigDecimal(sale));
    }
}
