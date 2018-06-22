package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "t_goods")
public class Goods {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 商品名称
     */
    @Column(name = "good_name")
    private String goodName;

    /**
     * 商品分类编号
     */
    @Column(name = "cate_id")
    private Integer cateId;

    /**
     * 卖家编号
     */
    @Column(name = "seller_id")
    private Integer sellerId;

    /**
     * spu销量
     */
    @Column(name = "spu_volume")
    private Long spuVolume;

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
     * 获取商品名称
     *
     * @return good_name - 商品名称
     */
    public String getGoodName() {
        return goodName;
    }

    /**
     * 设置商品名称
     *
     * @param goodName 商品名称
     */
    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    /**
     * 获取商品分类编号
     *
     * @return cate_id - 商品分类编号
     */
    public Integer getCateId() {
        return cateId;
    }

    /**
     * 设置商品分类编号
     *
     * @param cateId 商品分类编号
     */
    public void setCateId(Integer cateId) {
        this.cateId = cateId;
    }

    /**
     * 获取卖家编号
     *
     * @return seller_id - 卖家编号
     */
    public Integer getSellerId() {
        return sellerId;
    }

    /**
     * 设置卖家编号
     *
     * @param sellerId 卖家编号
     */
    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    /**
     * 获取spu销量
     *
     * @return spu_volume - spu销量
     */
    public Long getSpuVolume() {
        return spuVolume;
    }

    /**
     * 设置spu销量
     *
     * @param spuVolume spu销量
     */
    public void setSpuVolume(Long spuVolume) {
        this.spuVolume = spuVolume;
    }
}