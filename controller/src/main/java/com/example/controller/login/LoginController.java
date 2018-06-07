package com.example.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 登录
 *
 * @author Wei.Guang
 * @create 2018-06-06 17:14
 **/
@Controller
@RequestMapping("/login")
public class LoginController {

    /**
     * 登陆首页
     * @return
     */
    @RequestMapping("/")
    public String login(){
        return "login";
    }
}
