package com.example.service.order.impl;

import com.example.base.order.Goods;
import com.example.base.order.Order;
import com.example.base.order.OrderItem;
import com.example.mapper.order.GoodsMapper;
import com.example.service.config.RedisService;
import com.example.service.order.*;
import com.example.util.common.JacksonUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 卖家订单service
 *
 * @author Wei.Guang
 * @create 2018-06-21 18:20
 **/
@Service
@Slf4j
public class BuyerServiceImpl implements BuyerService {

    @Autowired
    private RedisService redisService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private SkuService skuService;

    @Override
    public Map<String, Object> create(int userId, int addressId, List<OrderItem> orderItemList) {
        Map<String, Object> result = new HashMap<String, Object>();
        Order order = new Order();
        Long orderCode = redisService.incrementHash("ORDER", "CREATE", 11L);
        BigDecimal orderAmount = new BigDecimal(BigInteger.ZERO);

        //查询商品数量(数量，价格)
        orderItemList.stream().forEach(orderItem -> {
            //根据spu,sku检查商品是否存在
            Goods goods = goodsService.findOne(orderItem.getSpuId());

            //查询商品库存，价格


        });

        orderItemList.stream().forEach(orderItem -> {
            orderItem.setOrderId(orderCode);
        });
        Date createTime = new Date();
        order.setUserId(userId);
        order.setAddress(addressId);
        order.setCreateTime(createTime);
        //创建订单信息
        orderService.addOrder(order);
        //保存订单详情
        orderItemService.addOrderItemList(orderItemList);
        return null;
    }

    @Override
    public Map<String, Object> list(Integer userId) {

        return null;
    }

    @Override
    public Map<String, Object> detail(Integer orderCode) {

        return null;
    }

    @Override
    public Map<String, Object> cancel(Integer orderCode) {

        return null;
    }
}
