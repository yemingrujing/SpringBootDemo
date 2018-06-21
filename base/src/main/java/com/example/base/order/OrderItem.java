package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

@Table(name = "t_order_item")
public class OrderItem {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 品牌编码
     */
    @Column(name = "brand_code")
    private String brandCode;

    /**
     * spu_id
     */
    @Column(name = "spu_id")
    private Integer spuId;

    /**
     * sku_id
     */
    @Column(name = "sku_id")
    private Integer skuId;

    /**
     * 商品单价
     */
    private BigDecimal price;

    /**
     * 活动单价
     */
    @Column(name = "act_price")
    private BigDecimal actPrice;

    /**
     * 商品数量
     */
    private Integer num;

    /**
     * 商品总价
     */
    @Column(name = "total_fee")
    private BigDecimal totalFee;

    /**
     * 订单id
     */
    @Column(name = "order_id")
    private byte[] orderId;

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
     * 获取品牌编码
     *
     * @return brand_code - 品牌编码
     */
    public String getBrandCode() {
        return brandCode;
    }

    /**
     * 设置品牌编码
     *
     * @param brandCode 品牌编码
     */
    public void setBrandCode(String brandCode) {
        this.brandCode = brandCode;
    }

    /**
     * 获取spu_id
     *
     * @return spu_id - spu_id
     */
    public Integer getSpuId() {
        return spuId;
    }

    /**
     * 设置spu_id
     *
     * @param spuId spu_id
     */
    public void setSpuId(Integer spuId) {
        this.spuId = spuId;
    }

    /**
     * 获取sku_id
     *
     * @return sku_id - sku_id
     */
    public Integer getSkuId() {
        return skuId;
    }

    /**
     * 设置sku_id
     *
     * @param skuId sku_id
     */
    public void setSkuId(Integer skuId) {
        this.skuId = skuId;
    }

    /**
     * 获取商品单价
     *
     * @return price - 商品单价
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * 设置商品单价
     *
     * @param price 商品单价
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * 获取活动单价
     *
     * @return act_price - 活动单价
     */
    public BigDecimal getActPrice() {
        return actPrice;
    }

    /**
     * 设置活动单价
     *
     * @param actPrice 活动单价
     */
    public void setActPrice(BigDecimal actPrice) {
        this.actPrice = actPrice;
    }

    /**
     * 获取商品数量
     *
     * @return num - 商品数量
     */
    public Integer getNum() {
        return num;
    }

    /**
     * 设置商品数量
     *
     * @param num 商品数量
     */
    public void setNum(Integer num) {
        this.num = num;
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
     * 获取订单id
     *
     * @return order_id - 订单id
     */
    public byte[] getOrderId() {
        return orderId;
    }

    /**
     * 设置订单id
     *
     * @param orderId 订单id
     */
    public void setOrderId(byte[] orderId) {
        this.orderId = orderId;
    }
}