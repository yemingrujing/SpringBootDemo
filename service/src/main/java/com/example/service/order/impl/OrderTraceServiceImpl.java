package com.example.service.order.impl;

import com.example.base.order.OrderTrace;
import com.example.mapper.order.OrderTraceMapper;
import com.example.service.order.OrderTraceService;
import com.example.util.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 订单轨迹
 *
 * @author Wei.Guang
 * @create 2018-06-24 15:59
 **/
@Service
public class OrderTraceServiceImpl extends BaseServiceImpl<OrderTrace> implements OrderTraceService {

    @Autowired
    private OrderTraceMapper orderTraceMapper;

    @Override
    public void saveTrace(String username, Long orderCode, String operate) {
        OrderTrace orderTrace = new OrderTrace();
        String hisTrace = orderTraceMapper.selectHisTrace(username, orderCode);
        Date date = new Date();
        orderTrace.setOrderCode(orderCode);
        orderTrace.setOperate(operate);
        orderTrace.setOpeTrace(hisTrace);
        orderTrace.setUsername(username);
        orderTrace.setCreateTime(date);
        save(orderTrace);
    }
}
