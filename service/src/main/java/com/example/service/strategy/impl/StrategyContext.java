package com.example.service.strategy.impl;

import com.example.service.strategy.Strategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 根据策略计算价格
 *
 * @author Wei.Guang
 * @create 2019-01-17 9:54
 **/
@Service
public class StrategyContext {

    private final Map<String, Strategy> strategyMap = new ConcurrentHashMap<>();

    /**
     * 注入所有实现了Strategy接口的Bean
     * @param strategyMap
     */
    @Autowired
    public StrategyContext(Map<String, Strategy> strategyMap) {
        this.strategyMap.clear();
        strategyMap.forEach((k, v) -> this.strategyMap.put(k, v));
    }

    /**
     * 计算价格
     * @param memberLevel 会员等级
     * @param price
     * @param sale
     * @return
     */
    public BigDecimal calculatePrice(String memberLevel, String price, String sale) {
        return strategyMap.get(memberLevel).calculatePrice(price, sale);
    }
}
