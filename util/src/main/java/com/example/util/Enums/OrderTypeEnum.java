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
    ALL((short) -1, "全部"),
    NEW((short) 0, "普通"),
    FINISHED((short) 1, "活动"),
    CANCEL((short) 2, "集采");

    private Short code;
    private String message;

    OrderTypeEnum(Short code, String message) {
        this.code = code;
        this.message = message;
    }
}
