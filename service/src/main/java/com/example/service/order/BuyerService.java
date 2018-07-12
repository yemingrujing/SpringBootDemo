package com.example.service.order;

import com.example.base.order.OrderItem;

import java.util.List;
import java.util.Map;

/**
 * 卖家_订单
 *
 * @author Wei.Guang
 * @create 2018-06-21 17:53
 **/
public interface BuyerService {

    /**
     * 创建订单
     * @param order
     * @return
     */
    Map<String, Object> create(String username, String phone, int addressId, List<OrderItem> orderItemList);

    /**
     * 订单列表
     * @param userId
     * @return
     */
    Map<String, Object> list(String username);

    Map<String, Object> findOne(String orderCOde);

    /**
     * 订单详情
     * @param orderCode
     * @return
     */
    Map<String, Object> detail(String orderCode);

    /**
     * 取消订单
     * @param orderCode
     * @return
     */
    Map<String, Object> cancel(String orderCode);

    /**
     * 订单已完成
     * @param OrderCode
     * @return
     */
    Map<String, Object> finsh(String orderCode);

    /**
     * 订单支付
     * @param orderCode
     * @return
     */
    Map<String, Object> paid(String orderCode);
}
