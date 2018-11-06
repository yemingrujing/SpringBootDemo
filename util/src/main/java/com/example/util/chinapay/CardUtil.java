package com.example.util.chinapay;

import cn.hutool.core.io.resource.ClassPathResource;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 银行卡工具类
 *
 * @author Wei.Guang
 * @create 2018-08-06 16:19
 **/
@Slf4j
public class CardUtil {

    private CardUtil(){}

    /**
     * 银行卡号校验URL
     */
    public static String validateURL = "https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=CARDNO&cardBinCheck=true";

    /**
     * 银行名称集合
     */
    public static String bankNames;

    static {
        try {
            bankNames = readCards();
            log.info(bankNames);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 读取json文件
     * @return
     * @throws IOException
     */
    public static String readCards() throws IOException {
        BufferedReader br = new BufferedReader(
                new InputStreamReader(
                        new ClassPathResource("properties/bankMap.json").getStream()));
        String result = "";
        String line;
        while ((line = br.readLine()) != null) {
            result += line;
        }
        br.close();
        return result;
    }

    /**
     * 根据支付宝获取银行卡所属银行
     * @param cardNo
     * @return
     */
    public static String getBankMark(String cardNo) {
        String retStr = HttpUtil.get(validateURL.replace("CARDNO", cardNo), CharsetUtil.CHARSET_UTF_8);
        JSONObject json = JSONUtil.parseObj(retStr);
        if ((boolean) json.get("validated")) {
            return (String) json.get("bank");
        }
        return null;
    }

    public static void main(String[] args){
        System.out.println(getBankMark("6217001210024455220"));
    }
}
