package com.example.controller;

import com.example.service.command.impl.Broker;
import com.example.service.command.impl.CreateOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 命令模式
 *
 * @author Wei.Guang
 * @create 2019-01-17 16:04
 **/
@RestController
public class CommandController {

    @Autowired
    private CreateOrder createOrder;

    @Autowired
    private Broker broker;

    @GetMapping(value = "/command/run")
    public void run() {
        broker.placeOrders(createOrder);
    }
}
