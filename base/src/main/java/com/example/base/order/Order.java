package com.example.base.order;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Table(name = "t_order")
public class Order {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(generator = "JDBC")
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
     * 支付类型(0支付宝/1微信)
     */
    @Column(name = "pay_type")
    private Short payType;

    /**
     * 付款状态(0未付款/1正在付款/2已付款/3退款/4支付超时)
     */
    @Column(name = "pay_status")
    private Short payStatus;

    /**
     * 订单类型(0普通/1活动/2集采)
     */
    @Column(name = "order_type")
    private Short orderType;

    /**
     * 订单状态(0新订单/1未发货/2已发货/3完成/4订单取消/5超时/6退货/7关闭)
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
     * 物流公司编号
     */
    @Column(name = "logistics_num")
    private String logisticsNum;

    /**
     * 快递单号
     */
    @Column(name = "courier_num")
    private String courierNum;

    private List<OrderItem> orderItemList;
}