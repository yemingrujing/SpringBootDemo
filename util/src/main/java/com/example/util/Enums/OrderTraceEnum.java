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
    CREATE((short) 0, "创建订单"),
    PAID((short) 1, "订单支付"),
    DELIVERED((short) 2, "订单发货"),
    SUCCESS((short) 3, "订单完成"),
    CANCEL((short) 4, "取消订单"),
    REFUND((short) 5, "退款"),
    REFUNDREFUND((short) 6, "退货"),;

    private Short code;
    private String message;

    OrderTraceEnum(Short code, String message) {
        this.code = code;
        this.message = message;
    }
}
