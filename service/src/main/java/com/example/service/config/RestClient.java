package com.example.service.config;

import com.alibaba.fastjson.JSONObject;
import com.example.util.chinapay.SecssUtil;
import com.example.util.common.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * rest请求工具类
 *
 * @author Wei.Guang
 * @create 2018-06-08 11:10
 **/
@Component
@Slf4j
public class RestClient {

    /**
     * restTemplate对象
     */
    @Resource
    private RestTemplate restTemplate;

    /**
     * get
     * @param url 请求地址
     * @param param  参数
     * @param returnClass 返回类型
     * @return
     */
    public <T> T get(String url, Class<T> returnClass, Map<String, ?> param) {
        return restTemplate.getForObject(url, returnClass, param);
    }

    /**
     * get
     * @param url 请求地址
     * @return JSONObject
     */
    public JSONObject get(String url) {
        return restTemplate.getForEntity(url, JSONObject.class).getBody();
    }

    /**
     * post
     * @param url 请求地址
     * @param param 参数
     * @param returnClass 返回类型
     * @param header 自定义的头信息
     * @return
     */
    public <E> E post(String url, E param, Class<E> returnClass, Map<String, String> header) {
        HttpHeaders headers = new HttpHeaders();
        header.forEach((o1, o2) -> headers.set(o1, o2));
        HttpEntity<E> httpEntity = new HttpEntity<E>(param, headers);
        return restTemplate.postForObject(url, httpEntity, returnClass);
    }

    /**
     * post
     * @param url 请求地址
     * @param param 参数
     * @param returnClass 返回类型
     * @return
     */
    public <E> E postByDefault(String url, E param, Class<E> returnClass) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Accept", "application/json");
        HttpEntity<E> httpEntity = new HttpEntity<E>(param, headers);
        return restTemplate.postForObject(url, httpEntity, returnClass);
    }

    /**
     * 诺诺发票请求发送方法
     * @param url
     * @param param
     * @param returnClass
     * @param <T>
     * @return
     */
    public <T> T postBuNuoN(String url, String param, Class<T> returnClass) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
        map.add("order", param);
        HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(map, headers);
        ResponseEntity<T> response = restTemplate.exchange(url, HttpMethod.POST, httpEntity, returnClass);
        return response.getBody();
    }

    /**
     * chinapay请求发送方法
     * @param url
     * @param reqData
     * @param encoding
     * @return
     */
    public Map<String, String> postChinaPay(Map<String, String> reqData, String url, String encoding, boolean isUrlEncoder) {
        Map<String, String> rspData = new HashMap<>();
        log.info("请求ChinaPay地址:" + url + ", 参数:" + JSONObject.toJSONString(reqData));
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        String sendData = getRequestParamString(reqData, encoding);
        HttpEntity<String> httpEntity = new HttpEntity<>(sendData, headers);
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, httpEntity, String.class);
        try {
            int status = response.getStatusCodeValue();
            if (200 == status) {
                String resultString = isUrlEncoder ? URLDecoder.decode(response.getBody(), "UTF-8") : response.getBody();
                if (StringUtil.isNotBlank(resultString)) {
                    // 将返回结果转换为map
                    Map<String, String> tmpRspData = SecssUtil.convertResultStringToMap(resultString);
                    rspData.putAll(tmpRspData);
                }
            } else {
                log.info("返回http状态码[" + status + "]，请检查请求报文或者请求地址是否正确");
            }
        } catch (UnsupportedEncodingException e) {
            log.error("ChinaPay Request Failure: {}", ExceptionUtils.getStackTrace(e));
        }
        return rspData;
    }

    /**
     * 将Map存储的对象，转换为key=value&key=value的字符
     *
     * @param requestParam
     * @param coder
     * @return
     */
    private String getRequestParamString(Map<String, String> requestParam, String coder) {
        if (null == coder || "".equals(coder)) {
            coder = "UTF-8";
        }
        StringBuffer sf = new StringBuffer();
        String reqstr = "";
        if (null != requestParam && 0 != requestParam.size()) {
            for (Map.Entry<String, String> en : requestParam.entrySet()) {
                try {
                    sf.append(en.getKey() + "=" + (null == en.getValue() || "".equals(en.getValue()) ? ""
                            : URLEncoder.encode(en.getValue(), coder)) + "&");
                } catch (UnsupportedEncodingException e) {
                    log.error(e.getMessage(), e);
                    return "";
                }
            }
            reqstr = sf.substring(0, sf.length() - 1);
        }
        log.info("Request Message:[" + reqstr + "]");
        return reqstr;
    }
}