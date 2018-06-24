package com.example.controller.order;

import com.example.base.order.OrderItem;
import com.example.service.order.BuyerService;
import com.example.util.common.JacksonUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单
 *
 * @author Wei.Guang
 * @create 2018-06-22 14:55
 **/
@RestController
@Slf4j
public class OrderController {

    @Autowired
    private BuyerService buyerService;

    @PostMapping("/order/create")
    public Map<String, Object> create(String username, String phone, int addressId, String orderForm) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            List<OrderItem> orderItemList = JacksonUtils.json2list(orderForm, OrderItem.class);
            if (CollectionUtils.isEmpty(orderItemList)) {
                log.error("订单列表不能为空");
                result.put("info", "订单列表不能为空！");
                return result;
            }
            buyerService.create(username, phone, addressId, orderItemList);
        } catch (IOException e) {
            result.put("info", "订单创建失败,请联系管理员!");
            log.error("订单创建失败", e);
            return result;
        }
        result.put("info", "订单创建失败,请联系管理员!");
        return result;
    }
}
