package com.example.service.wechat.impl;

import com.example.base.login.OUserInfo;
import com.example.mapper.login.OAuthInfoMapper;
import com.example.mapper.login.OUserInfoMapper;
import com.example.service.wechat.WeChatService;
import com.example.util.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public OUserInfo getUserByWeiXinID(String openId) {
        Integer userId = oAuthInfoMapper.getUserIdByOpenId(openId);
        return oUserInfoMapper.getUserByUserID(userId);
    }
}
