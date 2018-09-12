package com.example.order;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "t_order")
public class Order {
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
     * 商品总价
     */
    @Column(name = "total_fee")
    private BigDecimal totalFee;

    /**
     * 实付金额
     */
    private BigDecimal payment;

    /**
     * 支付类型(0支付宝/1微信/2银联/3线下支付)
     */
    @Column(name = "pay_type")
    private Short payType;

    /**
     * 付款状态(0未付款/1正在付款/2已付款/3退款/4支付超时)
     */
    @Column(name = "pay_status")
    private Short payStatus;

    /**
     * 订单类型(0普通/1活动/2集采/3品牌/4会员)
     */
    @Column(name = "order_type")
    private Short orderType;

    /**
     * 订单状态(0待付款/1待发货/2已发货/3完成/4订单取消/5超时/6退货/7关闭)
     */
    @Column(name = "order_status")
    private Short orderStatus;

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
     * 用户ID
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 收货地址
     */
    private Integer address;

    /**
     * 活动ID
     */
    @Column(name = "promotions_id")
    private Integer promotionsId;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 物流公司编号
     */
    @Column(name = "logistics_num")
    private String logisticsNum;

    /**
     * 快递单号
     */
    @Column(name = "courier_num")
    private String courierNum;

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
     * 获取商品总价
     *
     * @return total_fee - 商品总价
     */
    public BigDecimal getTotalFee() {
        return totalFee;
    }

    /**
     * 设置商品总价
     *
     * @param totalFee 商品总价
     */
    public void setTotalFee(BigDecimal totalFee) {
        this.totalFee = totalFee;
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
     * 获取支付类型(0支付宝/1微信/2银联/3线下支付)
     *
     * @return pay_type - 支付类型(0支付宝/1微信/2银联/3线下支付)
     */
    public Short getPayType() {
        return payType;
    }

    /**
     * 设置支付类型(0支付宝/1微信/2银联/3线下支付)
     *
     * @param payType 支付类型(0支付宝/1微信/2银联/3线下支付)
     */
    public void setPayType(Short payType) {
        this.payType = payType;
    }

    /**
     * 获取付款状态(0未付款/1正在付款/2已付款/3退款/4支付超时)
     *
     * @return pay_status - 付款状态(0未付款/1正在付款/2已付款/3退款/4支付超时)
     */
    public Short getPayStatus() {
        return payStatus;
    }

    /**
     * 设置付款状态(0未付款/1正在付款/2已付款/3退款/4支付超时)
     *
     * @param payStatus 付款状态(0未付款/1正在付款/2已付款/3退款/4支付超时)
     */
    public void setPayStatus(Short payStatus) {
        this.payStatus = payStatus;
    }

    /**
     * 获取订单类型(0普通/1活动/2集采/3品牌/4会员)
     *
     * @return order_type - 订单类型(0普通/1活动/2集采/3品牌/4会员)
     */
    public Short getOrderType() {
        return orderType;
    }

    /**
     * 设置订单类型(0普通/1活动/2集采/3品牌/4会员)
     *
     * @param orderType 订单类型(0普通/1活动/2集采/3品牌/4会员)
     */
    public void setOrderType(Short orderType) {
        this.orderType = orderType;
    }

    /**
     * 获取订单状态(0待付款/1待发货/2已发货/3完成/4订单取消/5超时/6退货/7关闭)
     *
     * @return order_status - 订单状态(0待付款/1待发货/2已发货/3完成/4订单取消/5超时/6退货/7关闭)
     */
    public Short getOrderStatus() {
        return orderStatus;
    }

    /**
     * 设置订单状态(0待付款/1待发货/2已发货/3完成/4订单取消/5超时/6退货/7关闭)
     *
     * @param orderStatus 订单状态(0待付款/1待发货/2已发货/3完成/4订单取消/5超时/6退货/7关闭)
     */
    public void setOrderStatus(Short orderStatus) {
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
     * 获取用户ID
     *
     * @return user_id - 用户ID
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户ID
     *
     * @param userId 用户ID
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
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
     * 获取活动ID
     *
     * @return promotions_id - 活动ID
     */
    public Integer getPromotionsId() {
        return promotionsId;
    }

    /**
     * 设置活动ID
     *
     * @param promotionsId 活动ID
     */
    public void setPromotionsId(Integer promotionsId) {
        this.promotionsId = promotionsId;
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
     * 获取物流公司编号
     *
     * @return logistics_num - 物流公司编号
     */
    public String getLogisticsNum() {
        return logisticsNum;
    }

    /**
     * 设置物流公司编号
     *
     * @param logisticsNum 物流公司编号
     */
    public void setLogisticsNum(String logisticsNum) {
        this.logisticsNum = logisticsNum;
    }

    /**
     * 获取快递单号
     *
     * @return courier_num - 快递单号
     */
    public String getCourierNum() {
        return courierNum;
    }

    /**
     * 设置快递单号
     *
     * @param courierNum 快递单号
     */
    public void setCourierNum(String courierNum) {
        this.courierNum = courierNum;
    }
}