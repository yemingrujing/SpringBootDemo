package com.example.mapper.order;


import com.example.base.order.OrderItem;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface OrderItemMapper extends Mapper<OrderItem> {

    void addOrderItemList(@Param("orderItemList") List<OrderItem> orderItemList);
}