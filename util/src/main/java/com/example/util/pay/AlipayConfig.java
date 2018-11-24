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
public class AlipayConfig extends LoadProperties {

    /**
     * 属性文件位置
     */
    public final static String FILE_NAME = "properties/alipay.properties";

    /**
     * 支付宝支付业务：入参app_id
     */
    private String appId;

    /**
     * 支付宝网关
     */
    private String gate;

    /**
     * 应用私钥
     */
    private String privateKey;
    /**
     * 支付宝公钥
     */
    private String publicKey;

    /**
     * 编码方式
     */
    private String charSet;

    /**
     * 返回格式
     */
    private String format;

    /**
     * 支付异步回调地址
     */
    private String payNotifyUrl;

    /**
     * 旁听支付异步回调地址
     */
    private String signPayNotifyUrl;

    /**
     * 支付退款异步回调地址
     */
    private String refundNotifyUrl;

    /**
     * 支付同步回调地址
     */
    private String returnUrl;

    /**
     * 签名方式
     */
    private String signType;

    /**
     * 当前调用接口名称
     */
    private String appMethod;

    /**
     * 当前调用接口名称
     */
    private String wapMethod;

    /**
     * 版本
     */
    private String varsion;

    /**
     * 操作对象
     */
    private static AlipayConfig config = new AlipayConfig();

    private AlipayConfig() {
        this.setFileName(FILE_NAME);
    }

    /**
     * 获取config对象.
     * @return
     */
    public static AlipayConfig getConfig() {
        return config;
    }

    @Override
    public void loadProperties(Properties pro) {
        log.info("AliPay：开始从属性文件中加载配置项");
        String value;

        value = pro.getProperty(AlipayConstants.APPID);
        log.info(AlipayConstants.APPID + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.appId = value.trim();
        }

        value = pro.getProperty(AlipayConstants.GATE);
        log.info(AlipayConstants.GATE + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.gate = value.trim();
        }

        value = pro.getProperty(AlipayConstants.ALIPAY_PRIVATE_KEY);
        log.info(AlipayConstants.ALIPAY_PRIVATE_KEY + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.privateKey = value.trim();
        }

        value = pro.getProperty(AlipayConstants.ALIPAY_PUBLIC_KEY);
        log.info(AlipayConstants.ALIPAY_PUBLIC_KEY + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.publicKey = value.trim();
        }

        value = pro.getProperty(AlipayConstants.CHARSET);
        log.info(AlipayConstants.CHARSET + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.charSet = value.trim();
        }

        value = pro.getProperty(AlipayConstants.FORMAT);
        log.info(AlipayConstants.FORMAT + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.format = value.trim();
        }

        value = pro.getProperty(AlipayConstants.PAY_NOTIFY_URL);
        log.info(AlipayConstants.PAY_NOTIFY_URL + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.payNotifyUrl = value.trim();
        }

        value = pro.getProperty(AlipayConstants.SIGN_PAY_NOTIFY_URL);
        log.info(AlipayConstants.SIGN_PAY_NOTIFY_URL + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.signPayNotifyUrl = value.trim();
        }

        value = pro.getProperty(AlipayConstants.REFUND_NOTIFY_URL);
        log.info(AlipayConstants.REFUND_NOTIFY_URL + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.refundNotifyUrl = value.trim();
        }

        value = pro.getProperty(AlipayConstants.RETURN_UTL);
        log.info(AlipayConstants.RETURN_UTL + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.returnUrl = value.trim();
        }

        value = pro.getProperty(AlipayConstants.SIGN_TYPE);
        log.info(AlipayConstants.SIGN_TYPE + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.signType = value.trim();
        }

        value = pro.getProperty(AlipayConstants.APP_METHOD);
        log.info(AlipayConstants.APP_METHOD + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.appMethod = value.trim();
        }

        value = pro.getProperty(AlipayConstants.WAP_METHOD);
        log.info(AlipayConstants.WAP_METHOD + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.wapMethod = value.trim();
        }

        value = pro.getProperty(AlipayConstants.VERSION);
        log.info(AlipayConstants.VERSION + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.varsion = value.trim();
        }
    }
}
