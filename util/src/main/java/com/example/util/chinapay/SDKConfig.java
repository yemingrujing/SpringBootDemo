package com.example.util.chinapay;

import com.example.util.common.LoadProperties;
import com.example.util.common.StringUtil;
import com.example.util.constant.SDKConstants;
import lombok.extern.slf4j.Slf4j;

import java.util.Properties;

/**
 * 基础信息配置类
 *
 * @author Wei.Guang
 * @create 2018-09-15 9:52
 **/
@Slf4j
public class SDKConfig extends LoadProperties {

    /**
     * 商户号
     */
    private String merId;

    /**
     * 版本号
     */
    private String version;

    /**
     * 前台请求URL
     */
    private String frontRequestUrl;

    /**
     * 后台请求URL
     */
    private String backRequestUrl;

    /**
     * 后续类交易退款请求RUL
     */
    private String refundTransUrl;

    /**
     * 签约后台通知地址
     */
    private String signBackUrl;

    /**
     * 支付后台通知地址
     */
    private String payBackUrl;

    /**
     * 退款后台通知地址
     */
    private String refundBackUrl;

    /**
     * 属性文件对象
     */
    private Properties properties;

    /**
     * 是否验证https证书，默认都不验
     */
    private boolean ifValidateRemoteCert = false;

    /**
     * 配置是否需要验证https证书，除了true之外的值都当false处理
     */
    public static final String SDK_IF_VALIDATE_REMOTE_CERT = "acpsdk.ifValidateRemoteCert";



    /**
     * 操作对象
     */
    private static SDKConfig config = new SDKConfig();
    private SDKConfig() {
        this.setFileName(SecssConfig.FILE_NAME);
    }

    /**
     * 获取config对象.
     * @return
     */
    public static SDKConfig getConfig() {
        return config;
    }

    /**
     * 根据传入的 {@link #load(Properties)}对象设置配置参数
     *
     * @param pro
     */
    @Override
    public void loadProperties(Properties pro) {
        log.info("开始从属性文件中加载配置项");
        String value = null;

        value = pro.getProperty(SecssConstants.SDK_FRONT_URL);
        log.info(SecssConstants.SDK_FRONT_URL + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.frontRequestUrl = value.trim();
        }

        value = pro.getProperty(SecssConstants.SDK_BACK_URL);
        log.info(SecssConstants.SDK_BACK_URL + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.backRequestUrl = value.trim();
        }
        value = pro.getProperty(SecssConstants.SDK_REFUND_URL);
        log.info(SecssConstants.SDK_REFUND_URL + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.refundTransUrl = value.trim();
        }

        value = pro.getProperty(SecssConstants.MERID);
        log.info(SecssConstants.MERID + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.merId = value.trim();
        }

        value = pro.getProperty(SecssConstants.VERSION);
        log.info(SecssConstants.VERSION + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.version = value.trim();
        }

        value = pro.getProperty(SecssConstants.SIGNCALLBACK);
        log.info(SecssConstants.SIGNCALLBACK + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.signBackUrl = value.trim();
        }

        value = pro.getProperty(SecssConstants.PAYCALLBACK);
        log.info(SecssConstants.PAYCALLBACK + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.payBackUrl = value.trim();
        }

        value = pro.getProperty(SecssConstants.REFUNDBACKURL);
        log.info(SecssConstants.REFUNDBACKURL + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.refundBackUrl = value.trim();
        }

        value = pro.getProperty(SDK_IF_VALIDATE_REMOTE_CERT);
        log.info(SDK_IF_VALIDATE_REMOTE_CERT + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            if (SDKConstants.TRUE_STRING.equals(value.trim())) {
                this.ifValidateRemoteCert = true;
            }
        }

    }


    public String getMerId() {
        return merId;
    }

    public String getFrontRequestUrl() {
        return frontRequestUrl;
    }

    public String getBackRequestUrl() {
        return backRequestUrl;
    }

    public String getVersion() {
        return version;
    }

    public String getSignBackUrl() {
        return signBackUrl;
    }

    public String getPayBackUrl() {
        return payBackUrl;
    }

    public String getRefundTransUrl() {
        return refundTransUrl;
    }

    public String getRefundBackUrl() {
        return refundBackUrl;
    }

    public boolean isIfValidateRemoteCert() {
        return ifValidateRemoteCert;
    }
}
