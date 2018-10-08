package com.example.util.login;

/**
 * 微信登录相关参数
 *
 * @author Wei.Guang
 * @create 2018-06-12 13:40
 **/
public class ChatParam {

    private ChatParam() {
    }

    /**
     * 微信开发者测试账号
     */
    public static final String APPID = "wx9401dafed1d81ef0";

    /**
     * 同意授权后跳转的 URL
     */
    public static final String REDIRECT_URI = "http://bed383fb.ngrok.io/login/loginByWx";

    /**
     * 微信开发者测试账号密码
     */
    public static final String SECRET = "a6c5cce6b076ff2fc0dfe4e8001da941";

    /**
     * 获取access_token url
     */
    public static final String TOKENUTL = "https://api.weixin.qq.com/sns/oauth2/access_token?" +
            "appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";

    /**
     * 刷新access_token有效期 url
     */
    public static final String REFRESHTOKEN = "https://api.weixin.qq.com/sns/oauth2/refresh_token?" +
            "appid=APPID&grant_type=refresh_token&refresh_token=REFRESH_TOKEN";

    /**
     * 检验授权凭证（access_token）是否有效
     */
    public static final String CHECKURL = "https://api.weixin.qq.com/sns/auth?access_token=ACCESS_TOKEN&openid=OPENID";

    /**
     * 根据access_token和openId获取用户信息
     */
    public static final String GETUSERINFOURL = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=LANG";
}
