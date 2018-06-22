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
    Map<String, Object> create(int userId, int addressId, List<OrderItem> orderItemList);

    /**
     * 订单列表
     * @param userId
     * @return
     */
    Map<String, Object> list(Integer userId);

    /**
     * 订单详情
     * @param orderCode
     * @return
     */
    Map<String, Object> detail(Integer orderCode);

    /**
     * 取消订单
     * @param orderCode
     * @return
     */
    Map<String, Object> cancel(Integer orderCode);
}
