package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import java.math.BigDecimal;
import java.util.Date;

@Table(name = "t_order")
public class Order {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 实付金额
     */
    private BigDecimal payment;

    /**
     * 支付类型(微信/支付宝)
     */
    @Column(name = "pay_type")
    private Integer payType;

    /**
     * 订单状态(未付款/已付款/未发货/已发货/订单成功/订单关闭/取消交易)
     */
    private Integer status;

    /**
     * 付款时间
     */
    @Column(name = "payment_time")
    private Date paymentTime;

    /**
     * 发货时间
     */
    @Column(name = "consign_time")
    private Date consignTime;

    /**
     * 订单完成时间
     */
    @Column(name = "end_time")
    private Date endTime;

    /**
     * 订单超时时间
     */
    @Column(name = "over_time")
    private Date overTime;

    /**
     * 订单关闭时间
     */
    @Column(name = "close_time")
    private Date closeTime;

    /**
     * 用户Id
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 收货地址
     */
    private Integer address;

    /**
     * 订单编号
     */
    @Column(name = "order_code")
    private Long orderCode;

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
     * 获取实付金额
     *
     * @return payment - 实付金额
     */
    public BigDecimal getPayment() {
        return payment;
    }

    /**
     * 设置实付金额
     *
     * @param payment 实付金额
     */
    public void setPayment(BigDecimal payment) {
        this.payment = payment;
    }

    /**
     * 获取支付类型(微信/支付宝)
     *
     * @return pay_type - 支付类型(微信/支付宝)
     */
    public Integer getPayType() {
        return payType;
    }

    /**
     * 设置支付类型(微信/支付宝)
     *
     * @param payType 支付类型(微信/支付宝)
     */
    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    /**
     * 获取订单状态(未付款/已付款/未发货/已发货/订单成功/订单关闭/取消交易)
     *
     * @return status - 订单状态(未付款/已付款/未发货/已发货/订单成功/订单关闭/取消交易)
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置订单状态(未付款/已付款/未发货/已发货/订单成功/订单关闭/取消交易)
     *
     * @param status 订单状态(未付款/已付款/未发货/已发货/订单成功/订单关闭/取消交易)
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取付款时间
     *
     * @return payment_time - 付款时间
     */
    public Date getPaymentTime() {
        return paymentTime;
    }

    /**
     * 设置付款时间
     *
     * @param paymentTime 付款时间
     */
    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    /**
     * 获取发货时间
     *
     * @return consign_time - 发货时间
     */
    public Date getConsignTime() {
        return consignTime;
    }

    /**
     * 设置发货时间
     *
     * @param consignTime 发货时间
     */
    public void setConsignTime(Date consignTime) {
        this.consignTime = consignTime;
    }

    /**
     * 获取订单完成时间
     *
     * @return end_time - 订单完成时间
     */
    public Date getEndTime() {
        return endTime;
    }

    /**
     * 设置订单完成时间
     *
     * @param endTime 订单完成时间
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /**
     * 获取订单超时时间
     *
     * @return over_time - 订单超时时间
     */
    public Date getOverTime() {
        return overTime;
    }

    /**
     * 设置订单超时时间
     *
     * @param overTime 订单超时时间
     */
    public void setOverTime(Date overTime) {
        this.overTime = overTime;
    }

    /**
     * 获取订单关闭时间
     *
     * @return close_time - 订单关闭时间
     */
    public Date getCloseTime() {
        return closeTime;
    }

    /**
     * 设置订单关闭时间
     *
     * @param closeTime 订单关闭时间
     */
    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }

    /**
     * 获取用户Id
     *
     * @return user_id - 用户Id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户Id
     *
     * @param userId 用户Id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
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

    /**
     * 获取收货地址
     *
     * @return address - 收货地址
     */
    public Integer getAddress() {
        return address;
    }

    /**
     * 设置收货地址
     *
     * @param address 收货地址
     */
    public void setAddress(Integer address) {
        this.address = address;
    }

    /**
     * 获取订单编号
     *
     * @return order_code - 订单编号
     */
    public Long getOrderCode() {
        return orderCode;
    }

    /**
     * 设置订单编号
     *
     * @param orderCode 订单编号
     */
    public void setOrderCode(Long orderCode) {
        this.orderCode = orderCode;
    }
}