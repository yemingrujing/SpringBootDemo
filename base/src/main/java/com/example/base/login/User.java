package com.example.base.login;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "t_user")
public class User {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    /**
     * 会员编号
     */
    @Column(name = "member_code")
    private String memberCode;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 用户密码
     */
    @Column(name = "pass_word")
    private String passWord;

    /**
     * 性别（男-0,1-女）
     */
    private Short sex;

    /**
     * 用户等级
     */
    private String grade;

    /**
     * 用户成长值
     */
    @Column(name = "growth_value")
    private Integer growthValue;

    /**
     * 用户积分
     */
    private Integer integral;

    /**
     * 头像地址
     */
    @Column(name = "image_url")
    private String imageUrl;

    /**
     * 用户昵称
     */
    @Column(name = "nick_name")
    private String nickName;

    /**
     * 用户名称
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 用户生日
     */
    private Date birthday;

    /**
     * 省份
     */
    private Integer province;

    /**
     * 市
     */
    private Integer city;

    /**
     * 区
     */
    private Integer district;

    /**
     * 旺旺
     */
    @Column(name = "wang_wang")
    private String wangWang;

    /**
     * QQ
     */
    private String qq;

    /**
     * 微信
     */
    @Column(name = "wei_xin")
    private String weiXin;

    /**
     * 用户余额
     */
    private Long balance;

    /**
     * 会员类型（会员，会长）数据字典获取
     */
    private String type;

    /**
     * 允许设备最大接入数量
     */
    @Column(name = "max_login_number")
    private Integer maxLoginNumber;

    /**
     * 用户登录身份令牌
     */
    @Column(name = "to_ken")
    private String toKen;

    /**
     * 是否年缴费( 0 - 否，1 - 是) 第一次缴费后必须按年缴费
     */
    @Column(name = "is_year_payment")
    private Byte isYearPayment;

    /**
     * 登录设备token
     */
    @Column(name = "device_token")
    private String deviceToken;

    /**
     * 登录设备类型
     */
    @Column(name = "device_type")
    private String deviceType;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 用户是否被锁定(0:未锁定，1:锁定)
     */
    private Short locked;

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
     * 获取会员编号
     *
     * @return member_code - 会员编号
     */
    public String getMemberCode() {
        return memberCode;
    }

    /**
     * 设置会员编号
     *
     * @param memberCode 会员编号
     */
    public void setMemberCode(String memberCode) {
        this.memberCode = memberCode;
    }

    /**
     * 获取手机号
     *
     * @return phone - 手机号
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置手机号
     *
     * @param phone 手机号
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取用户密码
     *
     * @return pass_word - 用户密码
     */
    public String getPassWord() {
        return passWord;
    }

    /**
     * 设置用户密码
     *
     * @param passWord 用户密码
     */
    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    /**
     * 获取性别（男-0,1-女）
     *
     * @return sex - 性别（男-0,1-女）
     */
    public Short getSex() {
        return sex;
    }

    /**
     * 设置性别（男-0,1-女）
     *
     * @param sex 性别（男-0,1-女）
     */
    public void setSex(Short sex) {
        this.sex = sex;
    }

    /**
     * 获取用户等级
     *
     * @return grade - 用户等级
     */
    public String getGrade() {
        return grade;
    }

    /**
     * 设置用户等级
     *
     * @param grade 用户等级
     */
    public void setGrade(String grade) {
        this.grade = grade;
    }

    /**
     * 获取用户成长值
     *
     * @return growth_value - 用户成长值
     */
    public Integer getGrowthValue() {
        return growthValue;
    }

    /**
     * 设置用户成长值
     *
     * @param growthValue 用户成长值
     */
    public void setGrowthValue(Integer growthValue) {
        this.growthValue = growthValue;
    }

    /**
     * 获取用户积分
     *
     * @return integral - 用户积分
     */
    public Integer getIntegral() {
        return integral;
    }

    /**
     * 设置用户积分
     *
     * @param integral 用户积分
     */
    public void setIntegral(Integer integral) {
        this.integral = integral;
    }

    /**
     * 获取头像地址
     *
     * @return image_url - 头像地址
     */
    public String getImageUrl() {
        return imageUrl;
    }

    /**
     * 设置头像地址
     *
     * @param imageUrl 头像地址
     */
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    /**
     * 获取用户昵称
     *
     * @return nick_name - 用户昵称
     */
    public String getNickName() {
        return nickName;
    }

    /**
     * 设置用户昵称
     *
     * @param nickName 用户昵称
     */
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    /**
     * 获取用户名称
     *
     * @return user_name - 用户名称
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置用户名称
     *
     * @param userName 用户名称
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 获取用户生日
     *
     * @return birthday - 用户生日
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * 设置用户生日
     *
     * @param birthday 用户生日
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * 获取省份
     *
     * @return province - 省份
     */
    public Integer getProvince() {
        return province;
    }

