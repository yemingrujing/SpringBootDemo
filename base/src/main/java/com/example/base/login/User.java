package com.example.base.login;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name = "c_user")
public class User {
    /**
     * 主键
     */
    @Id
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
    private Byte sex;

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
     * 头像地址（文件表Id）
     */
    @Column(name = "image_id")
    private Integer imageId;

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
     * 用户状态（0-注册用户，1-审核中，2-审核待付费，3-已付费成为会员，4-会员已过期）
     */
    private Short status;

    /**
     * 用户余额
     */
    private Long balance;

    /**
     * 用户类别（商会会员，网红，品牌方）数据字典获取
     */
    @Column(name = "category_code")
    private String categoryCode;

    /**
     * 会员类型（会员，会长）数据字典获取
     */
    private String type;

    /**
     * 用户登录令牌
     */
    @Column(name = "to_ken")
    private String toKen;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

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
    public Byte getSex() {
        return sex;
    }

    /**
     * 设置性别（男-0,1-女）
     *
     * @param sex 性别（男-0,1-女）
     */
    public void setSex(Byte sex) {
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
     * 获取头像地址（文件表Id）
     *
     * @return image_id - 头像地址（文件表Id）
     */
    public Integer getImageId() {
        return imageId;
    }

    /**
     * 设置头像地址（文件表Id）
     *
     * @param imageId 头像地址（文件表Id）
     */
    public void setImageId(Integer imageId) {
        this.imageId = imageId;
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
     * 获取用户状态（0-注册用户，1-审核中，2-审核待付费，3-已付费成为会员，4-会员已过期）
     *
     * @return status - 用户状态（0-注册用户，1-审核中，2-审核待付费，3-已付费成为会员，4-会员已过期）
     */
    public Short getStatus() {
        return status;
    }

    /**
     * 设置用户状态（0-注册用户，1-审核中，2-审核待付费，3-已付费成为会员，4-会员已过期）
     *
     * @param status 用户状态（0-注册用户，1-审核中，2-审核待付费，3-已付费成为会员，4-会员已过期）
     */
    public void setStatus(Short status) {
        this.status = status;
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
     * 获取用户类别（商会会员，网红，品牌方）数据字典获取
     *
     * @return category_code - 用户类别（商会会员，网红，品牌方）数据字典获取
     */
    public String getCategoryCode() {
        return categoryCode;
    }

    /**
     * 设置用户类别（商会会员，网红，品牌方）数据字典获取
     *
     * @param categoryCode 用户类别（商会会员，网红，品牌方）数据字典获取
     */
    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
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
     * 获取用户登录令牌
     *
     * @return to_ken - 用户登录令牌
     */
    public String getToKen() {
        return toKen;
    }

    /**
     * 设置用户登录令牌
     *
     * @param toKen 用户登录令牌
     */
    public void setToKen(String toKen) {
        this.toKen = toKen;
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
}