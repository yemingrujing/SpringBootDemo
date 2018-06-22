package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "t_attr_value")
public class AttrValue {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 属性值
     */
    @Column(name = "attr_value")
    private String attrValue;

    /**
     * 属性名编号
     */
    @Column(name = "attr_name_id")
    private Integer attrNameId;

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
     * 获取属性值
     *
     * @return attr_value - 属性值
     */
    public String getAttrValue() {
        return attrValue;
    }

    /**
     * 设置属性值
     *
     * @param attrValue 属性值
     */
    public void setAttrValue(String attrValue) {
        this.attrValue = attrValue;
    }

    /**
     * 获取属性名编号
     *
     * @return attr_name_id - 属性名编号
     */
    public Integer getAttrNameId() {
        return attrNameId;
    }

    /**
     * 设置属性名编号
     *
     * @param attrNameId 属性名编号
     */
    public void setAttrNameId(Integer attrNameId) {
        this.attrNameId = attrNameId;
    }
}