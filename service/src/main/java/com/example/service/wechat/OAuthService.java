package com.example.service.wechat;

import com.example.base.login.OAuthInfo;
import com.example.base.login.OUserInfo;

/**
 * 第三方登录主接口
 *
 * @author Wei.Guang
 * @create 2018-06-08 15:57
 **/
public interface OAuthService {

    /**
     * 是否有授权登录权限
     * @param openId 授权用户唯一标识
     * @param accessToken 接口调用凭证
     * @param idenType 授权类型
     * @return
     */
    boolean isAuthorize(String openId, String idenType);

    /**
     * 更新授权信息
     * @param openId 授权用户唯一标识
     * @param accessToken 接口调用凭证
     * @param idenType 授权类型
     * @return
     */
    int updateAuthInfo(String openId, String accessToken, String idenType);

    /**
     * 更新用户信息
     * @param openId
     * @param accessToken
     * @param idenType
     * @return
     */
    int updateUserInfo(String openId, String accessToken, String idenType);

    /**
     * 根据openId获取授权信息
     * @param openId 授权用户唯一标识
     * @param idenType 授权类型
     * @return
     */
    OAuthInfo getAuthInfoByOpenId(String openId, String idenType);

    /**
     * 根据openId获取用户信息
     * @param openId 授权用户唯一标识
     * @param idenType 授权类型
     * @return
     */
    OUserInfo getUserInfoByOpenId(String openId, String idenType);

    /**
     * 检验token是否有效
     * @param openId
     * @param accessToken
     * @return
     */
    Boolean checkAccessToken(String accessToken, String openId);
}
