package com.example.util.exception;

import com.example.util.Enums.OrderEnum;

/**
 * 订单自定义异常
 *
 * @author Wei.Guang
 * @create 2018-06-22 18:13
 **/
public class OrderException extends RuntimeException {

    private Integer code;

    public OrderException(OrderEnum orderEnum) {
        super(orderEnum.getMessage());
        this.code = orderEnum.getCode();
    }

    public OrderException(Integer code, String message) {
        super(message);
        this.code = code;
    }
}
