package com.example.mapper.login;

import com.example.base.login.User;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface UserMapper extends Mapper<User> {

    /**
     * 登录根据用户名和密码查询用户信息
     * @param userName
     * @param password
     * @return
     */
    User loginByPassword(@Param("userName") String userName, @Param("password") String password);

    /**
     * 注册
     * @param user
     * @return
     */
    int register(@Param("user") User user);

    /**
     * 用户是否注册
     * @param userName
     * @return
     */
    User getUserInfo(@Param("userName") String userName);

    /**
     * 根据用户名和token查询用户信息
     * @param userName
     * @param token
     * @return
     */
    User loginByToken(String userName, String token);

    /**
     * 根据手机号查询用户信息
     * @param phone
     * @return
     */
    User loginByPhone(String phone);
}