package com.example.util.Enums;

import lombok.Getter;

/**
 * 支付状态
 *
 * @author Wei.Guang
 * @create 2018-06-24 15:06
 **/
@Getter
public enum PayStatusEnum {
    WAIT((short) 0, "等待支付"),
    PAING((short) 1, "正在付款"),
    PAID((short) 2, "支付成功"),
    REFUND((short) 3, "已退款"),
    OVERTIME((short) 4, "支付超时");

    private Short code;
    private String message;

    PayStatusEnum(Short code, String message) {
        this.code = code;
        this.message = message;
    }
}
