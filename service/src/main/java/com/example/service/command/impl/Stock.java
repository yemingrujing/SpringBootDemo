package com.example.service.command.impl;

import org.springframework.stereotype.Component;

/**
 * 请求类
 *
 * @author Wei.Guang
 * @create 2019-01-17 11:29
 **/
@Component(value = "stock")
public class Stock {
    
    public void create() {
        System.out.println("create order!");
    }

    public void pay() {
        System.out.println("order pay!");
    }

    public void refund() {
        System.out.println("order refund!");
    }
}
