package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "t_attr_name")
public class AttrName {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 属性名
     */
    @Column(name = "attr_name")
    private String attrName;

    /**
     * 商品分类编号
     */
    @Column(name = "cate_id")
    private Integer cateId;

    /**
     * 父属性编号
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
     * 获取属性名
     *
     * @return attr_name - 属性名
     */
    public String getAttrName() {
        return attrName;
    }

    /**
     * 设置属性名
     *
     * @param attrName 属性名
     */
    public void setAttrName(String attrName) {
        this.attrName = attrName;
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
     * 获取父属性编号
     *
     * @return parent_id - 父属性编号
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     * 设置父属性编号
     *
     * @param parentId 父属性编号
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}