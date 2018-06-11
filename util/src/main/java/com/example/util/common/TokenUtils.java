package com.example.util.common;

import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import net.minidev.json.JSONObject;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.HashMap;
import java.util.Map;

/**
 * Token生成工具
 *
 * @author Wei.Guang
 * @create 2018-06-11 17:09
 **/
public class TokenUtils {

    private TokenUtils(){}
    /**
     * 创建一个32-byte的密匙
     */
    private static final byte[] secret = "geiwodiangasfdjsikolkjikolkijswe".getBytes();

    /**
     * 生成一个token
     * @param payLoad
     * @return
     * @throws JOSEException
     */
    public static String creatToken(Map<String, Object> payLoad) throws JOSEException {
        //先建立一个头部Header
        JWSHeader jwsHeader = new JWSHeader(JWSAlgorithm.HS256);
        //建立一个载荷Payload
        Payload payload = new Payload(new JSONObject(payLoad));
        //将头部和载荷结合在一起
        JWSObject jwsObject = new JWSObject(jwsHeader, payload);
        //建立一个密匙
        JWSSigner jwsSigner = new MACSigner(secret);
        //签名
        jwsObject.sign(jwsSigner);
        //生成token
        return jwsObject.serialize();
    }

    public static Map<String, Object> valid(String token) throws ParseException, JOSEException {
        //解析token
        JWSObject jwsObject = JWSObject.parse(token);
        //获取到载荷
        Payload payload = jwsObject.getPayload();
        //建立一个解锁密匙
        JWSVerifier jwsVerifier = new MACVerifier(secret);

        Map<String, Object> resultMap = new HashMap<String, Object>();
        //判断token
        if (jwsObject.verify(jwsVerifier)) {
            resultMap.put("Result", 0);
            //载荷的数据解析成json对象
            JSONObject jsonObject = payload.toJSONObject();
            resultMap.put("data", jsonObject);

            //判断token是否过期
            if (jsonObject.containsKey("exp")){
                Long expTime = Long.valueOf(jsonObject.get("exp").toString());
                Long nowTime = System.currentTimeMillis();

                //判断是否过期
                if (nowTime > expTime) {
                    //已经过期
                    resultMap.clear();
                    resultMap.put("Result", 2);
                }

            }
        } else {
            resultMap.put("Result", 1);
        }
        return resultMap;
    }

    public static void main(String[] args){

        //获取生成token
        Map<String, Object> map = new HashMap<>();
        String uid = "kkksuejrmf";
        long expireTime = LocalDateTime.now().plusYears(3).toInstant(ZoneOffset.of("+8")).toEpochMilli();
        //建立载荷，这些数据根据业务，自己定义。
        map.put("uid", uid);
        //生成时间
        map.put("sta", System.currentTimeMillis());
        //过期时间
        map.put("exp", expireTime);

        String token = null;
        try {
            token = TokenUtils.creatToken(map);
            System.out.println("token=" + token);

            if (token != null) {

                Map<String, Object> validMap = TokenUtils.valid(token);
                int i = (int) validMap.get("Result");
                if (i == 0) {
                    System.out.println("token解析成功");
                    JSONObject jsonObject = (JSONObject) validMap.get("data");
                    System.out.println("uid是" + jsonObject.get("uid"));
                    System.out.println("sta是" + jsonObject.get("sta"));
                    System.out.println("exp是" + jsonObject.get("exp"));
                } else if (i == 2) {
                    System.out.println("token已经过期");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
