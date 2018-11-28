package com.example.util.common.invoice.nuonuo;

import com.alibaba.fastjson.JSONObject;

/**
 * 基础方法接口
 *
 * @author Wei.Guang
 * @create 2018-11-28 9:38
 **/
public interface BaseMethod {

    /**
     * 基础方法参数模板
     * @param t
     * @param <T>
     * @return
     */
    public <T> JSONObject paramsContentTemplate(T t);
}
