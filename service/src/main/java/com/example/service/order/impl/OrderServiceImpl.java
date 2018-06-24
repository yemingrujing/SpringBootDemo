package com.example.service.order.impl;

import com.example.base.order.Order;
import com.example.service.order.OrderService;
import com.example.util.service.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<Order> selectOrder(Order order) {

        return list(order);
    }

    @Override
    public Order findOne(Order order) {
        return get(order);
    }

    @Override
    public int updateOrder(Order order) {
        return update(order);
    }
}
