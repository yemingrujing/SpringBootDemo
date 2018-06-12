package com.example.controller.login;

import com.alibaba.fastjson.JSONObject;
import com.example.base.login.OUserInfo;
import com.example.service.wechat.WeixinAuthService;
import com.example.util.chat.CheckoutUtil;
import com.example.util.common.StringUtil;
import com.example.util.login.TokenUtils;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Map;

/**
 * 登录
 *
 * @author Wei.Guang
 * @create 2018-06-06 17:14
 **/
@Controller
@RequestMapping("/login")
@Slf4j
public class LoginController {

    @Autowired
    protected HttpServletRequest request;

    /**
     * 验证码生成器
     */
    @Autowired
    private DefaultKaptcha defaultKaptcha;

    /**
     * 微信登录
     */
    @Autowired
    private WeixinAuthService weixinAuthService;

    /**
     * 登陆首页
     * @param model
     * @return
     */
    @RequestMapping(value = {"", "/", "/index"})
    public String login(Model model){
        String index = "/login";
        model.addAttribute("name", index);
        return "login";
    }

    /**
     * 微信登录授权判断
     * @param request
     * @return
     */
    @RequestMapping("/loginByWx")
    public String loginByWx() {
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
                //token失效
            }

            // 数据库中查询微信号是否绑定平台账号
            if (weixinAuthService.isAuthorize(openId, "wx")) {
                // 刷新或续期access_token使用
                weixinAuthService.refreshAccessToken(refreshToken);
                //刷新用户信息

                //获取用户信息
                OUserInfo userInfo = weixinAuthService.getUserInfoByOpenId(openId, "wx");
                //获取用户头像

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

    /**
     * 执行登录
     * @param username
     * @param password
     * @param returnUrl
     * @param model
     * @return
     */
    @RequestMapping("/doLogin")
    public String doLogin(String username, String password, String token, String returnUrl, Model model) {
        String captchaId = (String) request.getSession().getAttribute("vrifyCode");
        String parameter = request.getParameter("vrifyCode");
        //token不为空，以前登录过，验证token是否正确
        if (StringUtil.isBlank(token)) {
            //判断token是否和本地数据库一致
            if (true) {
                //判断token是否过期
                try {
                    Map<String, Object> map = TokenUtils.valid(token);
                    int result = (int) map.get("result");
                    if (i == 0) {
                        return "index";
                    } else {
                        model.addAttribute("error", "密码已过期，请重新登录！");
                        return "login";
                    }
                } catch (Exception e) {
                    log.error("token解析失败", ExceptionUtils.getStackTrace(e));
                    e.printStackTrace();
                }
            } else {
                return "login";
            }
        } else {
            //不能为空
            if (StringUtil.isBlank(username) || StringUtil.isBlank(password) || StringUtil.isBlank(parameter)) {
                model.addAttribute("error", "用户名/密码/验证码不能为空！");
                return "login";
            }
            //验证码错误
            if (captchaId.equals(parameter)) {
                model.addAttribute("error", "验证码错误！");
                return "login";
            }
            //用户名或密码错误
            if (false) {
                return "login";
            }

            //登录成功，生成token，下次根据token登录
            try {
                //登录失效以月计算
                token = TokenUtils.getToken(username, 12);
                //保存token

                //传回前端
                model.addAttribute("token", token);
            } catch (Exception e) {
                log.error("token生成失败", ExceptionUtils.getStackTrace(e));
                e.printStackTrace();
            }
        }

        return "/index";
    }

    /**
     * 生成验证码
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/createKaptcha")
    public void createkaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
        byte[] captchaChallengeAsJpeg = null;
        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
        try {
            //生产验证码字符串并保存到session中
            String createText = defaultKaptcha.createText();
            request.getSession().setAttribute("vrifyCode", createText);
            //使用生产的验证码字符串返回一个BufferedImage对象并转为byte写入到byte数组中
            BufferedImage challenge = defaultKaptcha.createImage(createText);
            ImageIO.write(challenge, "jpg", jpegOutputStream);
        } catch (IllegalArgumentException e) {
            log.error("生成图片验证码失败", ExceptionUtils.getStackTrace(e));
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

        //定义response输出类型为image/jpeg类型，使用response输出流输出图片的byte数组
        captchaChallengeAsJpeg = jpegOutputStream.toByteArray();
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        ServletOutputStream responseOutputStream =
                response.getOutputStream();
        responseOutputStream.write(captchaChallengeAsJpeg);
        responseOutputStream.flush();
        responseOutputStream.close();
    }


}
