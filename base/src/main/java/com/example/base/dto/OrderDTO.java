package com.example.base.dto;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @author Wei.Guang
 * @create 2018-07-11 15:04
 **/
@Setter
@Getter
@NoArgsConstructor
public class OrderDTO {

    private static OrderDTO create() {
        return new OrderDTO();
    }

    @Excel(name = "订单号", width = 25, orderNum = "0")
    private String orderCode;

    @Excel(name = "物流公司编号", width = 25, orderNum = "0")
    private String logisticsNum;

    @Excel(name = "快递单号", width = 25, orderNum = "0")
    private String courierNum;
}
