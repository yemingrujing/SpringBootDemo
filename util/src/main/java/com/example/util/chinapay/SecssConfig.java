package com.example.util.chinapay;

import cn.hutool.core.io.resource.ClassPathResource;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@Slf4j
public class SecssConfig {

    /**
     * 属性文件位置
     */
    public final static String FILE_NAME = "properties/security.properties";
    private String signFile;
    private String signFileAlias;
    private String signFilePwd;
    private String signCertType;
    private String verifyFile;
    private String signFieldName;
    private List invalidFileds;

    public static SecssConfig defaultInit()
            throws SecurityException {
        SecssConfig secssConfig = null;
        Properties pros = loadPropertiesFromSrc();
        if (checkPros(pros)) {
            secssConfig = new SecssConfig();
            secssConfig.loadProperties(pros);
        }
        return secssConfig;
    }

    public static SecssConfig specifyInit(Properties pros)
            throws SecurityException {
        SecssConfig secssConfig = null;
        if (checkPros(pros)) {
            secssConfig = new SecssConfig();
            secssConfig.loadProperties(pros);
        }
        return secssConfig;
    }

    private static Properties loadPropertiesFromSrc()
            throws SecurityException {
        InputStream in = null;
        Properties properties = null;
        try {
            in = new ClassPathResource(FILE_NAME).getStream();
            if (in != null) {
                properties = new Properties();
                try {
                    properties.load(in);
                } catch (IOException e) {
                    throw e;
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (IOException localIOException1) {
                }
            }
            return properties;
        } catch (IOException e) {
            log.error("加载配置文件异常！", e);

            throw new SecurityException(SecssConstants.LOAD_CONFIG_ERROR);
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException localIOException4) {
                }
            }
        }
    }

    public void loadProperties(Properties pro) {
        String value = pro.getProperty(SecssConstants.SIGN_FILE);
        if (!SecssUtil.isEmpty(value)) {
            this.signFile = value.trim();
        }
        value = pro.getProperty(SecssConstants.SIGN_FILE_ALIAS);
        if (!SecssUtil.isEmpty(value)) {
            this.signFileAlias = value.trim();
        }
        value = pro.getProperty(SecssConstants.SIGN_FILE_PW);
        if (!SecssUtil.isEmpty(value)) {
            this.signFilePwd = value.trim();
        }
        value = pro.getProperty(SecssConstants.VERIFY_FILE);
        if (!SecssUtil.isEmpty(value)) {
            this.verifyFile = value.trim();
        }
        value = pro.getProperty(SecssConstants.SIGN_CERT_TYPE);
        if (!SecssUtil.isEmpty(value)) {
            this.signCertType = value.trim();
        }
        value = pro.getProperty(SecssConstants.SIGNATURE_FIELD);
        if (!SecssUtil.isEmpty(value)) {
            this.signFieldName = value.trim();
        }
        value = pro.getProperty(SecssConstants.SIGN_INVALID_FIELDS);
        if (!SecssUtil.isEmpty(value)) {
            String localValue = value.trim();
            String[] values = localValue.split(",");
            if ((values != null) && (values.length > 0)) {
                this.invalidFileds = new ArrayList();
                for (int i = 0; i < values.length; i++) {
                    this.invalidFileds.add(values[i].trim());
                }
            }
        }
    }

    private static boolean checkPros(Properties pro)
            throws SecurityException {
        if (SecssUtil.isEmpty(pro.getProperty(SecssConstants.SIGN_FILE))) {
            throw new SecurityException(SecssConstants.CONFIG_WRONG);
        }
        if (SecssUtil.isEmpty(pro.getProperty(SecssConstants.SIGN_FILE_PW))) {
            throw new SecurityException(SecssConstants.CONFIG_WRONG);
        }
        if (SecssUtil.isEmpty(pro.getProperty(SecssConstants.VERIFY_FILE))) {
            throw new SecurityException(SecssConstants.CONFIG_WRONG);
        }
        if (SecssUtil.isEmpty(pro.getProperty(SecssConstants.SIGN_CERT_TYPE))) {
            throw new SecurityException(SecssConstants.CONFIG_WRONG);
        }
        if (SecssUtil.isEmpty(pro.getProperty(SecssConstants.SIGNATURE_FIELD))) {
            throw new SecurityException(SecssConstants.CONFIG_WRONG);
        }
        return true;
    }

    public String getSignFile() {
        return this.signFile;
    }

    public String getSignFilePwd() {
        return this.signFilePwd;
    }

    public String getVerifyFile() {
        return this.verifyFile;
    }

    public String getSignCertType() {
        return this.signCertType;
    }

    public String getSignFieldName() {
        return this.signFieldName;
    }

    public List getInvalidFileds() {
        return this.invalidFileds;
    }

    public String getSignFileAlias() {
        return this.signFileAlias;
    }
}
