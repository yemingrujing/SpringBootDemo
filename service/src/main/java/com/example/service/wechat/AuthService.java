package com.example.service.wechat;

import com.example.base.login.User;
import com.example.base.login.UserAuths;

/**
 * 第三方登录公用接口
 *
 * @author Wei.Guang
 * @create 2018-06-12 13:59
 **/
public interface AuthService {

    /**
     * 查询授权信息
     * @param openId 授权用户唯一标识
     * @param idenType 授权类型
     * @return
     */
    UserAuths queryAuthInfo(String openId, String idenType);

    /**
     * 根据openId获取用户信息
     * @param openId 授权用户唯一标识
     * @param idenType 授权类型
     * @return
     */
    User queryUserInfo(String openId, String idenType);
}
