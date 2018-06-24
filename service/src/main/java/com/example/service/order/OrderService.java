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

    /**
     * 查询订单
     * @param username
     * @return
     */
    List<Order> selectOrder(Order order);

    /**
     * 根据订单号查询订单
     * @param order
     * @return
     */
    Order findOne(Order order);

    /**
     *  更新订单
     * @param order
     * @return
     */
    int updateOrder(Order order);
}