package com.example.controller;

import com.example.base.enums.MemberLevelEnum;
import com.example.service.impl.StrategyContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

/**
 * 策略者模式
 *
 * @author Wei.Guang
 * @create 2019-01-17 10:02
 **/
@RestController
public class StrategyController {

    @Autowired
    private StrategyContext strategyContext;

    /**
     * 计算价格
     * @param level
     * @param price
     * @return
     */
    @GetMapping(value = "/strategy/calculatePrice")
    public BigDecimal calculatePrice(String level, String price) {
        return strategyContext.calculatePrice(MemberLevelEnum.getEnum(level).getName(), price, MemberLevelEnum.getEnum(level).getSale());
    }
}
