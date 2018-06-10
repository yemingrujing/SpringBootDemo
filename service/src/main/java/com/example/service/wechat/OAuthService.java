package com.example.service.wechat;

import com.example.base.login.OAuthInfo;

/**
 * 第三方登录主接口
 *
 * @author Wei.Guang
 * @create 2018-06-08 15:57
 **/
public interface OAuthService {

    /**
     * 是否获取授权信息
     * @param openId 授权用户唯一标识
     * @param accessToken 接口调用凭证
     * @param idenType 授权类型
     * @return
     */
    boolean isAuthorize(String openId, String accessToken, String idenType);

    /**
     * 保存授权信息
     * @param openId 授权用户唯一标识
     * @param accessToken 接口调用凭证
     * @param idenType 授权类型
     * @return
     */
    OAuthInfo saveAuthInfo(String openId, String accessToken, String idenType);
}
