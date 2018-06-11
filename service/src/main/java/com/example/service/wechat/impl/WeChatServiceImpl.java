package com.example.service.wechat.impl;

import com.example.base.login.OAuthInfo;
import com.example.base.login.OUserInfo;
import com.example.mapper.login.OAuthInfoMapper;
import com.example.mapper.login.OUserInfoMapper;
import com.example.service.wechat.WeChatService;
import com.example.util.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 微信登陆验证
 *
 * @author Wei.Guang
 * @create 2018-06-06 14:16
 **/
@Service
public class WeChatServiceImpl extends BaseServiceImpl<OUserInfo> implements WeChatService {

    @Autowired
    private OAuthInfoMapper oAuthInfoMapper;

    @Autowired
    private OUserInfoMapper oUserInfoMapper;

    @Override
    public OAuthInfo saveWXUserInfo(Map<String, String> map) {
        OUserInfo userInfo = new OUserInfo();
        OAuthInfo authInfo = new OAuthInfo();
        userInfo.setNicname(map.get("nickname"));
        userInfo.setSex(Integer.parseInt(String.valueOf(map.get("sex"))));
        userInfo.setAvatar(map.get("headimgurl"));
        int userInfoId = oUserInfoMapper.saveUserInfo(userInfo);
        authInfo.setUserId(userInfo.getId());
        authInfo.setIdentifyType("wx");
        authInfo.setWxOpenid(map.get("openId"));
        authInfo.setCredential(map.get("accessToken"));
        int authInfoId = oAuthInfoMapper.saveAuthInfo(authInfo);
        return oAuthInfoMapper.getAuthInfoById(authInfo.getId());
    }

    @Override
    public OUserInfo getUserByWeiXinID(String openId) {
        int userId = oAuthInfoMapper.getUserIdByOpenId(openId, "wx");
        return oUserInfoMapper.getUserInfoById(userId);
    }
}
