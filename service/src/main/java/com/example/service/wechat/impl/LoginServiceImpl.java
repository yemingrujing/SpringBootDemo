package com.example.service.wechat.impl;

import com.example.base.login.User;
import com.example.mapper.login.UserAuthsMapper;
import com.example.mapper.login.UserMapper;
import com.example.service.wechat.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 用户登录Service
 *
 * @author Wei.Guang
 * @create 2018-06-12 17:44
 **/
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserAuthsMapper userAuthsMapper;

    @Override
    public User loginByPassword(String userName, String password) {

        return userMapper.loginByPassword(userName, password);
    }

    @Override
    public User loginByToken(String userName, String token) {
        return userMapper.loginByToken(userName,token);
    }

    @Override
    public String getToken(int userId) {

        return userAuthsMapper.getToken(userId);
    }

    @Override
    public int saveToken(int userId, String token) {

        return userAuthsMapper.saveToken(userId, token);
    }

    @Override
    public int register(User user) {
        Date date = new Date();
        user.setCreateTime(date);
        int i = userMapper.register(user);
        userAuthsMapper.register(user.getId());
        return i;
    }

    @Override
    public User loginByUsername(String userName) {
        return userMapper.getUserInfo(userName);
    }

    @Override
    public User loginByPhone(String phone) {
        return userMapper.loginByPhone(phone);
    }
}
