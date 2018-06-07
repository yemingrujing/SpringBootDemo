package com.example.util.chat;

import com.example.base.login.OAuthInfo;
import com.example.util.common.HttpClientUtil;
import com.example.util.common.JacksonUtils;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

/**
 * 验证签名
 *
 * @author Wei.Guang
 * @create 2018-06-05 11:26
 **/
public class CheckoutUtil {

    private CheckoutUtil(){}

    /**
     * 与接口配置信息中的Token要一致
     */
    private static String token = "handsomeKing";

    /**
     * 验证签名
     *
     * @param signature 微信加密签名
     * @param timestamp 时间戳
     * @param nonce     随机数
     * @return
     */
    public static Boolean checkSignature(String signature, String timestamp, String nonce) {
        String[] arr = new String[]{token, timestamp, nonce};
        // 将token、timestamp、nonce三个参数进行字典序排序
        // Arrays.sort(arr);
        sort(arr);
        StringBuilder content = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
        }
        MessageDigest md = null;
        String tmpStr = null;

        try {
            md = MessageDigest.getInstance("SHA-1");
            // 将三个参数字符串拼接成一个字符串进行MD5加密
            byte[] digest = md.digest(content.toString().getBytes());
            tmpStr = byteToStr(digest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        content = null;
        return tmpStr != null ? tmpStr.equals(signature.toUpperCase()) : false;
    }

    /**
     * 将字节数组转换为十六进制字符串
     *
     * @param byteArray byte数组
     * @return
     */
    private static String byteToStr(byte[] byteArray) {
        String strDigest = "";
        for (int i = 0; i < byteArray.length; i++) {
            strDigest += byteToHexStr(byteArray[i]);
        }
        return strDigest;
    }

    /**
     * 将字节转换为十六进制字符串
     *
     * @param mByte
     * @return
     */
    private static String byteToHexStr(byte mByte) {
        char[] digit = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        char[] tempArr = new char[2];
        tempArr[0] = digit[(mByte >>> 4) & 0X0F];
        tempArr[1] = digit[mByte & 0X0F];
        String s = new String(tempArr);
        return s;
    }

    /**
     * 排序
     *
     * @param a要排序的数组
     */
    public static void sort(String[] a) {
        for (int i = 0; i < a.length - 1; i++) {
            for (int j = i + 1; j < a.length; j++) {
                if (a[j].compareTo(a[i]) < 0) {
                    String temp = a[i];
                    a[i] = a[j];
                    a[j] = temp;
                }
            }
        }
    }

    /**
     * 第一步：用户同意授权，获取code(引导关注者打开如下页面：)
     * 获取 code、state
     *
     * @return
     */
    public static String getStartURLToGetCode() {
        String takenUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?" +
                "appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&" +
                "scope=SCOPE&state=STATE#wechat_redirect";
        takenUrl = takenUrl.replace("APPID", ChatParam.APPID);
        takenUrl = takenUrl.replace("REDIRECT_URI", ChatParam.REDIRECT_URI);
        //FIXME ： snsapi_userinfo
        takenUrl = takenUrl.replace("SCOPE", "snsapi_userinfo");
        System.out.println(takenUrl);
        return takenUrl;
    }

    /**
     * 获取用户信息
     *
     * @param code 上一步的 code
     * @return
     */
    public static OAuthInfo getAccessToken(String code) {
        //第二步：通过code换取网页授权access_token
        String authUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
        authUrl = authUrl.replace("SECRET", ChatParam.SECRET);
        authUrl = authUrl.replace("APPID", ChatParam.APPID);
        authUrl = authUrl.replace("CODE", code);

        OAuthInfo auth = null;
        try {
            Map<String, String> jsonMap = HttpClientUtil.sendGetRequestReturnMap(authUrl, null);
            String openid = jsonMap.get("openid");
            String accessToken = jsonMap.get("access_token");
            String refreshToken = jsonMap.get("refresh_token");

            // 验证access_token是否失效；展示都不需要
            String checkUrl = "https://api.weixin.qq.com/sns/auth?access_token=" + accessToken + "&openid=" + openid;
            Map<String, String> checkuserInfo = HttpClientUtil.sendGetRequestReturnMap(checkUrl, null);
            //第三步：刷新access_token（如果需要）
            if (!"0".equals(checkuserInfo.get("errcode"))) {
                // 刷新access_token（如果需要）-----暂时没有使用,参考文档https://mp.weixin.qq.com/wiki，
                String refreshTokenUrl = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=" +
                        ChatParam.APPID + "&grant_type=refresh_token&refresh_token=" + refreshToken;
                Map<String, String> refreshInfo = HttpClientUtil.sendGetRequestReturnMap(refreshTokenUrl, null);
                accessToken = refreshInfo.get("access_token");

                // 第四步：拉取用户信息(需scope为 snsapi_userinfo)
                String infoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=" + accessToken
                        + "&openid=" + openid
                        + "&lang=zh_CN";
                System.out.println("infoUrl:" + infoUrl);
                Map<String, String> userInfo = HttpClientUtil.sendGetRequestReturnMap(infoUrl, null);
                System.out.println("JSON-----" + JacksonUtils.map2pojo(userInfo));
                System.out.println("名字-----" + userInfo.get("nickname"));
                System.out.println("头像-----" + userInfo.get("headimgurl"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return auth;
    }
}
