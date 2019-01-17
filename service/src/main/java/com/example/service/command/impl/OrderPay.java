package com.example.service.command.impl;

import com.example.service.command.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 订单支付
 *
 * @author Wei.Guang
 * @create 2019-01-17 15:35
 **/
@Component(value = "orderPay")
public class OrderPay implements Order {

    @Autowired
    private Stock stock;

    @Override
    public void execute() {
        stock.pay();
    }
}
