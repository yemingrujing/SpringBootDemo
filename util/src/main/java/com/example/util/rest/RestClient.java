package com.example.util.rest;

import com.alibaba.fastjson.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.util.Map;

/**
 * rest请求工具类
 *
 * @author Wei.Guang
 * @create 2018-06-08 11:10
 **/
@Component
public class RestClient {

    /**
     * restTemplate对象
     */
    @Resource
    RestTemplate restTemplate;

    /**
     * get
     *
     * @param url         请求地址
     * @param param       参数
     * @param returnClass 返回类型
     * @return
     */
    public <T> T get(String url, Class<T> returnClass, Map<String, ?> param) {
        return restTemplate.getForObject(url, returnClass, param);
    }

    /**
     * get
     *
     * @param url 请求地址
     * @return JSONObject
     */
    public JSONObject get(String url) {
        return restTemplate.getForEntity(url, JSONObject.class).getBody();
    }

    /**
     * post
     *
     * @param url         请求地址
     * @param param       参数
     * @param returnClass 返回类型
     * @param header      自定义的头信息
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
     *
     * @param url         请求地址
     * @param param       参数
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
}
