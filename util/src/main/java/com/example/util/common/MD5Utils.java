package com.example.util.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5加密工具(基于hash算法实现，不可逆)
 * MD5(Message Digest Algorithm)加密算法是不对称的加密算法，因为其实不可逆的，实际上其不能算作加密算法，
 * 因为其不可解密。其实现原理是基于Hash算法(简称散列函数)。
 *
 * @author Wei.Guang
 * @create 2018-06-11 14:40
 **/
public class MD5Utils {

    private MD5Utils() {
    }

    /**
     * 16进制的字符数组
     */
    private static final String[] hexDigits = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b",
            "c", "d", "e", "f"};

    /**
     * @param source    需要加密的原字符串
     * @param encoding  指定编码类型
     * @param uppercase 是否转为大写字符串
     * @return
     */
    public static String MD5Encode(String source, String encoding, boolean uppercase) {
        String result = null;
        try {
            result = source;
            //获得MD5摘要对象
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            //使用指定的字节数组更新摘要信息
            messageDigest.update(result.getBytes(encoding));
            //messageDigest.digest()获得16位长度
            result = byteArrayToHexString(messageDigest.digest());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uppercase ? result.toUpperCase() : result;
    }

    /**
     * 转换字节数组为16进制字符出
     *
     * @param bytes 字节数组
     * @return
     */
    private static String byteArrayToHexString(byte[] bytes) {
        StringBuilder stringBuilder = new StringBuilder();
        for (byte tem : bytes) {
            stringBuilder.append(byteToHexString(tem));
        }
        return stringBuilder.toString();
    }

    /**
     * 转换byte到16进制
     *
     * @param b 要转换的byte
     * @return 16进制对应的字符串
     */
    private static String byteToHexString(byte b) {
        int n = b;
        if (n < 0) {
            n = 256 + n;
        }
        int d1 = n / 16;
        int d2 = n % 16;
        return hexDigits[d1] + hexDigits[d2];
    }

    public static String encryption(String userName) {
        String result = userName + System.currentTimeMillis() + StringUtil.generateStr(8);
        String reMd5 = new String();
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(result.getBytes());
            byte[] b = md.digest();

            int i;

            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0) {
                    i += 256;
                }
                if (i < 16) {
                    buf.append("0");
                }
                buf.append(Integer.toHexString(i));
            }

            reMd5 = buf.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return reMd5.toUpperCase();
    }

//    public static void main(String[] args){
//        System.out.println(encryption("haha"));
//    }
}
