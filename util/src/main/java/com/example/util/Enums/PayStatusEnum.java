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
    WAIT(0, "等待支付"),
    SUCCESS(0, "支付成功");

    private Integer code;
    private String message;


    PayStatusEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }
}
