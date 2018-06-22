package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "t_good_category")
public class GoodCateGory {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 商品分类名称
     */
    @Column(name = "cate_name")
    private String cateName;

    /**
     * 父分类编号
     */
    @Column(name = "parent_id")
    private Integer parentId;

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
     * 获取商品分类名称
     *
     * @return cate_name - 商品分类名称
     */
    public String getCateName() {
        return cateName;
    }

    /**
     * 设置商品分类名称
     *
     * @param cateName 商品分类名称
     */
    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    /**
     * 获取父分类编号
     *
     * @return parent_id - 父分类编号
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     * 设置父分类编号
     *
     * @param parentId 父分类编号
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}