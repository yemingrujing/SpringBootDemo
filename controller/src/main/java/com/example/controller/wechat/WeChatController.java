package com.example.controller.wechat;

import com.example.base.login.OAuthInfo;
import com.example.base.login.OUserInfo;
import com.example.service.wechat.WeChatService;
import com.example.util.chat.CheckoutUtil;
import com.example.util.common.StringUtil;
import com.example.util.rest.RestClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * 微信第三方登陆
 *
 * @author Wei.Guang
 * @create 2018-06-05 11:09
 **/
@Controller
@RequestMapping("/wechat")
public class WeChatController {

    /**
     * 微信登陆操作service
     */
    @Autowired
    private WeChatService weChatService;

    /**
     * 引入rest客户端
     */
    @Autowired
    @Qualifier("restClient")
    private RestClient restClient;

    /**
     * 微信消息接收和token验证
     * @param model
     * @param request
     * @param response
     */
    @RequestMapping("/ownerCheck")
    public void ownerCheck(Model model, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("--------------- start cheeck! ---------------");
        boolean isGet = request.getMethod().toLowerCase().equals("get");
        PrintWriter print = null;
        if (isGet) {
            // 微信加密签名
            String signature = request.getParameter("signature");
            // 时间戳
            String timestamp = request.getParameter("timestamp");
            // 随机数
            String nonce = request.getParameter("nonce");
            // 随机字符串
            String echostr = request.getParameter("echostr");
            if (signature != null && CheckoutUtil.checkSignature(signature, timestamp, nonce)) {
                try {
                    print = response.getWriter();
                    print.write(echostr);
                    print.flush();
                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    print.close();
                }
            }
        }
    }

    /**
     * 微信引导页进入的方法
     * @param request
     * @param map
     * @return
     */
    @RequestMapping("/loginByWeiXin")
    public String loginByWeiXin(HttpServletRequest request){
        //// 微信接口自带 2 个参数
        String code = request.getParameter("code");
        String state = request.getParameter("state");
        System.out.println("code = " + code + ", state = " + state);

        if (code != null && !"".equals(code)) {
            // 授权成功, 微信获取用户openID
            Map<String, String> map = CheckoutUtil.getAccessToken(code);
            OAuthInfo authInfo = weChatService.saveWXUserInfo(map);
            String openid = authInfo.getWxOpenid();
            String accessToken = authInfo.getCredential();

            if (accessToken == null) {
                // Code 使用过 异常
                System.out.println("Code 使用过 异常.....");
                return "redirect:" + CheckoutUtil.getStartURLToGetCode();
            }
            // 数据库中查询微信号是否绑定平台账号
            OUserInfo userInfo = weChatService.getUserByWeiXinID(openid);
            if (userInfo == null) {
                String randomStr = StringUtil.generateStr(50);
                request.getSession().setAttribute(openid, randomStr);
                // 尚未绑定账号
                System.out.println("尚未绑定账号.....");
                return "redirect:/index.jsp?openid=" + openid + "&state=" + randomStr;
            }

            // 登录成功
            return "login";
        }
        // 未授权
        return "redirect:" + CheckoutUtil.getStartURLToGetCode();
    }


}
