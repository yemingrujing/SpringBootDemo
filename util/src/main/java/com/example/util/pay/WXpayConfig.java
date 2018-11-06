package com.example.util.pay;

import com.example.util.common.LoadProperties;
import com.example.util.common.StringUtil;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

import java.util.Properties;

/**
 * ALIPAY参数配置
 *
 * @author Wei.Guang
 * @create 2018-11-02 9:45
 **/
@Getter
@Slf4j
public class WXpayConfig extends LoadProperties {

    /**
     * 属性文件位置
     */
    public final static String FILE_NAME = "properties/wxpay.properties";

    private String apiKey;

    private String appId;

    private String mchId;

    private String notifyUrl;

    /**
     * 预支付请求地址
     */
    private String prepayUrl;

    /**
     * 支付订单查询
     */
    private String orderPayQuery;

    /**
     * 申请退款
     */
    private String orderRefund;

    /**
     * 申请退款_查询
     */
    private String orderRefundQuery;

    /**
     * 操作对象
     */
    private static WXpayConfig config = new WXpayConfig();

    private WXpayConfig() {
        this.setFileName(FILE_NAME);
    }

    /**
     * 获取config对象.
     * @return
     */
    public static WXpayConfig getConfig() {
        return config;
    }

    @Override
    public void loadProperties(Properties pro) {
        log.info("开始从属性文件中加载配置项");
        String value;

        value = pro.getProperty(WXpayConstants.APIKEY);
        log.info(WXpayConstants.APIKEY + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.apiKey = value.trim();
        }

        value = pro.getProperty(WXpayConstants.APPID);
        log.info(WXpayConstants.APPID + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.appId = value.trim();
        }

        value = pro.getProperty(WXpayConstants.MCHID);
        log.info(WXpayConstants.MCHID + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.mchId = value.trim();
        }

        value = pro.getProperty(WXpayConstants.NOTIFYURL);
        log.info(WXpayConstants.NOTIFYURL + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.notifyUrl = value.trim();
        }

        value = pro.getProperty(WXpayConstants.PREPAYURL);
        log.info(WXpayConstants.PREPAYURL + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.prepayUrl = value.trim();
        }

        value = pro.getProperty(WXpayConstants.ORDERPAYQUERY);
        log.info(WXpayConstants.ORDERPAYQUERY + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.orderPayQuery = value.trim();
        }

        value = pro.getProperty(WXpayConstants.ORDERREFUND);
        log.info(WXpayConstants.ORDERREFUND + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.orderRefund = value.trim();
        }

        value = pro.getProperty(WXpayConstants.ORDERREFUNDQUERY);
        log.info(WXpayConstants.ORDERREFUNDQUERY + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.orderRefundQuery = value.trim();
        }
    }
}
