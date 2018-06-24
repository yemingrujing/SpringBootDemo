package com.example.service.order.impl;

import com.example.base.order.Goods;
import com.example.base.order.Order;
import com.example.base.order.OrderItem;
import com.example.base.order.Sku;
import com.example.service.config.RedisService;
import com.example.service.order.*;
import com.example.util.Enums.*;
import com.example.util.exception.OrderException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

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
    private OrderTraceService orderTraceService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private SkuService skuService;

    @Override
    public Map<String, Object> create(String username, String phone, int addressId, List<OrderItem> orderItemList) {
        Map<String, Object> result = new HashMap<String, Object>();
        Order order = new Order();
        Long orderCode = redisService.incrementHash("ORDER", "CREATE", 11L);
        BigDecimal orderAmount = new BigDecimal(BigInteger.ZERO);

        if (CollectionUtils.isEmpty(orderItemList)) {
            result.put("flag", "0");
            result.put("info", "订单不能为空");
            return result;
        }

        //查询商品数量(数量，价格)
        for (OrderItem orderItem : orderItemList) {
            //根据spu,sku检查商品是否存在
            Goods goods = goodsService.findOne(orderItem.getSpuId());
            if (goods == null) {
                throw new OrderException(OrderEnum.PRODUCT_NOT_EXIST);
            }
            //查询商品库存，价格
            Sku sku = skuService.findOne(orderItem.getSkuId());
            if (sku == null) {
                throw new OrderException(OrderEnum.PRODUCT_NOT_EXIST);
            }
            /*
            商品存在，计算总价
             */
            orderAmount = orderItem.getActPrice()
                    .multiply(new BigDecimal(orderItem.getNum()))
                    .add(orderAmount);
            orderItem.setOrderId(orderCode);
            //订单详情入库
            orderItemService.saveOrdeItem(orderItem);
            //扣库存

            //sku销量和spu销量修改

        }

        Date createTime = new Date();
        order.setUserName(username);
        order.setPhone(phone);
        order.setPayment(orderAmount);
        order.setAddress(addressId);
        order.setCreateTime(createTime);
        //创建订单信息
        orderService.addOrder(order);
        //保存订单轨迹
        orderTraceService.saveTrace(username, orderCode, OrderTraceEnum.CREATE.getMessage());
        result.put("result", "0");
        result.put("info", "订单创建成功！");
        return result;
    }

    @Override
    public Map<String, Object> list(String username) {
        Map<String, Object> result = new HashMap<String, Object>();
        Order order =  new Order();
        order.setUserName(username);
        order.setOrderType(0);
        List<Order> list = orderService.selectOrder(order);
        result.put("flag", "0");
        result.put("orderItemList", list);
        return result;
    }

    @Override
    public Map<String, Object> findOne(Long orderCode) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (orderCode == null) {
            throw new OrderException(OrderEnum.ORDER_NOT_EXIST);
        }
        Order qCondition =  new Order();
        qCondition.setOrderCode(orderCode);
        Order order = orderService.findOne(qCondition);
        result.put("flag", "0");
        result.put("orderI", order);
        return result;
    }


    @Override
    public Map<String, Object> detail(Long orderCode) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (orderCode == null) {
            log.error("订单不存在！");
            throw new OrderException(OrderEnum.ORDERDETAIL_NOT_EXIST);
        }
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderId(orderCode);
        List<OrderItem> list = orderItemService.selectOrderItem(orderItem);
        if (CollectionUtils.isEmpty(list)) {
            log.error("订单详情为空！");
            throw new OrderException(OrderEnum.ORDERDETAIL_NOT_EXIST);
        }
        result.put("flag", "0");
        result.put("detail", list);
        return result;
    }

    @Override
    public Map<String, Object> cancel(Long orderCode) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (orderCode == null) {
            log.error("订单不存在！");
            throw new OrderException(OrderEnum.ORDERDETAIL_NOT_EXIST);
        }
        Order qCondition = new Order();
        qCondition.setOrderCode(orderCode);
        Order order = orderService.findOne(qCondition);

        //判断订单状态
        if (!order.getOrderStatus().equals(OrderTypeEnum.NEW.getCode())) {
            log.error("订单状态错误！");
            throw new OrderException(OrderEnum.ORDER_STATUS_ERROR);
        }

        //修改订单状态
        order.setOrderType(OrderTypeEnum.CANCEL.getCode());
        order.setOrderStatus(OrderStatusEnum.COLSED.getCode());
        int i = orderService.updateOrder(order);
        if (i <= 0) {
            log.error("取消订单更新失败！");
            throw new OrderException(OrderEnum.ORDER_UPDATE_FAIL);
        }
        //返回库存

        //如果已支付，需要退款

        //保存订单轨迹
        orderTraceService.saveTrace(order.getUserName(), orderCode, OrderTraceEnum.CANCEL.getMessage());
        result.put("result", "0");
        result.put("info", "订单取消成功！");
        return result;
    }

    @Override
    public Map<String, Object> finsh(Long orderCode) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (orderCode == null) {
            log.error("订单不存在！");
            throw new OrderException(OrderEnum.ORDERDETAIL_NOT_EXIST);
        }
        Order qCondition = new Order();
        qCondition.setOrderCode(orderCode);
        Order order = orderService.findOne(qCondition);

        //判断订单状态
        if (!order.getOrderStatus().equals(OrderTypeEnum.NEW.getCode())) {
            log.error("订单状态错误！");
            throw new OrderException(OrderEnum.ORDER_STATUS_ERROR);
        }
        //修改订单状态
        order.setOrderType(OrderTypeEnum.FINISHED.getCode());
        order.setOrderStatus(OrderStatusEnum.SUCCESS.getCode());
        int i = orderService.updateOrder(order);
        if (i <= 0) {
            log.error("取消订单更新失败！");
            throw new OrderException(OrderEnum.ORDER_UPDATE_FAIL);
        }
        //保存订单轨迹
        orderTraceService.saveTrace(order.getUserName(), orderCode, OrderTraceEnum.SUCCESS.getMessage());
        result.put("result", "0");
        result.put("info", "订单已完成！");
        return result;
    }

    @Override
    public Map<String, Object> paid(Long orderCode) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (orderCode == null) {
            log.error("订单不存在！");
            throw new OrderException(OrderEnum.ORDERDETAIL_NOT_EXIST);
        }
        Order qCondition = new Order();
        qCondition.setOrderCode(orderCode);
        Order order = orderService.findOne(qCondition);

        //判断订单状态
        if (!order.getOrderStatus().equals(OrderTypeEnum.NEW.getCode())) {
            log.error("订单状态错误！");
            throw new OrderException(OrderEnum.ORDER_STATUS_ERROR);
        }
        if (!order.getPayStatus().equals(PayStatusEnum.WAIT)) {
            log.error("订单支付状态错误！");
            throw new OrderException(OrderEnum.ORDER_PAY_STATUS_ERROR);
        }

        //修改支付状态
        order.setPayStatus(PayStatusEnum.SUCCESS.getCode());
        orderService.updateOrder(order);
        //保存订单轨迹
        orderTraceService.saveTrace(order.getUserName(), orderCode, OrderTraceEnum.PAID.getMessage());
        result.put("result", "0");
        result.put("info", "订单支付完成！");
        return result;
    }
}
