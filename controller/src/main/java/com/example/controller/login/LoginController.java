package com.example.controller.login;

import com.alibaba.fastjson.JSONObject;
import com.example.base.login.OUserInfo;
import com.example.service.wechat.WeixinAuthService;
import com.example.util.chat.CheckoutUtil;
import com.example.util.common.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

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
     * 微信登录
     */
    @Autowired
    private WeixinAuthService weixinAuthService;

    /**
     * 登陆首页
     * @return
     */
    @RequestMapping("/")
    public String login(){
        return "login";
    }

    /**
     * 微信登录授权判断
     * @param request
     * @return
     */
    @RequestMapping("/loginByWx")
    public String loginByWx(HttpServletRequest request) {
        // 微信接口自带 2 个参数
        String code = request.getParameter("code");
        String state = request.getParameter("state");
        System.out.println("code = " + code + ", state = " + state);

        if (code != null && !"".equals(code)) {
            //授权成功，获取用户openId
            //根据code获取access_token
            JSONObject json = weixinAuthService.getAccessToken(code);

            //code使用过，重新获取
            if (json.get("access_token") == null) {
                return "redirect:" + CheckoutUtil.getStartURLToGetCode();
            }

            // 授权用户唯一标识
            String openId = (String) json.get("openid");
            // 接口调用凭证
            String accessToken = (String) json.get("access_token");
            // 授权用户唯一标识
            String refreshToken = (String) json.get("refresh_token");

            if (weixinAuthService.checkAccessToken(accessToken, openId)) {

            }

            // 数据库中查询微信号是否绑定平台账号
            if (weixinAuthService.isAuthorize(openId, "wx")) {
                // 刷新或续期access_token使用
                weixinAuthService.refreshAccessToken(refreshToken);
                //刷新用户信息

                //获取用户信息
                OUserInfo userInfo = weixinAuthService.getUserInfoByOpenId(openId, "wx");
                System.out.println(userInfo.toString());
            } else {
                //没有用微信授权登录过
                System.out.println("尚未登录过账号.....");
                OUserInfo userInfo = weixinAuthService.saveUserInfo(accessToken, openId, "wx");
                System.out.println(userInfo.toString());
            }
            return "/login";
        }
        // 未授权
        return "redirect:" + CheckoutUtil.getStartURLToGetCode();
    }
}
