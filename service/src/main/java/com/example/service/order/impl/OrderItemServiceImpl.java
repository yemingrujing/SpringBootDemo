package com.example.service.order.impl;

import com.example.mapper.order.OrderItemMapper;
import com.example.service.order.OrderItemService;
import com.example.util.service.BaseServiceImpl;
import com.example.base.order.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Wei.Guang
 * @create 2018-06-22 14:13
 **/
@Service
public class OrderItemServiceImpl extends BaseServiceImpl<OrderItem> implements OrderItemService {

    @Autowired
    private OrderItemMapper orderItemMapper;

    @Override
    public void addOrderItemList(List<OrderItem> orderItemList) {

    }
}
