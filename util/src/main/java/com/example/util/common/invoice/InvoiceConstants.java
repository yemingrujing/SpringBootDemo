package com.example.util.common.invoice;

/**
 * 发票公共参数
 * @author Wei.Guang
 * @create 2018-11-24 11:15
 **/
public class InvoiceConstants {

    /**
     * 终端类型标识(0:B/S 请求来源;1:C/S 请求来源
     */
    public static String TERMINALCODE = "terminalcode";

    /**
     * DZFP 表示普通发票。ZZS_PT_DZFP 表示增值税普通电子发票
     */
    public static String APPID = "appid";

    /**
     * API 版本,当前 1.0
     */
    public static String VERSION = "version";

    /**
     * 平台编码, 事先取得从管理端（请求前）test 111MFWIK;  药师 P0000391
     */
    public static String USERNAME = "username";

    /**
     * 事先取得从管理端（请求前）
     */
    public static String PASSWORD = "password";

    /**
     * 数据交换流水号
     */
    public static String SERIALNUM = "serialnum";

    /**
     * 数据交换请求发起方代码 ,用平台编码
     */
    public static String REQUESTCODE = "requestcode";

    /**
     * 纳税人识别号 test 310101000000090
     */
    public static String TAXPAYERID = "taxpayerid";

    /**
     * 纳税人授权码, 事先取得从平台系统获取（请求前) test 3100000090  ；药师 	70MP0I49BH
     */
    public static String AUTHORIZATIONCODE = "authorizationcode";

    /**
     * 数据交换请求接受方代码
     */
    public static String RESPONSECODE = "responsecode";

    /**
     * 压缩标识 0 不压缩 1 压缩
     */
    public static String  ZIPCODE = "zipcode";

    /**
     * 加密标识 0:不加密 1: 3DES 加密 2:CA
     */
    public static String ENCRYPTCODE = "encryptcode";

    /**
     * 加密方式
     */
    public static String CODETYPE = "codetype";

    /**
     * 代开标志 自开(0) 代开(1)
     */
    public static String DKBZ = "dkbz";

    /**
     * 开票方识别号
     */
    public static String NSRSBH = "nsrsbh";

    /**
     * 开票方名称
     */
    public static String NSRMC = "nsrmc";

    /**
     * 编码表版本号 12.0 now
     */
    public static String BMB_BBH = "bmbBbh";

    /**
     * 加密字符串(生产用)
     */
    public static String KEYBYTES = "keybytes";

    /**
     * PDF文件下载目录
     */
    public static String PDF_FILE_PATH = "pdfFilePath";
}
