package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "t_delivery_address")
public class DeliveryAddress {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 订单编号
     */
    @Column(name = "order_code")
    private Integer orderCode;

    /**
     * 收货人姓名
     */
    @Column(name = "receiver_name")
    private Integer receiverName;

    /**
     * 移动号码
     */
    @Column(name = "receiver_mobile")
    private String receiverMobile;

    /**
     * 固定号码
     */
    @Column(name = "receiver_phone")
    private String receiverPhone;

    /**
     * 省份
     */
    @Column(name = "receiver_province")
    private Integer receiverProvince;

    /**
     * 地市
     */
    @Column(name = "receiver_city")
    private Integer receiverCity;

    /**
     * 区/县
     */
    @Column(name = "receiver_country")
    private Integer receiverCountry;

    /**
     * 收货地址，如：xx路xx号
     */
    @Column(name = "receiver_address")
    private String receiverAddress;

    /**
     * 邮政编码
     */
    @Column(name = "receiver_zip")
    private String receiverZip;

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
    public Integer getOrderCode() {
        return orderCode;
    }

    /**
     * 设置订单编号
     *
     * @param orderCode 订单编号
     */
    public void setOrderCode(Integer orderCode) {
        this.orderCode = orderCode;
    }

    /**
     * 获取收货人姓名
     *
     * @return receiver_name - 收货人姓名
     */
    public Integer getReceiverName() {
        return receiverName;
    }

    /**
     * 设置收货人姓名
     *
     * @param receiverName 收货人姓名
     */
    public void setReceiverName(Integer receiverName) {
        this.receiverName = receiverName;
    }

    /**
     * 获取移动号码
     *
     * @return receiver_mobile - 移动号码
     */
    public String getReceiverMobile() {
        return receiverMobile;
    }

    /**
     * 设置移动号码
     *
     * @param receiverMobile 移动号码
     */
    public void setReceiverMobile(String receiverMobile) {
        this.receiverMobile = receiverMobile;
    }

    /**
     * 获取固定号码
     *
     * @return receiver_phone - 固定号码
     */
    public String getReceiverPhone() {
        return receiverPhone;
    }

    /**
     * 设置固定号码
     *
     * @param receiverPhone 固定号码
     */
    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    /**
     * 获取省份
     *
     * @return receiver_province - 省份
     */
    public Integer getReceiverProvince() {
        return receiverProvince;
    }

    /**
     * 设置省份
     *
     * @param receiverProvince 省份
     */
    public void setReceiverProvince(Integer receiverProvince) {
        this.receiverProvince = receiverProvince;
    }

    /**
     * 获取地市
     *
     * @return receiver_city - 地市
     */
    public Integer getReceiverCity() {
        return receiverCity;
    }

    /**
     * 设置地市
     *
     * @param receiverCity 地市
     */
    public void setReceiverCity(Integer receiverCity) {
        this.receiverCity = receiverCity;
    }

    /**
     * 获取区/县
     *
     * @return receiver_country - 区/县
     */
    public Integer getReceiverCountry() {
        return receiverCountry;
    }

    /**
     * 设置区/县
     *
     * @param receiverCountry 区/县
     */
    public void setReceiverCountry(Integer receiverCountry) {
        this.receiverCountry = receiverCountry;
    }

    /**
     * 获取收货地址，如：xx路xx号
     *
     * @return receiver_address - 收货地址，如：xx路xx号
     */
    public String getReceiverAddress() {
        return receiverAddress;
    }

    /**
     * 设置收货地址，如：xx路xx号
     *
     * @param receiverAddress 收货地址，如：xx路xx号
     */
    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    /**
     * 获取邮政编码
     *
     * @return receiver_zip - 邮政编码
     */
    public String getReceiverZip() {
        return receiverZip;
    }

    /**
     * 设置邮政编码
     *
     * @param receiverZip 邮政编码
     */
    public void setReceiverZip(String receiverZip) {
        this.receiverZip = receiverZip;
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