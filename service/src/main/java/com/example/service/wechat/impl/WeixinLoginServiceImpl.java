package com.example.service.wechat.impl;

import com.alibaba.fastjson.JSONObject;
import com.example.base.login.User;
import com.example.base.login.UserAuths;
import com.example.service.config.RestClient;
import com.example.service.wechat.WeixinLoginService;
import com.example.util.chat.ChatParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 微信登录
 *
 * @author Wei.Guang
 * @create 2018-06-12 14:12
 **/
@Service
public class WeixinLoginServiceImpl implements WeixinLoginService {

    /**
     * Http请求类
     */
    @Autowired
    private RestClient restClient;

    @Override
    public JSONObject getAccessToken(String code) {
        String url = ChatParam.TOKENUTL.replace("APPID", ChatParam.APPID).
                replace("SECRET", ChatParam.SECRET).
                replace("CODE", code);
        return restClient.get(url);
    }

    @Override
    public String refreshAccessToken(String refreshToken) {
        String url = ChatParam.REFRESHTOKEN.replace("APPID", ChatParam.APPID).
                replace("REFRESH_TOKEN", refreshToken);
        JSONObject json = restClient.get(url);
        return (String) json.get("access_token");
    }

    @Override
    public JSONObject getAuthInfo(String accessToken, String openId) {
        String url = ChatParam.GETUSERINFOURL.replace("ACCESS_TOKEN", accessToken).
                replace("OPENID", openId).
                replace("LANG", "zh_CN");
        return restClient.get(url);
    }

    @Override
    public UserAuths queryAuthInfo(String openId, String idenType) {
        return null;
    }

    @Override
    public User queryUserInfo(String openId, String idenType) {
        return null;
    }
}
