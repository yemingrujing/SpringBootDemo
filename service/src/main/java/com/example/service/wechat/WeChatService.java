package com.example.service.wechat;

import com.example.base.login.OAuthInfo;
import com.example.base.login.OUserInfo;

import java.util.Map;

/**
 * 微信登陆验证service
 *
 * @author Wei.Guang
 * @create 2018-06-06 14:10
 **/
public interface WeChatService {

    /**
     * 保存用户第三方登录信息
     *
     * @param map
     * @return
     */
    OAuthInfo saveWXUserInfo(Map<String, String> map);

    /**
     * 数据库中查询微信号是否绑定平台账号
     *
     * @param openId 一个微信号与一个公众号对应一个固定不变的openid
     * @return
     */
    OUserInfo getUserByWeiXinID(String openId);
}
