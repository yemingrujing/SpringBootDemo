package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "t_receipt_address")
public class ReceiptAddress {
    @Id
    private Integer id;

    /**
     * 发票ID
     */
    @Column(name = "invoice_id")
    private Integer invoiceId;

    /**
     * 收票人姓名
     */
    private String name;

    /**
     * 电话
     */
    private String telephone;

    /**
     * 收票人详细地址
     */
    @Column(name = "detailed_address")
    private String detailedAddress;

    /**
     * 收票状态（0 - 未签收，1 - 已签收）
     */
    private Short status;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取发票ID
     *
     * @return invoice_id - 发票ID
     */
    public Integer getInvoiceId() {
        return invoiceId;
    }

    /**
     * 设置发票ID
     *
     * @param invoiceId 发票ID
     */
    public void setInvoiceId(Integer invoiceId) {
        this.invoiceId = invoiceId;
    }

    /**
     * 获取收票人姓名
     *
     * @return name - 收票人姓名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置收票人姓名
     *
     * @param name 收票人姓名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取电话
     *
     * @return telephone - 电话
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置电话
     *
     * @param telephone 电话
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * 获取收票人详细地址
     *
     * @return detailed_address - 收票人详细地址
     */
    public String getDetailedAddress() {
        return detailedAddress;
    }

    /**
     * 设置收票人详细地址
     *
     * @param detailedAddress 收票人详细地址
     */
    public void setDetailedAddress(String detailedAddress) {
        this.detailedAddress = detailedAddress;
    }

    /**
     * 获取收票状态（0 - 未签收，1 - 已签收）
     *
     * @return status - 收票状态（0 - 未签收，1 - 已签收）
     */
    public Short getStatus() {
        return status;
    }

    /**
     * 设置收票状态（0 - 未签收，1 - 已签收）
     *
     * @param status 收票状态（0 - 未签收，1 - 已签收）
     */
    public void setStatus(Short status) {
        this.status = status;
    }
}