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

    ALL((short) -1, "全部"),
    NEW((short) 0, "新订单"),
    UNDELIVERED((short) 1, "未发货"),
    DELIVERED((short) 2, "已发货"),
    SUCCESS((short) 3, "已完成"),
    CANCEL((short) 4, "取消"),
    OVERTIME((short) 5, "超时"),
    REFUND((short) 6, "退货"),
    CLOSE((short) 7, "关闭");

    private Short code;
    private String message;

    OrderStatusEnum(Short code, String message) {
        this.code = code;
        this.message = message;
    }
}
