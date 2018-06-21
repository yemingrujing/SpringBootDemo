package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "t_region")
public class Region {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 省市区名称
     */
    private String name;

    /**
     * 所属地区id
     */
    @Column(name = "parent_id")
    private Integer parentId;

    /**
     * 简称
     */
    @Column(name = "short_name")
    private String shortName;

    /**
     * 等级类型
     */
    @Column(name = "level_type")
    private Integer levelType;

    /**
     * 行政编码
     */
    @Column(name = "city_code")
    private String cityCode;

    /**
     * 行政编码
     */
    @Column(name = "zip_code")
    private String zipCode;

    /**
     * 详细名称
     */
    @Column(name = "merger_name")
    private String mergerName;

    /**
     * 经度
     */
    private Float lng;

    /**
     * 纬度
     */
    private Float lat;

    /**
     * 拼音
     */
    private String pinyin;

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
     * 获取省市区名称
     *
     * @return name - 省市区名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置省市区名称
     *
     * @param name 省市区名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取所属地区id
     *
     * @return parent_id - 所属地区id
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     * 设置所属地区id
     *
     * @param parentId 所属地区id
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    /**
     * 获取简称
     *
     * @return short_name - 简称
     */
    public String getShortName() {
        return shortName;
    }

    /**
     * 设置简称
     *
     * @param shortName 简称
     */
    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    /**
     * 获取等级类型
     *
     * @return level_type - 等级类型
     */
    public Integer getLevelType() {
        return levelType;
    }

    /**
     * 设置等级类型
     *
     * @param levelType 等级类型
     */
    public void setLevelType(Integer levelType) {
        this.levelType = levelType;
    }

    /**
     * 获取行政编码
     *
     * @return city_code - 行政编码
     */
    public String getCityCode() {
        return cityCode;
    }

    /**
     * 设置行政编码
     *
     * @param cityCode 行政编码
     */
    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    /**
     * 获取行政编码
     *
     * @return zip_code - 行政编码
     */
    public String getZipCode() {
        return zipCode;
    }

    /**
     * 设置行政编码
     *
     * @param zipCode 行政编码
     */
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    /**
     * 获取详细名称
     *
     * @return merger_name - 详细名称
     */
    public String getMergerName() {
        return mergerName;
    }

    /**
     * 设置详细名称
     *
     * @param mergerName 详细名称
     */
    public void setMergerName(String mergerName) {
        this.mergerName = mergerName;
    }

    /**
     * 获取经度
     *
     * @return lng - 经度
     */
    public Float getLng() {
        return lng;
    }

    /**
     * 设置经度
     *
     * @param lng 经度
     */
    public void setLng(Float lng) {
        this.lng = lng;
    }

    /**
     * 获取纬度
     *
     * @return lat - 纬度
     */
    public Float getLat() {
        return lat;
    }

    /**
     * 设置纬度
     *
     * @param lat 纬度
     */
    public void setLat(Float lat) {
        this.lat = lat;
    }

    /**
     * 获取拼音
     *
     * @return pinyin - 拼音
     */
    public String getPinyin() {
        return pinyin;
    }

    /**
     * 设置拼音
     *
     * @param pinyin 拼音
     */
    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }
}