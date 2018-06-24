package com.example.service.order;

import com.example.base.order.OrderTrace;

/**
 * 订单轨迹接口
 *
 * @author Wei.Guang
 * @create 2018-06-24 15:30
 **/
public interface OrderTraceService {

    /**
     * 保存操作轨迹
     * @param username
     * @param orderCode
     * @param operate
     */
    void saveTrace(String username, Long orderCode, String operate);
}
