package com.example.controller.login;

import com.alibaba.fastjson.JSONObject;
import com.example.base.login.OUserInfo;
import com.example.base.login.User;
import com.example.service.wechat.LoginService;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

/**
 * 登录
 *
 * @author Wei.Guang
 * @create 2018-06-06 17:14
 **/
@Controller
@RequestMapping("/user")
@Slf4j
public class LoginController {

    @Autowired
    protected HttpServletRequest request;

    /**
     * 验证码生成器
     */
    @Autowired
    private DefaultKaptcha defaultKaptcha;

    @Autowired
    private LoginService loginService;

    /**
     * 微信登录
     */
    @Autowired
    private WeixinAuthService weixinAuthService;

//    /**
//     * 登陆首页
//     * @param model
//     * @return
//     */
//    @RequestMapping(value = {"", "/", "/index"})
//    public String login(Model model){
//        String index = "/login";
//        model.addAttribute("name", index);
//        return "login";
//    }

    /**
     * welcome跳转
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    /**
     * welcome跳转
     * @return
     */
    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome() {
        return "welcome";
    }

    /**
     * login跳转
     * @param model
     * @param user
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Model model, @ModelAttribute("user") User user) {
        model.addAttribute("user", user);
        return "login";
    }

    /**
     * 注册页面
     * @param model
     * @return
     */
    @RequestMapping(value = {"/register"}, method = RequestMethod.GET)
    public String register(Model model) {

        return "register";
    }

    /**
     * 注册方法
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = {"/doRegister"}, method = RequestMethod.POST)
    private String doResgister(User user, Model model) {
        int i = loginService.register(user);
        if (i > 0) {
            model.addAttribute("info", "注册成功");
            return "login";
        } else{
            model.addAttribute("info", "注册失败");
            return "register";
        }

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
     * @param userName
     * @param passWord
     * @param returnUrl
     * @param model
     * @return
     */
    @RequestMapping(value = {"/doLogin"}, method = RequestMethod.POST)
    public String doLogin(String userName, String passWord, String toKen, String returnUrl, Model model) {
        String captchaId = (String) request.getSession().getAttribute("vrifyCode");
        String parameter = request.getParameter("vrifyCode");

        //判断是邮箱还是手机号的正则表达式
        String em = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        String ph = "^[1][34578]\\d{9}$";

        //不能为空
        if (StringUtil.isBlank(userName) || StringUtil.isBlank(passWord)) {
            model.addAttribute("error", "用户名或密码不能为空！");
            return "login";
        }

        if (userName.matches(ph)) {
            User user = loginService.loginByPhone(userName);
            if (user != null) {
                if (StringUtil.isBlank(passWord)){
                    if (user.getToKen() != toKen){
                        model.addAttribute("error", "密码已过期，请重新登录");
                        return "login";
                    } else {
                        model.addAttribute("info", "登录成功！");
                        return "redirect:/index";
                    }
                } else {
                    if (passWord.equals(user.getPassWord())){
                        //获取token
                        toKen = TokenUtils.getToken(userName);
                        //保存token
                        loginService.saveToken(user.getId(), toKen);
                        //传回前端
                        model.addAttribute("token", toKen);
                        model.addAttribute("info", "密码输入正确，登录成功！");
                        return "redirect:/index";
                    } else {
                        model.addAttribute("error", "密码错误，请重新输入！");
                        return "login";
                    }
                }
            } else {
                model.addAttribute("error", "手机用户不存在，请先注册！");
                return "login";
            }
        } else {
            User user = loginService.loginByUsername(userName);
            if (user != null){
                if (StringUtil.isBlank(passWord)){
                    if (user.getToKen() != toKen){
                        model.addAttribute("error", "密码已过期，请重新登录");
                        return "login";
                    } else {
                        model.addAttribute("info", "登录成功！");
                        return "redirect:/index";
                    }
                } else {
                    if (passWord.equals(user.getPassWord())){
                        //获取token
                        toKen = TokenUtils.getToken(userName);
                        //保存token
                        loginService.saveToken(user.getId(), toKen);
                        //传回前端
                        model.addAttribute("token", toKen);
                        model.addAttribute("info", "密码输入正确，登录成功！");
                        return "redirect:/index";
                    } else {
                        model.addAttribute("error", "密码错误，请重新输入！");
                        return "login";
                    }
                }
            } else {
                model.addAttribute("error", "用户名不存在，请先注册！");
                return "login";
            }
        }
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
