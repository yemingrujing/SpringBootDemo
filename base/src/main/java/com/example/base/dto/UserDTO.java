package com.example.base.dto;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Wei.Guang
 * @create 2018-07-11 9:28
 **/
@Setter
@Getter
public class UserDTO implements Serializable {

    private static UserDTO create() {
        return new UserDTO();
    }

    public UserDTO(Integer id, String phone, String username, String sex, Date createTime) {
        this.id = id;
        this.phone = phone;
        this.username = username;
        this.sex = sex;
        this.createTime = createTime;
    }

    public UserDTO(){}

    @Excel(name = "姓名", orderNum = "0")
    private Integer id;

    @Excel(name = "手机号码", orderNum = "0")
    private String phone;

    @Excel(name = "用户名", orderNum = "0")
    private String username;

    @Excel(name = "性别",replace = {"男_0", "女_1", "男_null"}, orderNum = "0")
    private String sex;

    @Excel(name = "创建时间", exportFormat = "yyyy-MM-dd HH:mm:ss", importFormat = "yyyy-MM-dd HH:mm:ss", orderNum = "0")
    private Date createTime;



}
