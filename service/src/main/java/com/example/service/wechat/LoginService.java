package com.example.service.wechat;

import com.example.base.login.User;

/**
 * 登录接口
 *
 * @author Wei.Guang
 * @create 2018-06-12 17:38
 **/
public interface LoginService {

    /**
     * 查询登录用户信息()
     *
     * @param userName 用户名
     * @param password 密码
     * @return
     */
    User loginByPassword(String userName, String password);

    /**
     * 查询登录用户信息
     *
     * @param userName 用户名
     * @param token    token
     * @return
     */
    User loginByToken(String userName, String token);

    /**
     * 根据userId查询token
     *
     * @param userId 用户Id
     * @return
     */
    String getToken(int userId);

    /**
     * 保存token
     *
     * @param userId
     * @param token
     */
    int saveToken(int userId, String token);

    /**
     * 注册
     *
     * @param user
     * @return
     */
    int register(User user);

    /**
     * 根据用户名查询用户信息
     *
     * @param userName
     * @return
     */
    User loginByUsername(String userName);

    /**
     * 根据手机号查询用户信息
     *
     * @param phone
     * @return
     */
    User loginByPhone(String phone);
}
