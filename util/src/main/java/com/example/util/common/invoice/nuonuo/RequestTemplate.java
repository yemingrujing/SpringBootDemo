package com.example.util.common.invoice.nuonuo;

import com.alibaba.fastjson.JSON;

import java.util.HashMap;
import java.util.Map;

/**
 * 诺诺发票请求模板
 *
 * @author Wei.Guang
 * @create 2018-11-27 18:21
 **/
public class RequestTemplate {

    /**
     * 税号
     */
    public final static String IDENTITY = "339901999999142";

    /**
     * 公共参数
     * @return
     */
    public static Map<String, Object> global() {
        Map<String, Object> map = new HashMap<>();
        map.put("identity", "339901999999142");
        return map;
    }

    /**
     * 开票请求
     * @param params
     * @param invoiceParam
     * @return
     */
    public static String fpkj(Map<String, Object> params, InvoiceParam invoiceParam) {
        params.put("order", invoiceParam);
        return JSON.toJSONString(params);
    }

    /**
     * 开票结果查询
     * @param params
     * @param fpqqlsh
     * @return
     */
    public static String kpjg(Map<String, Object> params, String[] fpqqlsh) {
        params.put("fpqqlsh", fpqqlsh);
        return JSON.toJSONString(params);
    }

    /**
     * 根据订单号查询发票请求流水号
     * @param params
     * @param orderno
     * @return
     */
    public static String kpcx(Map<String, Object> params, String[] orderno) {
        params.put("orderno", orderno);
        return JSON.toJSONString(params);
    }

    /**
     * 发票作废申请
     * @param params
     * @param invalidParam
     * @return
     */
    public static String fpzf(Map<String, Object> params, InvoiceInvalidParam invalidParam) {
        params.put("order", invalidParam);
        return JSON.toJSONString(params);
    }
}
