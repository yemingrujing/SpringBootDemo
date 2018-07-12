package com.example.base.order;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "t_order_address")
public class OrderAddress {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 收货人姓名
     */
    private String name;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 电话号码
     */
    @Column(name = "userTel")
    private String usertel;

    /**
     * 地址所属省
     */
    @Column(name = "area_province")
    private Integer areaProvince;

    /**
     * 地址所属市
     */
    @Column(name = "area_city")
    private Integer areaCity;

    /**
     * 地址所属区县
     */
    @Column(name = "area_country")
    private Integer areaCountry;

    /**
     * 邮政编码
     */
    @Column(name = "zip_code")
    private String zipCode;

    /**
     * 详细地址
     */
    private String address;

    /**
     * 是否默认地址（0:非默认，1:默认）
     */
    @Column(name = "de_select")
    private Byte deSelect;

    /**
     * 删除状态（0:有效，1:删除）
     */
    private Byte flag;

    /**
     * 创建时间
     */
    @Column(name = "creat_time")
    private Date creatTime;

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
     * 获取用户id
     *
     * @return user_id - 用户id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户id
     *
     * @param userId 用户id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取收货人姓名
     *
     * @return name - 收货人姓名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置收货人姓名
     *
     * @param name 收货人姓名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取手机号码
     *
     * @return phone - 手机号码
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置手机号码
     *
     * @param phone 手机号码
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取电话号码
     *
     * @return userTel - 电话号码
     */
    public String getUsertel() {
        return usertel;
    }

    /**
     * 设置电话号码
     *
     * @param usertel 电话号码
     */
    public void setUsertel(String usertel) {
        this.usertel = usertel;
    }

    /**
     * 获取地址所属省
     *
     * @return area_province - 地址所属省
     */
    public Integer getAreaProvince() {
        return areaProvince;
    }

    /**
     * 设置地址所属省
     *
     * @param areaProvince 地址所属省
     */
    public void setAreaProvince(Integer areaProvince) {
        this.areaProvince = areaProvince;
    }

    /**
     * 获取地址所属市
     *
     * @return area_city - 地址所属市
     */
    public Integer getAreaCity() {
        return areaCity;
    }

    /**
     * 设置地址所属市
     *
     * @param areaCity 地址所属市
     */
    public void setAreaCity(Integer areaCity) {
        this.areaCity = areaCity;
    }

    /**
     * 获取地址所属区县
     *
     * @return area_country - 地址所属区县
     */
    public Integer getAreaCountry() {
        return areaCountry;
    }

    /**
     * 设置地址所属区县
     *
     * @param areaCountry 地址所属区县
     */
    public void setAreaCountry(Integer areaCountry) {
        this.areaCountry = areaCountry;
    }

    /**
     * 获取邮政编码
     *
     * @return zip_code - 邮政编码
     */
    public String getZipCode() {
        return zipCode;
    }

    /**
     * 设置邮政编码
     *
     * @param zipCode 邮政编码
     */
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    /**
     * 获取详细地址
     *
     * @return address - 详细地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置详细地址
     *
     * @param address 详细地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取是否默认地址（0:非默认，1:默认）
     *
     * @return de_select - 是否默认地址（0:非默认，1:默认）
     */
    public Byte getDeSelect() {
        return deSelect;
    }

    /**
     * 设置是否默认地址（0:非默认，1:默认）
     *
     * @param deSelect 是否默认地址（0:非默认，1:默认）
     */
    public void setDeSelect(Byte deSelect) {
        this.deSelect = deSelect;
    }

    /**
     * 获取删除状态（0:有效，1:删除）
     *
     * @return flag - 删除状态（0:有效，1:删除）
     */
    public Byte getFlag() {
        return flag;
    }

    /**
     * 设置删除状态（0:有效，1:删除）
     *
     * @param flag 删除状态（0:有效，1:删除）
     */
    public void setFlag(Byte flag) {
        this.flag = flag;
    }

    /**
     * 获取创建时间
     *
     * @return creat_time - 创建时间
     */
    public Date getCreatTime() {
        return creatTime;
    }

    /**
     * 设置创建时间
     *
     * @param creatTime 创建时间
     */
    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }
}