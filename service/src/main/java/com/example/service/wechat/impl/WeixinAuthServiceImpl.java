package com.example.service.wechat.impl;

import com.alibaba.fastjson.JSONObject;
import com.example.base.login.OAuthInfo;
import com.example.base.login.OUserInfo;
import com.example.mapper.login.OAuthInfoMapper;
import com.example.mapper.login.OUserInfoMapper;
import com.example.service.wechat.WeixinAuthService;
import com.example.util.chat.ChatParam;
import com.example.util.rest.RestClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 微信第三方登录service
 *
 * @author Wei.Guang
 * @create 2018-06-08 16:34
 **/
@Service
public class WeixinAuthServiceImpl implements WeixinAuthService {

    @Autowired
    private OAuthInfoMapper oAuthInfoMapper;

    @Autowired
    private OUserInfoMapper oUserInfoMapper;

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
        return  restClient.get(url);
    }

    @Override
    public String refreshAccessToken(String refreshToken) {
        String url = ChatParam.REFRESHTOKEN.replace("APPID", ChatParam.APPID).
                replace("REFRESH_TOKEN", refreshToken);
        JSONObject json = restClient.get(url);
        return (String) json.get("access_token");
    }

    @Override
    public OUserInfo getUserInfo(String accessToken, String openId) {
        OUserInfo userInfo = new OUserInfo();
        String url = ChatParam.GETUSERINFOURL.replace("ACCESS_TOKEN", accessToken).
                replace("OPENID", openId);
        JSONObject json = restClient.get(url);
        //昵称
        String nickname = (String) json.get("nickname");
        //性别
        int sex = (int) json.get("sex");
        //头像
        String headimgurl = (String) json.get("headimgurl");
        userInfo.setNicname(nickname);
        userInfo.setStatus(sex);
        userInfo.setAvatar(headimgurl);
        return userInfo;
    }

    @Override
    public boolean isAuthorize(String openId, String accessToken, String idenType) {
        OAuthInfo authInfo = new OAuthInfo();
        if ("wx".equals(idenType)) {
            authInfo.setWxOpenid(openId);
        } else {
            authInfo.setQqOpenid(openId);
        }
        authInfo.setCredential(accessToken);
        authInfo.setIdentifyType(idenType);
        return oAuthInfoMapper.isAuthorize(authInfo) == 0 ? false : true;
    }

    @Override
    public OAuthInfo saveAuthInfo(String openId, String accessToken, String idenType) {
        OAuthInfo authInfo = new OAuthInfo();
        if ("wx".equals(idenType)) {
            authInfo.setWxOpenid(openId);
        } else {
            authInfo.setQqOpenid(openId);
        }
        authInfo.setCredential(accessToken);
        authInfo.setIdentifyType(idenType);
        oAuthInfoMapper.saveAuthInfo(authInfo);
        return authInfo;
    }
}
