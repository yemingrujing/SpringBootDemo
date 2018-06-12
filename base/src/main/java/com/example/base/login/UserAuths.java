package com.example.base.login;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "c_user_auths")
public class UserAuths {
    /**
     * id
     */
    @Id
    private Integer id;

    /**
     * 用户ID
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 登陆类型
     */
    @Column(name = "identify_type")
    private String identifyType;

    /**
     * 微信openid
     */
    @Column(name = "wx_openid")
    private String wxOpenid;

    /**
     * qq  openid
     */
    @Column(name = "qq_openid")
    private String qqOpenid;

    /**
     * 授权凭证
     */
    private String credential;

    /**
     * 是否已经验证
     */
    private Integer verified;

    /**
     * 获取id
     *
     * @return id - id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置id
     *
     * @param id id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取用户ID
     *
     * @return user_id - 用户ID
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户ID
     *
     * @param userId 用户ID
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取登陆类型
     *
     * @return identify_type - 登陆类型
     */
    public String getIdentifyType() {
        return identifyType;
    }

    /**
     * 设置登陆类型
     *
     * @param identifyType 登陆类型
     */
    public void setIdentifyType(String identifyType) {
        this.identifyType = identifyType;
    }

    /**
     * 获取微信openid
     *
     * @return wx_openid - 微信openid
     */
    public String getWxOpenid() {
        return wxOpenid;
    }

    /**
     * 设置微信openid
     *
     * @param wxOpenid 微信openid
     */
    public void setWxOpenid(String wxOpenid) {
        this.wxOpenid = wxOpenid;
    }

    /**
     * 获取qq  openid
     *
     * @return qq_openid - qq  openid
     */
    public String getQqOpenid() {
        return qqOpenid;
    }

    /**
     * 设置qq  openid
     *
     * @param qqOpenid qq  openid
     */
    public void setQqOpenid(String qqOpenid) {
        this.qqOpenid = qqOpenid;
    }

    /**
     * 获取授权凭证
     *
     * @return credential - 授权凭证
     */
    public String getCredential() {
        return credential;
    }

    /**
     * 设置授权凭证
     *
     * @param credential 授权凭证
     */
    public void setCredential(String credential) {
        this.credential = credential;
    }

    /**
     * 获取是否已经验证
     *
     * @return verified - 是否已经验证
     */
    public Integer getVerified() {
        return verified;
    }

    /**
     * 设置是否已经验证
     *
     * @param verified 是否已经验证
     */
    public void setVerified(Integer verified) {
        this.verified = verified;
    }
}