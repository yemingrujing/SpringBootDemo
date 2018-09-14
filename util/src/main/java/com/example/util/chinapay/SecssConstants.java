package com.example.util.chinapay;

import java.util.HashMap;

public class SecssConstants
{
  public static String KEY_VALUE_CONNECT = "=";
  public static String MESSAGE_CONNECT = "&";
  public static String SIGN1_ALGNAME = "SHA1WithRSA";
  public static String SIGN512_ALGNAME = "SHA512WithRSA";
  public static String SIGN512 = "SHA-512";
  public static String ENC_ALG_PREFIX = "RSA";
  public static String DEFAULT_PROVIDER = "BC";
  public static String CHARSET_COMM = "UTF-8";
  public static String SIGN_FILE = "sign.file";
  public static String SIGN_FILE_ALIAS = "sign.file.alias";
  public static String SIGN_FILE_PW = "sign.file.password";
  public static String VERIFY_FILE = "verify.file";
  public static String SIGN_CERT_TYPE = "sign.cert.type";
  public static String SIGNATURE_FIELD = "signature.field";
  public static String SIGN_INVALID_FIELDS = "sign.invalid.fields";
  public static String RETURN_LINE = "\r\n";
  public static String SUCCESS = "00";
  public static String LOAD_CONFIG_ERROR = "01";
  public static String SIGN_CERT_ERROR = "02";
  public static String SIGN_CERT_PWD_ERROR = "03";
  public static String SIGN_CERT_TYPE_ERROR = "04";
  public static String INIT_SIGN_CERT_ERROR = "05";
  public static String VERIFY_CERT_ERROR = "06";
  public static String INIT_VERIFY_CERT_ERROR = "07";
  public static String GET_PRI_KEY_ERROR = "08";
  public static String GET_CERT_ID_ERROR = "09";
  public static String GET_SIGN_STRING_ERROR = "10";
  public static String SIGN_GOES_WRONG = "11";
  public static String VERIFY_GOES_WRONG = "12";
  public static String VERIFY_FAILED = "13";
  public static String SIGN_FIELD_NULL = "14";
  public static String SIGN_VALUE_NULL = "15";
  public static String UNKNOWN_WRONG = "16";
  public static String ENCPIN_GOES_WRONG = "17";
  public static String ENCDATA_GOES_WRONG = "18";
  public static String DECDATA_GOES_WRONG = "19";
  public static String DEFAULTINIT_GOES_WRONG = "20";
  public static String SPECIFYINIT_GOES_WRONG = "21";
  public static String RELOADSC_GOES_WRONG = "22";
  public static String NO_INIT = "23";
  public static String CONFIG_WRONG = "24";
  public static String INIT_CONFIG_WRONG = "25";
  public static final HashMap ERRMAP = new HashMap();
  
  static
  {
    ERRMAP.put(SUCCESS, "操作成功");
    
    ERRMAP.put(LOAD_CONFIG_ERROR, 
      "加载security.properties配置文件出错，请检查文件路径！");
    
    ERRMAP.put(SIGN_CERT_ERROR, "签名文件路径配置错误！");
    
    ERRMAP.put(SIGN_CERT_PWD_ERROR, "签名文件访问密码配置错误！");
    
    ERRMAP.put(SIGN_CERT_TYPE_ERROR, "签名文件密钥容器类型配置错误，需为PKCS12！");
    
    ERRMAP.put(INIT_SIGN_CERT_ERROR, "初始化签名文件出错！");
    
    ERRMAP.put(VERIFY_CERT_ERROR, "验签证书路径配置错误！");
    
    ERRMAP.put(INIT_VERIFY_CERT_ERROR, "初始化验签证书出错！");
    
    ERRMAP.put(GET_PRI_KEY_ERROR, "获取签名私钥出错！");
    
    ERRMAP.put(GET_CERT_ID_ERROR, "获取签名证书ID出错！");
    
    ERRMAP.put(GET_SIGN_STRING_ERROR, "获取签名字符串出错！");
    
    ERRMAP.put(SIGN_GOES_WRONG, "签名过程发生错误！");
    
    ERRMAP.put(VERIFY_GOES_WRONG, "验签过程发生错误！");
    
    ERRMAP.put(VERIFY_FAILED, "验签失败！");
    
    ERRMAP.put(SIGN_FIELD_NULL, "配置文件中签名字段名称为空！");
    
    ERRMAP.put(SIGN_VALUE_NULL, "报文中签名为空！");
    
    ERRMAP.put(UNKNOWN_WRONG, "未知错误！");
    
    ERRMAP.put(ENCPIN_GOES_WRONG, "Pin加密过程发生错误！");
    
    ERRMAP.put(ENCDATA_GOES_WRONG, "数据加密过程发生错误！");
    
    ERRMAP.put(DECDATA_GOES_WRONG, "数据解密过程发生错误！");
    
    ERRMAP.put(DEFAULTINIT_GOES_WRONG, "从默认配置文件初始化安全控件发生错误！");
    
    ERRMAP.put(SPECIFYINIT_GOES_WRONG, "从指定属性集初始化安全控件发生错误！");
    
    ERRMAP.put(RELOADSC_GOES_WRONG, "重新加载签名证书发生错误！");
    
    ERRMAP.put(NO_INIT, "未初化安全控件！");
    
    ERRMAP.put(CONFIG_WRONG, "控件初始化信息未正确配置，请检查！");
    
    ERRMAP.put(INIT_CONFIG_WRONG, "初始化配置信息发生错误！");
  }
}
