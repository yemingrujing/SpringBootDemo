package com.example.service.wechat;

import com.alibaba.fastjson.JSONObject;
import com.example.service.wechat.AuthService;

/**
 * 微信登录service
 *
 * @author Wei.Guang
 * @create 2018-06-12 14:08
 **/
public interface WeixinLoginService extends AuthService {

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
     * 获取微信登录用户信息
     * @param accessToken
     * @param openId
     * @return
     */
    JSONObject getAuthInfo(String accessToken, String openId);
}
