package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "t_order_trace")
public class OrderTrace {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 订单编号
     */
    @Column(name = "order_code")
    private String orderCode;

    /**
     * 操作
     */
    private String operate;

    /**
     * 历史操作轨迹
     */
    @Column(name = "ope_trace")
    private String opeTrace;

    /**
     * 用户名称
     */
    private String username;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 获取主键
     *
     * @return id - 主键
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键
     *
     * @param id 主键
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取订单编号
     *
     * @return order_code - 订单编号
     */
    public String getOrderCode() {
        return orderCode;
    }

    /**
     * 设置订单编号
     *
     * @param orderCode 订单编号
     */
    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    /**
     * 获取操作
     *
     * @return operate - 操作
     */
    public String getOperate() {
        return operate;
    }

    /**
     * 设置操作
     *
     * @param operate 操作
     */
    public void setOperate(String operate) {
        this.operate = operate;
    }

    /**
     * 获取历史操作轨迹
     *
     * @return ope_trace - 历史操作轨迹
     */
    public String getOpeTrace() {
        return opeTrace;
    }

    /**
     * 设置历史操作轨迹
     *
     * @param opeTrace 历史操作轨迹
     */
    public void setOpeTrace(String opeTrace) {
        this.opeTrace = opeTrace;
    }

    /**
     * 获取用户名称
     *
     * @return username - 用户名称
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置用户名称
     *
     * @param username 用户名称
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}