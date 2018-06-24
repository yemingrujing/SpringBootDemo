package com.example.util.Enums;

import lombok.Getter;

import java.security.MessageDigest;

/**
 * 订单状态
 *
 * @author Wei.Guang
 * @create 2018-06-24 13:58
 **/
@Getter
public enum OrderStatusEnum {

    UNDELIVERED(0, "未发货"),
    DELIVERED(1, "已发货"),
    SUCCESS(2, "订单完成"),
    COLSED(3, "订单关闭");

    private Integer code;
    private String message;

    OrderStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
