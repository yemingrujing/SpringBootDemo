package com.example.util.common.invoice.nuonuo;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.util.common.invoice.InvoiceConfig;
import com.example.util.common.invoice.SecurityUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.exception.ExceptionUtils;

/**
 * 发票接口枚举
 *
 * @author Wei.Guang
 * @create 2018-11-28 9:37
 **/
@Slf4j
public enum InvoiceMethodEnum implements BaseMethod {

    fpkj{
        @Override
        public <InvoiceParam> JSONObject paramsContentTemplate(InvoiceParam invoiceParam) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("order", invoiceParam);
            return jsonObject;
        }
    }, fpjgcx{
        @Override
        public <List> JSONObject paramsContentTemplate(List fpqqlshs) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("fpqqlsh", fpqqlshs);
            return jsonObject;
        }
    }, kpcx{
        @Override
        public <List> JSONObject paramsContentTemplate(List orderno) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("orderno", orderno);
            return jsonObject;
        }
    }, fpzf{
        @Override
        public <InvoiceInvalidParam> JSONObject paramsContentTemplate(InvoiceInvalidParam invoiceInvalidParam) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("order", invoiceInvalidParam);
            return jsonObject;
        }
    };

    public static <T> String getContentTemplate(InvoiceMethodEnum invoiceMethodEnum, T t) {
        try {
            JSONObject jsonObject = invoiceMethodEnum.paramsContentTemplate(t);
            jsonObject.put("identity", "93363DCC6064869708F1F3C72A0CE72A713A9D425CD50CDE");
            System.out.println(JSON.toJSONString(jsonObject));
            return SecurityUtil.AESEncrypt(InvoiceConfig.getConfig().getKeyData(), JSON.toJSONString(jsonObject));
        } catch (Exception e) {
            log.error("Parameter install failure: {}", ExceptionUtils.getStackTrace(e));
        }
        return null;
    }
}
