package com.example.service.order.impl;

import com.alibaba.fastjson.JSON;
import com.example.base.dto.OrderDTO;
import com.example.base.dto.UserDTO;
import com.example.base.order.Order;
import com.example.service.order.OrderService;
import com.example.util.common.FileUtil;
import com.example.util.service.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Wei.Guang
 * @create 2018-06-22 14:07
 **/
@Service
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService {


    @Override
    public void addOrder(Order order) {
        save(order);
    }

    @Override
    public List<Order> selectOrder(Order order) {

        return list(order);
    }

    @Override
    public Order findOne(Order order) {
        return get(order);
    }

    @Override
    public int updateOrder(Order order) {
        return update(order);
    }

    @Override
    public void importExcel(MultipartFile file) {
        List<OrderDTO> orderDTOS = FileUtil.importExcel(file, 1, 1, OrderDTO.class);
        List<Order> orders = JSON.parseArray(JSON.toJSONString(orderDTOS), Order.class);
        System.out.println("导入数据一共【" + orders.size() + "】行");
    }

    @Override
    public void export(HttpServletResponse response) {
        List<Order> orders = selectAll();
        List<OrderDTO> orderDTOS = JSON.parseArray(JSON.toJSONString(orders), OrderDTO.class);
        FileUtil.exportExcels(orderDTOS, "订单物流信息", "订单物流信息", OrderDTO.class, "订单物流信息.xlsx", response);
    }

    @Override
    public void downTemplate(HttpServletResponse response) {
        List<OrderDTO> orderDTOS = new ArrayList<>();
        FileUtil.exportExcels(orderDTOS, "订单物流信息", "订单物流信息", OrderDTO.class, "订单物流信息.xlsx", response);
    }


}
