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
     * 订单id
     */
    @Column(name = "order_code")
    private String orderCode;

    /**
     * 品牌编码
     */
    @Column(name = "brand_id")
    private Integer brandId;

    /**
     * spu_id
     */
    @Column(name = "spu_id")
    private Long spuId;

    /**
     * sku_id
     */
    @Column(name = "sku_id")
    private Long skuId;

    @Column(name = "sku_name")
    private String skuName;

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
     * 获取订单id
     *
     * @return order_code - 订单id
     */
    public String getOrderCode() {
        return orderCode;
    }

    /**
     * 设置订单id
     *
     * @param orderCode 订单id
     */
    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    /**
     * 获取品牌编码
     *
     * @return brand_id - 品牌编码
     */
    public Integer getBrandId() {
        return brandId;
    }

    /**
     * 设置品牌编码
     *
     * @param brandId 品牌编码
     */
    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    /**
     * 获取spu_id
     *
     * @return spu_id - spu_id
     */
    public Long getSpuId() {
        return spuId;
    }

    /**
     * 设置spu_id
     *
     * @param spuId spu_id
     */
    public void setSpuId(Long spuId) {
        this.spuId = spuId;
    }

    /**
     * 获取sku_id
     *
     * @return sku_id - sku_id
     */
    public Long getSkuId() {
        return skuId;
    }

    /**
     * 设置sku_id
     *
     * @param skuId sku_id
     */
    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    /**
     * @return sku_name
     */
    public String getSkuName() {
        return skuName;
    }

    /**
     * @param skuName
     */
    public void setSkuName(String skuName) {
        this.skuName = skuName;
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
}