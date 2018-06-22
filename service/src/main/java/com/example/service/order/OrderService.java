package com.example.service.order;

import com.example.base.order.Order;

import java.util.List;

/**
 * 订单接口
 *
 * @author Wei.Guang
 * @create 2018-06-22 14:02
 **/
public interface OrderService {

    /**
     * 创建订单
     * @param order
     */
    void addOrder(Order order);
}