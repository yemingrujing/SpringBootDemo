package com.example.util.chinapay;

import cn.hutool.core.io.resource.ClassPathResource;
import com.example.util.common.StringUtil;
import com.example.util.constant.SDKConstants;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.util.Properties;

/**
 * 基础信息配置类
 *
 * @author Wei.Guang
 * @create 2018-09-15 9:52
 **/
@Slf4j
public class SDKConfig {

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
        super();
    }

    /**
     * 获取config对象.
     *
     * @return
     */
    public static SDKConfig getConfig() {
        return config;
    }

    /**
     * 从properties文件加载
     *
     * @param rootPath 不包含文件名的目录.
     */
    public void loadPropertiesFromPath(String rootPath) {
        if (StringUtils.isNotBlank(rootPath)) {
            log.info("从路径读取配置文件: " + rootPath + File.separator + SecssConfig.FILE_NAME);
            File file = new File(rootPath + File.separator + SecssConfig.FILE_NAME);
            InputStream in = null;
            if (file.exists()) {
                try {
                    in = new FileInputStream(file);
                    properties = new Properties();
                    properties.load(in);
                    loadProperties(properties);
                } catch (FileNotFoundException e) {
                    log.error(e.getMessage(), e);
                } catch (IOException e) {
                    log.error(e.getMessage(), e);
                } finally {
                    if (null != in) {
                        try {
                            in.close();
                        } catch (IOException e) {
                            log.error(e.getMessage(), e);
                        }
                    }
                }
            } else {
                // 由于此时可能还没有完成LOG的加载，因此采用标准输出来打印日志信息
                log.error(rootPath + SecssConfig.FILE_NAME + "不存在,加载参数失败");
            }
        } else {
            loadPropertiesFromSrc();
        }
    }

    /**
     * 从classpath路径下加载配置参数
     */
    public void loadPropertiesFromSrc() {
        InputStream in = null;
        try {
            log.info("从classpath: " + SDKConfig.class.getClassLoader().getResource("").getPath() + " 获取属性文件：" + SecssConfig.FILE_NAME);
            //in = SDKConfig.class.getClassLoader().getResourceAsStream(FILE_NAME);
            in = new ClassPathResource(SecssConfig.FILE_NAME).getStream();
            if (null != in) {
                properties = new Properties();
                try {
                    properties.load(in);
                } catch (IOException e) {
                    throw e;
                }
            } else {
                log.error(SecssConfig.FILE_NAME + "属性文件未能在classpath指定的目录下 " + SDKConfig.class.getClassLoader().getResource("").getPath() + " 找到!");
                return;
            }
            loadProperties(properties);
        } catch (IOException e) {
            log.error(e.getMessage(), e);
        } finally {
            if (null != in) {
                try {
                    in.close();
                } catch (IOException e) {
                    log.error(e.getMessage(), e);
                }
            }
        }
    }

    /**
     * 根据传入的 {@link #load(Properties)}对象设置配置参数
     *
     * @param pro
     */
    public void loadProperties(Properties pro) {
        log.info("开始从属性文件中加载配置项");
        String value = null;

        value = pro.getProperty(SecssConstants.SDK_FRONT_URL);
        if (StringUtil.isNotBlank(value)) {
            this.frontRequestUrl = value.trim();
        }
        value = pro.getProperty(SecssConstants.SDK_BACK_URL);
        if (StringUtil.isNotBlank(value)) {
            this.backRequestUrl = value.trim();
        }
        value = pro.getProperty(SecssConstants.SDK_REFUND_URL);
        if (StringUtil.isNotBlank(value)) {
            this.refundTransUrl = value.trim();
        }
        value = pro.getProperty(SecssConstants.MERID);
        if (StringUtil.isNotBlank(value)) {
            this.merId = value.trim();
        }
        value = pro.getProperty(SecssConstants.VERSION);
        if (StringUtil.isNotBlank(value)) {
            this.version = value.trim();
        }
        value = pro.getProperty(SecssConstants.SIGNCALLBACK);
        if (StringUtil.isNotBlank(value)) {
            this.signBackUrl = value.trim();
        }
        value = pro.getProperty(SecssConstants.PAYCALLBACK);
        if (StringUtil.isNotBlank(value)) {
            this.payBackUrl = value.trim();
        }
        value = pro.getProperty(SecssConstants.REFUNDBACKURL);
        if (StringUtil.isNotBlank(value)) {
            this.refundBackUrl = value.trim();
        }
        value = pro.getProperty(SDK_IF_VALIDATE_REMOTE_CERT);
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
