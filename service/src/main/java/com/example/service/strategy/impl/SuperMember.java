package com.example.service.strategy.impl;

import com.example.service.strategy.Strategy;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

/**
 * 超级会员计算价格
 *
 * @author Wei.Guang
 * @create 2019-01-17 9:53
 **/
@Component(value = "superMember")
public class SuperMember implements Strategy {

    /**
     * 超级会员打1折
     * @param price 价格
     * @param sale 打折
     * @return
     */
    @Override
    public BigDecimal calculatePrice(String price, String sale) {
        return new BigDecimal(price).multiply(new BigDecimal(sale));
    }
}
