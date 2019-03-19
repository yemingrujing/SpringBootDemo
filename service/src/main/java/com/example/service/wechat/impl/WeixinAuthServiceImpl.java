package com.example.service.wechat.impl;

import com.alibaba.fastjson.JSONObject;
import com.example.base.login.OAuthInfo;
import com.example.base.login.OUserInfo;
import com.example.mapper.login.OAuthInfoMapper;
import com.example.mapper.login.OUserInfoMapper;
import com.example.service.config.RestClient;
import com.example.service.wechat.WeixinAuthService;
import com.example.util.chat.ChatParam;
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
    public OUserInfo saveUserInfo(String accessToken, String openId, String idenType) {
        OUserInfo userInfo = new OUserInfo();
        OAuthInfo authInfo = new OAuthInfo();
        //保存用户信息
        String url = ChatParam.GETUSERINFOURL.replace("ACCESS_TOKEN", accessToken).
                replace("OPENID", openId).
                replace("LANG", "zh_CN");
        JSONObject json = restClient.get(url);
        //昵称
        String nickname = (String) json.get("nickname");
        //性别
        int sex = (int) json.get("sex");
        //头像
        String headimgurl = (String) json.get("headimgurl");
        userInfo.setNicname(nickname);
        userInfo.setSex(sex);
        userInfo.setAvatar(headimgurl);
        oUserInfoMapper.saveUserInfo(userInfo);
        //保存授权信息
        if ("wx".equals(idenType)) {
            authInfo.setWxOpenid(openId);
        } else {
            authInfo.setQqOpenid(openId);
        }
        authInfo.setCredential(accessToken);
        authInfo.setIdentifyType(idenType);
        authInfo.setUserId(userInfo.getId());
        oAuthInfoMapper.saveAuthInfo(authInfo);
        return userInfo;
    }

    @Override
    public boolean isAuthorize(String openId, String idenType) {
        OAuthInfo authInfo = new OAuthInfo();
        if ("wx".equals(idenType)) {
            authInfo.setWxOpenid(openId);
        } else {
            authInfo.setQqOpenid(openId);
        }
        authInfo.setIdentifyType(idenType);
        return oAuthInfoMapper.isAuthorize(authInfo) == 0 ? false : true;
    }

    @Override
    public int updateAuthInfo(String openId, String accessToken, String idenType) {
        OAuthInfo authInfo = new OAuthInfo();
        if ("wx".equals(idenType)) {
            authInfo.setWxOpenid(openId);
        } else {
            authInfo.setQqOpenid(openId);
        }
        authInfo.setCredential(accessToken);
        authInfo.setIdentifyType(idenType);
        return oAuthInfoMapper.updateAuthInfo(authInfo);
    }

    @Override
    public int updateUserInfo(String openId, String accessToken, String idenType) {
        return 0;
    }

    @Override
    public OAuthInfo getAuthInfoByOpenId(String openId, String idenType) {
        return oAuthInfoMapper.getAuthInfoByOpenId(openId, idenType);
    }

    @Override
    public OUserInfo getUserInfoByOpenId(String openId, String idenType) {
        int userId = oAuthInfoMapper.getUserIdByOpenId(openId, idenType);
        OUserInfo userInfo = oUserInfoMapper.getUserInfoById(userId);
        return userInfo;
    }

    @Override
    public Boolean checkAccessToken(String openId, String accessToken) {
        String url = ChatParam.CHECKURL.replace("ACCESS_TOKEN", accessToken).
                replace("OPENID", openId);
        JSONObject json = restClient.get(url);
        int code = (int) json.get("errcode");
        if (code == 0) {
            return true;
        }
        return false;
    }
}
