package com.example.service.wechat;

import com.alibaba.fastjson.JSONObject;
import com.example.base.login.OUserInfo;

/**
 * 微信第三方登录接口
 *
 * @author Wei.Guang
 * @create 2018-06-08 16:14
 **/
public interface WeixinAuthService extends OAuthService {


    /**
     * 第二步：通过code获取access_token
     * @param code 授权临时票据
     * @return
     */
    JSONObject getAccessToken(String code);

    /**
     * 第三步：刷新或续期access_token使用(如果需要)
     * @param refreshToken 用户刷新access_token
     * @return
     */
    String refreshAccessToken(String refreshToken);

    /**
     * 第四步：拉取用户信息(需scope为 snsapi_userinfo)
     * @param accessToken 接口调用凭证
     * @param OpenId 授权用户唯一标识
     * @return
     */
    OUserInfo getUserInfo(String accessToken, String OpenId);
}
