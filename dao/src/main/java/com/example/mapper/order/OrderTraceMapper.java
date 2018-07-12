package com.example.mapper.order;

import com.example.base.order.OrderTrace;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface OrderTraceMapper extends Mapper<OrderTrace> {

    String selectHisTrace(@Param("username") String username, @Param("orderCode") String orderCode);
}