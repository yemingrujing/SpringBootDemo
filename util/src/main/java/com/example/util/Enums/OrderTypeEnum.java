package com.example.util.Enums;

import lombok.Getter;

/**
 * 订单类型
 *
 * @author Wei.Guang
 * @create 2018-06-24 13:52
 **/
@Getter
public enum OrderTypeEnum {
    NEW(0, "新订单"),
    FINISHED(1, "已完成"),
    CANCEL(2, "已取消"),
    ;

    private Integer code;

    private String message;

    OrderTypeEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
