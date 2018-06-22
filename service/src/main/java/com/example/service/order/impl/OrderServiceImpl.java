package com.example.service.order.impl;

import com.example.base.order.Order;
import com.example.service.order.OrderService;
import com.example.util.service.BaseServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author Wei.Guang
 * @create 2018-06-22 14:07
 **/
@Service
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService {


    @Override
    public void addOrder(Order order) {
        save(order);
    }
}
