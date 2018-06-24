package com.example.util.Enums;

import lombok.Getter;

/**
 * 操作轨迹
 *
 * @author Wei.Guang
 * @create 2018-06-24 15:53
 **/
@Getter
public enum OrderTraceEnum {
    CREATE(0, "创建订单"),
    PAID(1, "订单支付"),
    DELIVERED(2, "订单发货"),
    SUCCESS(3, "订单完成"),
    CANCEL(4, "取消订单");

    private Integer code;
    private String message;

    OrderTraceEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }
}
