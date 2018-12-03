package com.example.util.common.invoice;

import com.example.util.common.LoadProperties;
import com.example.util.common.StringUtil;
import lombok.extern.slf4j.Slf4j;

import java.util.Properties;

/**
 * 航天信息发票公用参数
 *
 * @author Wei.Guang
 * @create 2018-11-24 11:41
 **/
@Slf4j
public class InvoiceConfig extends LoadProperties {

    /**
     * 属性文件位置
     */
    private final static String FILE_NAME = "properties/invoice.properties";

    /**
     * 操作对象
     */
    private static InvoiceConfig config = new InvoiceConfig();
    private InvoiceConfig() {
        this.setFileName(FILE_NAME);
    }

    /**
     * 终端类型标识(0:B/S 请求来源;1:C/S 请求来源
     */
    private String terminalcode;

    /**
     * DZFP 表示普通发票。ZZS_PT_DZFP 表示增值税普通电子发票
     */
    private String appid;

    /**
     * API 版本,当前 1.0
     */
    private String version;

    /**
     * 平台编码, 事先取得从管理端（请求前）test 111MFWIK;  药师 P0000391
     */
    private String username;

    /**
     * 事先取得从管理端（请求前）
     */
    private String password;

    /**
     * 数据交换流水号
     */
    private String serialnum;

    /**
     * 数据交换请求发起方代码 ,用平台编码
     */
    private String requestcode;

    /**
     * 纳税人识别号 test 310101000000090
     */
    private String taxpayerid;

    /**
     * 纳税人授权码, 事先取得从平台系统获取（请求前) test 3100000090  ；药师 	70MP0I49BH
     */
    private String authorizationcode;

    /**
     * 数据交换请求接受方代码
     */
    private String responsecode;

    /**
     * 压缩标识 0 不压缩 1 压缩
     */
    private String zipcode;

    /**
     * 加密标识 0:不加密 1: 3DES 加密 2:CA
     */
    private String encryptcode;

    /**
     * 加密方式
     */
    private String codetype;

    /**
     * 代开标志 自开(0) 代开(1)
     */
    private String dkbz;

    /**
     * 开票方识别号(自开用)
     */
    private String nsrsbh;

    /**
     * 开票方名称(自开用)
     */
    private String nsrmc;

    /**
     * 编码表版本号 12.0 now
     */
    private String bmbBbh;

    /**
     * 加密字符串(生产用)
     */
    private String keyData;

    /**
     * PDF文件下载目录
     */
    private String pdfFilePath;

    @Override
    public void loadProperties(Properties pro) {
        log.info("航天信息发票：开始从属性文件中加载配置项");
        String value = null;

        value = pro.getProperty(InvoiceConstants.TERMINALCODE);
        log.info(InvoiceConstants.TERMINALCODE + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.terminalcode = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.APPID);
        log.info(InvoiceConstants.APPID + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.appid = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.VERSION);
        log.info(InvoiceConstants.VERSION + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.version = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.USERNAME);
        log.info(InvoiceConstants.USERNAME + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.username = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.PASSWORD);
        log.info(InvoiceConstants.PASSWORD + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.password = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.SERIALNUM);
        log.info(InvoiceConstants.SERIALNUM + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.serialnum = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.REQUESTCODE);
        log.info(InvoiceConstants.REQUESTCODE + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.requestcode = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.TAXPAYERID);
        log.info(InvoiceConstants.TAXPAYERID + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.taxpayerid = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.AUTHORIZATIONCODE);
        log.info(InvoiceConstants.AUTHORIZATIONCODE + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.authorizationcode = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.RESPONSECODE);
        log.info(InvoiceConstants.RESPONSECODE + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.responsecode = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.ZIPCODE);
        log.info(InvoiceConstants.ZIPCODE + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.zipcode = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.ENCRYPTCODE);
        log.info(InvoiceConstants.ENCRYPTCODE + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.encryptcode = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.CODETYPE);
        log.info(InvoiceConstants.CODETYPE + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.codetype = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.DKBZ);
        log.info(InvoiceConstants.DKBZ + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.dkbz = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.NSRSBH);
        log.info(InvoiceConstants.NSRSBH + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.nsrsbh = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.NSRMC);
        log.info(InvoiceConstants.NSRMC + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.nsrmc = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.BMB_BBH);
        log.info(InvoiceConstants.BMB_BBH + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.bmbBbh = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.KEYDATA);
        log.info(InvoiceConstants.KEYDATA + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.keyData = value.trim();
        }

        value = pro.getProperty(InvoiceConstants.PDF_FILE_PATH);
        log.info(InvoiceConstants.PDF_FILE_PATH + ":" + value);
        if (StringUtil.isNotBlank(value)) {
            this.pdfFilePath = value.trim();
        }
    }

    /**
     * 获取config对象.
     * @return
     */
    public static InvoiceConfig getConfig() {
        return config;
    }

    public String getTerminalcode() {
        return terminalcode;
    }

    public String getAppid() {
        return appid;
    }

    public String getVersion() {
        return version;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getSerialnum() {
        return serialnum;
    }

    public String getRequestcode() {
        return requestcode;
    }

    public String getTaxpayerid() {
        return taxpayerid;
    }

    public String getAuthorizationcode() {
        return authorizationcode;
    }

    public String getResponsecode() {
        return responsecode;
    }

    public String getZipcode() {
        return zipcode;
    }

    public String getEncryptcode() {
        return encryptcode;
    }

    public String getCodetype() {
        return codetype;
    }

    public String getDkbz() {
        return dkbz;
    }

    public String getNsrsbh() {
        return nsrsbh;
    }

    public String getNsrmc() {
        return nsrmc;
    }

    public String getBmbBbh() {
        return bmbBbh;
    }

    public String getKeyData() {
        return keyData;
    }

    public String getPdfFilePath() {
        return pdfFilePath;
    }
}
