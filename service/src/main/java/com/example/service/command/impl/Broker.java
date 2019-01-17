package com.example.service.command.impl;

import com.example.service.command.Order;
import org.springframework.stereotype.Service;

/**
 * 命令调用类
 *
 * @author Wei.Guang
 * @create 2019-01-17 11:40
 **/
@Service
public class Broker {

    public void placeOrders(Order order) {
        order.execute();
    }
}
