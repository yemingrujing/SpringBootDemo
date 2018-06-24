package com.example.base.order;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Table(name = "t_order")
public class Order {
    /**
     * 主键
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    /**
     * 订单编号
     */
    @Column(name = "order_code")
    private Long orderCode;

    /**
     * 实付金额
     */
    private BigDecimal payment;

    /**
     * 支付类型(0支付宝/1微信)
     */
    @Column(name = "pay_type")
    private Integer payType;

    /**
     * 付款状态(0未付款/已付款)
     */
    @Column(name = "pay_status")
    private Integer payStatus;

    /**
     * 订单类型(0新订单/1历史订单)
     */
    @Column(name = "order_type")
    private Integer orderType;

    /**
     * 订单状态(0未发货/1已发货/2订单成功/3订单关闭/4取消交易)
     */
    @Column(name = "order_status")
    private Integer orderStatus;

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
     * 用户姓名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 收货地址
     */
    private Integer address;

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
     * 获取支付类型(0支付宝/1微信)
     *
     * @return pay_type - 支付类型(0支付宝/1微信)
     */
    public Integer getPayType() {
        return payType;
    }

    /**
     * 设置支付类型(0支付宝/1微信)
     *
     * @param payType 支付类型(0支付宝/1微信)
     */
    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    /**
     * 获取付款状态(0未付款/已付款)
     *
     * @return pay_status - 付款状态(0未付款/已付款)
     */
    public Integer getPayStatus() {
        return payStatus;
    }

    /**
     * 设置付款状态(0未付款/已付款)
     *
     * @param payStatus 付款状态(0未付款/已付款)
     */
    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }

    /**
     * 获取订单类型(0新订单/1历史订单)
     *
     * @return order_type - 订单类型(0新订单/1历史订单)
     */
    public Integer getOrderType() {
        return orderType;
    }

    /**
     * 设置订单类型(0新订单/1历史订单)
     *
     * @param orderType 订单类型(0新订单/1历史订单)
     */
    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }

    /**
     * 获取订单状态(0未发货/1已发货/2订单成功/3订单关闭/4取消交易)
     *
     * @return order_status - 订单状态(0未发货/1已发货/2订单成功/3订单关闭/4取消交易)
     */
    public Integer getOrderStatus() {
        return orderStatus;
    }

    /**
     * 设置订单状态(0未发货/1已发货/2订单成功/3订单关闭/4取消交易)
     *
     * @param orderStatus 订单状态(0未发货/1已发货/2订单成功/3订单关闭/4取消交易)
     */
    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
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
     * 获取用户姓名
     *
     * @return user_name - 用户姓名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置用户姓名
     *
     * @param userName 用户姓名
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取手机号码
     *
     * @return phone - 手机号码
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置手机号码
     *
     * @param phone 手机号码
     */
    public void setPhone(String phone) {
        this.phone = phone;
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