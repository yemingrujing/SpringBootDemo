package com.example.service.command.impl;

import com.example.service.command.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 订单创建
 *
 * @author Wei.Guang
 * @create 2019-01-17 15:25
 **/
@Component(value = "createOrder")
public class CreateOrder implements Order {

    @Autowired
    private Stock stock;

    @Override
    public void execute() {
        stock.create();
    }
}