    /**
     * 设置省份
     *
     * @param province 省份
     */
    public void setProvince(Integer province) {
        this.province = province;
    }

    /**
     * 获取市
     *
     * @return city - 市
     */
    public Integer getCity() {
        return city;
    }

    /**
     * 设置市
     *
     * @param city 市
     */
    public void setCity(Integer city) {
        this.city = city;
    }

    /**
     * 获取区
     *
     * @return district - 区
     */
    public Integer getDistrict() {
        return district;
    }

    /**
     * 设置区
     *
     * @param district 区
     */
    public void setDistrict(Integer district) {
        this.district = district;
    }

    /**
     * 获取旺旺
     *
     * @return wang_wang - 旺旺
     */
    public String getWangWang() {
        return wangWang;
    }

    /**
     * 设置旺旺
     *
     * @param wangWang 旺旺
     */
    public void setWangWang(String wangWang) {
        this.wangWang = wangWang;
    }

    /**
     * 获取QQ
     *
     * @return qq - QQ
     */
    public String getQq() {
        return qq;
    }

    /**
     * 设置QQ
     *
     * @param qq QQ
     */
    public void setQq(String qq) {
        this.qq = qq;
    }

    /**
     * 获取微信
     *
     * @return wei_xin - 微信
     */
    public String getWeiXin() {
        return weiXin;
    }

    /**
     * 设置微信
     *
     * @param weiXin 微信
     */
    public void setWeiXin(String weiXin) {
        this.weiXin = weiXin;
    }

    /**
     * 获取用户余额
     *
     * @return balance - 用户余额
     */
    public Long getBalance() {
        return balance;
    }

    /**
     * 设置用户余额
     *
     * @param balance 用户余额
     */
    public void setBalance(Long balance) {
        this.balance = balance;
    }

    /**
     * 获取会员类型（会员，会长）数据字典获取
     *
     * @return type - 会员类型（会员，会长）数据字典获取
     */
    public String getType() {
        return type;
    }

    /**
     * 设置会员类型（会员，会长）数据字典获取
     *
     * @param type 会员类型（会员，会长）数据字典获取
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取允许设备最大接入数量
     *
     * @return max_login_number - 允许设备最大接入数量
     */
    public Integer getMaxLoginNumber() {
        return maxLoginNumber;
    }

    /**
     * 设置允许设备最大接入数量
     *
     * @param maxLoginNumber 允许设备最大接入数量
     */
    public void setMaxLoginNumber(Integer maxLoginNumber) {
        this.maxLoginNumber = maxLoginNumber;
    }

    /**
     * 获取用户登录身份令牌
     *
     * @return to_ken - 用户登录身份令牌
     */
    public String getToKen() {
        return toKen;
    }

    /**
     * 设置用户登录身份令牌
     *
     * @param toKen 用户登录身份令牌
     */
    public void setToKen(String toKen) {
        this.toKen = toKen;
    }

    /**
     * 获取是否年缴费( 0 - 否，1 - 是) 第一次缴费后必须按年缴费
     *
     * @return is_year_payment - 是否年缴费( 0 - 否，1 - 是) 第一次缴费后必须按年缴费
     */
    public Byte getIsYearPayment() {
        return isYearPayment;
    }

    /**
     * 设置是否年缴费( 0 - 否，1 - 是) 第一次缴费后必须按年缴费
     *
     * @param isYearPayment 是否年缴费( 0 - 否，1 - 是) 第一次缴费后必须按年缴费
     */
    public void setIsYearPayment(Byte isYearPayment) {
        this.isYearPayment = isYearPayment;
    }

    /**
     * 获取登录设备token
     *
     * @return device_token - 登录设备token
     */
    public String getDeviceToken() {
        return deviceToken;
    }

    /**
     * 设置登录设备token
     *
     * @param deviceToken 登录设备token
     */
    public void setDeviceToken(String deviceToken) {
        this.deviceToken = deviceToken;
    }

    /**
     * 获取登录设备类型
     *
     * @return device_type - 登录设备类型
     */
    public String getDeviceType() {
        return deviceType;
    }

    /**
     * 设置登录设备类型
     *
     * @param deviceType 登录设备类型
     */
    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取用户是否被锁定(0:未锁定，1:锁定)
     *
     * @return locked - 用户是否被锁定(0:未锁定，1:锁定)
     */
    public Short getLocked() {
        return locked;
    }

    /**
     * 设置用户是否被锁定(0:未锁定，1:锁定)
     *
     * @param locked 用户是否被锁定(0:未锁定，1:锁定)
     */
    public void setLocked(Short locked) {
        this.locked = locked;
    }
}