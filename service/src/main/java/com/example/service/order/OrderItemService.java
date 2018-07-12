package com.example.service.order;


import com.example.base.order.OrderItem;

import java.util.List;

/**
 * 订单明细接口
 *
 * @author Wei.Guang
 * @create 2018-06-22 14:03
 **/
public interface OrderItemService {

    /**
     * 保存订单信息
     * @param orderItemList
     */
    void addOrderItemList(List<OrderItem> orderItemList);

    void saveOrdeItem(OrderItem orderItem);

    List<OrderItem> selectOrderItem(OrderItem orderItem);

    OrderItem selectOne(OrderItem orderItem);

    //加库存
    void increaseStock(List<OrderItem> cartDTOList);

    //减库存
    void decreaseStock(List<OrderItem> cartDTOList);
}
