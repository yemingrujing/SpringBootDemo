package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

@Table(name = "t_sku")
public class Sku {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 商品编号
     */
    @Column(name = "good_id")
    private Integer goodId;

    /**
     * sku属性
     */
    @Column(name = "sku_attr")
    private Integer skuAttr;

    /**
     * 价格
     */
    private BigDecimal price;

    /**
     * 库存
     */
    private Long stock;

    /**
     * sku销量
     */
    @Column(name = "sku_volume")
    private Long skuVolume;

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
     * 获取商品编号
     *
     * @return good_id - 商品编号
     */
    public Integer getGoodId() {
        return goodId;
    }

    /**
     * 设置商品编号
     *
     * @param goodId 商品编号
     */
    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    /**
     * 获取sku属性
     *
     * @return sku_attr - sku属性
     */
    public Integer getSkuAttr() {
        return skuAttr;
    }

    /**
     * 设置sku属性
     *
     * @param skuAttr sku属性
     */
    public void setSkuAttr(Integer skuAttr) {
        this.skuAttr = skuAttr;
    }

    /**
     * 获取价格
     *
     * @return price - 价格
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * 设置价格
     *
     * @param price 价格
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * 获取库存
     *
     * @return stock - 库存
     */
    public Long getStock() {
        return stock;
    }

    /**
     * 设置库存
     *
     * @param stock 库存
     */
    public void setStock(Long stock) {
        this.stock = stock;
    }

    /**
     * 获取sku销量
     *
     * @return sku_volume - sku销量
     */
    public Long getSkuVolume() {
        return skuVolume;
    }

    /**
     * 设置sku销量
     *
     * @param skuVolume sku销量
     */
    public void setSkuVolume(Long skuVolume) {
        this.skuVolume = skuVolume;
    }
}