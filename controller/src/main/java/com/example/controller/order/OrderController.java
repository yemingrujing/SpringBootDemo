package com.example.controller.order;

import com.example.base.order.OrderItem;
import com.example.service.annotation.Handler;
import com.example.service.order.OrderService;
import com.example.util.common.JacksonUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
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
    private OrderService orderService;

    @GetMapping(value = "/order/export")
    @Handler
    public void export(HttpServletResponse response) {
        orderService.export(response);
    }

    @PostMapping(value = "/order/import")
    @Handler
    public void importExcel(@RequestParam("filename") MultipartFile filename) {
        orderService.importExcel(filename);
    }

    @GetMapping(value = "/order/downTemplate")
    @Handler
    public void downTemplate(HttpServletResponse response) {
        orderService.downTemplate(response);
    }
}
