package com.example.base.enums;

import lombok.Getter;

/**
 * 会员等级
 *
 * @author Wei.Guang
 * @create 2019-01-17 10:06
 **/
@Getter
public enum  MemberLevelEnum {

    GENERAL("general", "generalMember", "1"),
    VIP("vip", "vipMember", "0.8"),
    SUPER("super", "superMember", "0.1");

    private String level;
    private String name;
    private String sale;

    MemberLevelEnum(String level, String name, String sale) {
        this.level = level;
        this.name = name;
        this.sale = sale;
    }

    /**
     * 根据会员等级计算用户价格
     * @param level
     * @return
     */
    public static MemberLevelEnum getEnum(String level) {
        for (MemberLevelEnum memberLevelEnum : values()) {
            if (memberLevelEnum.getLevel().equals(level)) {
                return memberLevelEnum;
            }
        }
        return GENERAL;
    }
}