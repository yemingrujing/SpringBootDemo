package com.example.util.chinapay;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;

import java.io.*;
import java.security.*;
import java.util.*;

@Slf4j
public class SecssUtil
{
  private static final char CHAR_RTN_N = '\n';
  private static final char CHAR_RTN_R = '\r';
  private static final int BUFFER_SIZE = 4096;
  private String sign;
  private String encPin;
  private String encValue;
  private String decValue;
  private String certId;
  private String errCode;
  private String errMsg;
  private boolean initFlag1;
  private boolean initFlag2;
  private long hashLength;
  private CertUtil certUtil;
  private static Map<String, CertUtil> certUtilMap = new HashMap();
  private static String CERTUTILMAP_DEFAULT_KEY = "DEFAULT";
  private boolean ignoreCache;

  public SecssUtil() {
    this(false);
  }

  public SecssUtil(boolean ignoreCertCache) {
    this.initFlag1 = false;
    this.initFlag2 = false;
    this.hashLength = 40960L;
    this.ignoreCache = false;
    this.ignoreCache = ignoreCertCache;
  }

  public synchronized boolean init() {
    if (this.initFlag1) {
      log.info("已经从默认配置文件初始化过安全控件，不再作重复初始化工作.");
      return true;
    } else {
      log.info("开始从默认配置文件初始化安全控件.");

      try {
        this.errCode = SecssConstants.UNKNOWN_WRONG;
        this.loadCertUtil((String) null);
        this.initFlag1 = true;
        this.initFlag2 = false;
        this.errCode = SecssConstants.SUCCESS;
        return true;
      } catch (SecurityException var6) {
        log.error("从默认配置文件初始化安全控件异常", var6);
        this.errCode = var6.getErrCode();
        this.initFlag1 = false;
        return false;
      } catch (Exception var7) {
        log.error("从默认配置文件初始化安全控件异常", var7);
        this.errCode = SecssConstants.DEFAULTINIT_GOES_WRONG;
        this.initFlag1 = false;
      } finally {
        log.info("从默认配置文件初始化安全控件结束.");
      }

      return false;
    }
  }

  public synchronized boolean init(String propPath) {
    log.info("开始指定属性集初始化安全控件.");

    try {
      this.errCode = SecssConstants.UNKNOWN_WRONG;
      this.loadCertUtil(propPath);
      this.initFlag2 = true;
      this.initFlag1 = false;
      this.errCode = SecssConstants.SUCCESS;
      return true;
    } catch (SecurityException var7) {
      log.error("从指定属性集初始化安全控件异常", var7);
      this.errCode = var7.getErrCode();
      this.initFlag2 = false;
      return false;
    } catch (Exception var8) {
      log.error("从指定属性集初始化安全控件异常", var8);
      this.errCode = SecssConstants.SPECIFYINIT_GOES_WRONG;
      this.initFlag2 = false;
    } finally {
      log.info("从指定属性集初始化安全控件结束.");
    }

    return false;
  }

  public synchronized boolean init(Properties props) {
    log.info("开始指定属性集初始化安全控件.");

    try {
      this.errCode = SecssConstants.UNKNOWN_WRONG;
      this.certUtil = CertUtil.init(props);
      this.initFlag2 = true;
      this.initFlag1 = false;
      this.errCode = SecssConstants.SUCCESS;
      return true;
    } catch (SecurityException var7) {
      log.error("从指定属性集初始化安全控件异常", var7);
      this.errCode = var7.getErrCode();
      this.initFlag2 = false;
      return false;
    } catch (Exception var8) {
      log.error("从指定属性集初始化安全控件异常", var8);
      this.errCode = SecssConstants.SPECIFYINIT_GOES_WRONG;
      this.initFlag2 = false;
    } finally {
      log.info("从指定属性集初始化安全控件结束.");
    }

    return false;
  }

  public void clearCert() {
    certUtilMap.clear();
  }

  private void loadCertUtil(String path) throws SecurityException {
    String key = null;
    boolean isPathEmpty = path == null || path.trim().length() == 0;
    if (this.ignoreCache) {
      if (isPathEmpty) {
        this.certUtil = CertUtil.init();
      } else {
        Properties pros = this.loadProp(path);
        this.certUtil = CertUtil.init(pros);
      }
    } else {
      if (isPathEmpty) {
        key = CERTUTILMAP_DEFAULT_KEY;
      } else {
        key = path;
      }

      this.certUtil = (CertUtil) certUtilMap.get(key);
      if (this.certUtil == null) {
        Map var7 = certUtilMap;
        synchronized (certUtilMap) {
          this.certUtil = (CertUtil) certUtilMap.get(key);
          if (this.certUtil == null) {
            if (isPathEmpty) {
              this.certUtil = CertUtil.init();
            } else {
              Properties pros = this.loadProp(path);
              this.certUtil = CertUtil.init(pros);
            }

            certUtilMap.put(key, this.certUtil);
          }
        }
      }
    }

  }

  private Properties loadProp(String propPath) {
    Properties props = new Properties();
    FileInputStream is = null;

    try {
      is = new FileInputStream(propPath);
      props.load(is);
      return props;
    } catch (Exception var13) {
      log.error("加载配置文件失败", var13);
      this.errCode = SecssConstants.SPECIFYINIT_GOES_WRONG;
      this.initFlag2 = false;
    } finally {
      if (is != null) {
        try {
          is.close();
        } catch (IOException var12) {
          ;
        }
      }

    }

    return null;
  }

  public boolean reloadSignCert(String certPath, String pass) {
    if (!this.initFlag1 && !this.initFlag2) {
      log.error("进行重新加载签名证书之前，请先确保已通过默认或指定属性集方式初始化过控件");
      return false;
    } else {
      log.info("开始重新加载签名证书.");
      this.errCode = SecssConstants.UNKNOWN_WRONG;

      try {
        this.certUtil.reloadSignCert(certPath, pass);
        return true;
      } catch (SecurityException var8) {
        log.error("重新加载签名证书异常", var8);
        this.errCode = var8.getErrCode();
      } catch (Exception var9) {
        log.error("重新加载签名证书异常", var9);
        this.errCode = SecssConstants.RELOADSC_GOES_WRONG;
        return false;
      } finally {
        log.info("重新加载签名证书结束.");
      }

      return false;
    }
  }

  public void sign(Map map) {
    this.sign(map, SecssConstants.SIGN512_ALGNAME);
  }

  public void sign(Map map, String signAlg) {
    this.sign(map, signAlg, SecssConstants.SIGN512, this.hashLength);
  }

  protected void sign(Map map, String signAlg, String hashAlg, long hashLength) {
    if (!this.initFlag1 && !this.initFlag2) {
      log.error("进行签名操作之前，请先通过默认或指定属性集方式初始化控件");
      this.errCode = SecssConstants.NO_INIT;
    } else {
      log.info("签名处理开始.");
      this.sign = null;
      this.errCode = SecssConstants.UNKNOWN_WRONG;

      try {
        String dataStr = this.getSignStr(map, this.certUtil.getSecssConfig().getInvalidFileds(), true);
        log.info("报文签名之前的字符串(不含signature域)=[" + dataStr + "]");
        byte[] dataBytes = dataStr.getBytes(SecssConstants.CHARSET_COMM);
        if (hashAlg != null && hashAlg.trim().length() > 0 && (long) dataBytes.length > hashLength) {
          dataBytes = this.hashBytes(hashAlg, dataBytes);
        }

        PrivateKey priKey = this.certUtil.getPriKey();
        if (priKey == null) {
          throw new Exception("获取到的私钥为空");
        }

        byte[] signBytes = SecureUtil.sign(dataBytes, priKey, signAlg);
        this.sign = new String(Base64.encodeBase64(signBytes), SecssConstants.CHARSET_COMM);
        log.info("报文签名之后的字符串=[" + this.sign + "]");
        this.certId = this.certUtil.getSignCertId();
        log.info("签名证书ID=[" + this.certId + "]");
        this.errCode = SecssConstants.SUCCESS;
        return;
      } catch (SecurityException var14) {
        log.error("签名异常", var14);
        this.errCode = var14.getErrCode();
      } catch (Exception var15) {
        log.error("签名异常", var15);
        this.errCode = SecssConstants.SIGN_GOES_WRONG;
        return;
      } finally {
        log.info("签名处理结束.");
      }

    }
  }

  public void signBatch(Map map) {
    this.signBatch(map, SecssConstants.SIGN512_ALGNAME);
  }

  public void signBatch(Map map, String signAlg) {
    this.signBatch(map, signAlg, SecssConstants.SIGN512);
  }

  protected void signBatch(Map map, String signAlg, String hashAlg) {
    if (!this.initFlag1 && !this.initFlag2) {
      log.error("进行签名操作之前，请先通过默认或指定属性集方式初始化控件");
      this.errCode = SecssConstants.NO_INIT;
    } else {
      log.info("批量签名处理开始.");
      this.sign = null;
      this.errCode = SecssConstants.UNKNOWN_WRONG;

      try {
        String dataStr = this.getSignStr(map, this.certUtil.getSecssConfig().getInvalidFileds(), true);
        log.info("报文签名之前的字符串(不含signature域)=[" + dataStr + "]");
        byte[] dataBytes = dataStr.getBytes(SecssConstants.CHARSET_COMM);
        if (hashAlg != null && hashAlg.trim().length() > 0) {
          dataBytes = this.hashBytes(hashAlg, dataBytes);
        }

        PrivateKey priKey = this.certUtil.getPriKey();
        if (priKey == null) {
          throw new Exception("获取到的私钥为空");
        }

        byte[] signBytes = SecureUtil.sign(dataBytes, priKey, signAlg);
        this.sign = new String(Base64.encodeBase64(signBytes), SecssConstants.CHARSET_COMM);
        log.info("报文签名之后的字符串=[" + this.sign + "]");
        this.certId = this.certUtil.getSignCertId();
        log.info("签名证书ID=[" + this.certId + "]");
        this.errCode = SecssConstants.SUCCESS;
        return;
      } catch (SecurityException var12) {
        log.error("签名异常", var12);
        this.errCode = var12.getErrCode();
      } catch (Exception var13) {
        log.error("签名异常", var13);
        this.errCode = SecssConstants.SIGN_GOES_WRONG;
        return;
      } finally {
        log.info("签名处理结束.");
      }

    }
  }

  public void verify(Map map) {
    this.verify(map, SecssConstants.SIGN512_ALGNAME);
  }

  public void verify(Map map, String verifyAlg) {
    this.verify(map, verifyAlg, SecssConstants.SIGN512, this.hashLength);
  }

  protected void verify(Map map, String verifyAlg, String hashAlg, long hashLength) {
    if (!this.initFlag1 && !this.initFlag2) {
      log.error("进行验签操作之前，请先通过默认或指定属性集方式初始化控件");
      this.errCode = SecssConstants.NO_INIT;
    } else {
      log.info("验签处理开始.");
      boolean result = false;
      this.errCode = SecssConstants.UNKNOWN_WRONG;

      try {
        String signFieldName = this.certUtil.getSecssConfig().getSignFieldName();
        if (isEmpty(signFieldName)) {
          this.errCode = SecssConstants.SIGN_FIELD_NULL;
          return;
        }

        String signStr = (String) map.get(signFieldName);
        log.info("签名串=[" + signStr + "]");
        if (!isEmpty(signStr)) {
          List invalidFields = this.certUtil.getSecssConfig().getInvalidFileds();
          String dataStr = this.getSignStr(map, invalidFields, true);
          log.info("原报文字符串(不含signature域)=[" + dataStr + "]");
          byte[] dataBytes = dataStr.getBytes(SecssConstants.CHARSET_COMM);
          if (hashAlg != null && hashAlg.trim().length() > 0 && (long)dataBytes.length > hashLength) {
            dataBytes = this.hashBytes(hashAlg, dataBytes);
          }

          PublicKey pubKey = this.certUtil.getPubKey();
          if (pubKey == null) {
            throw new Exception("获取到的公钥为空");
          }

          byte[] signBytes = Base64.decodeBase64(signStr.getBytes(SecssConstants.CHARSET_COMM));
          result = SecureUtil.verify(dataBytes, signBytes, pubKey, verifyAlg);
          if (result) {
            this.errCode = SecssConstants.SUCCESS;
          } else {
            this.errCode = SecssConstants.VERIFY_FAILED;
          }

          log.info("验签结果=[" + SecssConstants.SUCCESS.equals(this.errCode) + "]");
          return;
        }

        this.errCode = SecssConstants.SIGN_VALUE_NULL;
      } catch (SecurityException var18) {
        log.error("验签异常", var18);
        this.errCode = var18.getErrCode();
        return;
      } catch (Exception var19) {
        log.error("验签异常", var19);
        this.errCode = SecssConstants.VERIFY_GOES_WRONG;
        return;
      } finally {
        log.info("验签处理结束.");
      }

    }
  }

  public void encryptPin(String pin, String card) {
    if (!this.initFlag1 && !this.initFlag2) {
      log.error("进行Pin加密操作之前，请先通过默认或指定属性集方式初始化控件");
      this.errCode = SecssConstants.NO_INIT;
    } else {
      log.info("Pin加密处理开始.");
      this.encPin = null;
      this.errCode = SecssConstants.UNKNOWN_WRONG;

      try {
        byte[] pinBlock = SecureUtil.pin2PinBlockWithCardNO(pin, card);
        if (isEmpty(pinBlock)) {
          throw new Exception("计算得到的PinBlock为空");
        }

        this.encPin = this.encryptDataLocal(pinBlock);
        this.errCode = SecssConstants.SUCCESS;
        log.info("Pin加密结果=[" + this.encPin + "]");
        return;
      } catch (SecurityException var8) {
        log.error("Pin加密异常", var8);
        this.errCode = var8.getErrCode();
      } catch (Exception var9) {
        log.error("Pin加密异常", var9);
        this.errCode = SecssConstants.ENCPIN_GOES_WRONG;
        return;
      } finally {
        log.info("Pin加密处理处理结束.");
      }

    }
  }

  public void encryptData(String data) {
    if (!this.initFlag1 && !this.initFlag2) {
      log.error("进行加密操作之前，请先通过默认或指定属性集方式初始化控件");
      this.errCode = SecssConstants.NO_INIT;
    } else {
      log.info("数据加密处理开始.");
      this.encValue = null;
      this.errCode = SecssConstants.UNKNOWN_WRONG;

      try {
        this.encValue = this.encryptDataLocal(data.getBytes(SecssConstants.CHARSET_COMM));
        this.errCode = SecssConstants.SUCCESS;
        log.info("数据加密结果=[" + this.encValue + "]");
        return;
      } catch (SecurityException var7) {
        log.error("数据加密异常", var7);
        this.errCode = var7.getErrCode();
      } catch (Exception var8) {
        log.error("数据加密异常", var8);
        this.errCode = SecssConstants.ENCDATA_GOES_WRONG;
        return;
      } finally {
        log.info("数据加密处理处理结束.");
      }

    }
  }

  public void decryptData(String data) {
    if (!this.initFlag1 && !this.initFlag2) {
      log.error("进行解密操作之前，请先通过默认或指定属性集方式初始化控件");
      this.errCode = SecssConstants.NO_INIT;
    } else {
      log.info("数据解密处理开始.");
      this.decValue = null;
      this.errCode = SecssConstants.UNKNOWN_WRONG;

      try {
        log.info("解密前数据=[" + data + "]");
        this.decValue = this.decryptDataLocal(Base64.decodeBase64(data));
        this.errCode = SecssConstants.SUCCESS;
        log.info("数据解密结果=[" + this.decValue + "]");
        return;
      } catch (SecurityException var7) {
        log.error("数据解密异常", var7);
        this.errCode = var7.getErrCode();
        return;
      } catch (Exception var8) {
        log.error("数据解密异常", var8);
        this.errCode = SecssConstants.DECDATA_GOES_WRONG;
      } finally {
        log.info("数据解密处理处理结束.");
      }

    }
  }

  public void getSignCertId() {
    if (!this.initFlag1 && !this.initFlag2) {
      log.error("进行签名证书ID获取之前，请先通过默认或指定属性集方式初始化控件");
      this.errCode = SecssConstants.NO_INIT;
    } else {
      log.info("签名证书ID获取开始.");
      this.certId = null;
      this.errCode = SecssConstants.UNKNOWN_WRONG;

      try {
        this.certId = this.certUtil.getSignCertId();
        log.info("签名证书ID=[" + this.certId + "]");
        this.errCode = SecssConstants.SUCCESS;
        return;
      } catch (SecurityException var6) {
        log.error("签名证书ID获取异常", var6);
        this.errCode = var6.getErrCode();
        return;
      } catch (Exception var7) {
        log.error("签名证书ID获取异常", var7);
        this.errCode = SecssConstants.GET_CERT_ID_ERROR;
      } finally {
        log.info("签名证书ID获取结束.");
      }

    }
  }

  private String encryptDataLocal(byte[] dataBytes) throws SecurityException, Exception {
    PublicKey pubKey = this.certUtil.getPubKey();
    if (pubKey == null) {
        throw new Exception("获取到的公钥为空");
    } else {
        byte[] encBytes = SecureUtil.encryptData(dataBytes, pubKey.getEncoded());
        return new String(Base64.encodeBase64(encBytes), SecssConstants.CHARSET_COMM);
    }
  }

  private String decryptDataLocal(byte[] dataBytes) throws SecurityException, Exception {
    PrivateKey priKey = this.certUtil.getPriKey();
    if (priKey == null) {
      throw new Exception("获取到的私钥为空");
    } else {
      byte[] decBytes = SecureUtil.decryptData(dataBytes, priKey.getEncoded());
      return new String(decBytes, SecssConstants.CHARSET_COMM);
    }
  }

  private String getSignStr(Map map, List invalidFields, boolean isSort) throws SecurityException {
    StringBuffer param = null;
    List msgList = null;
    if (map != null && map.size() != 0) {
      try {
        param = new StringBuffer();
        msgList = new ArrayList();
        Iterator it = map.keySet().iterator();

        while(true) {
          String msg;
          do {
            if (!it.hasNext()) {
              if (isSort) {
                Collections.sort(msgList);
              }

              for(int i = 0; i < msgList.size(); ++i) {
                msg = (String)msgList.get(i);
                if (i > 0) {
                  param.append(SecssConstants.MESSAGE_CONNECT);
                }

                param.append(msg);
              }

              return param.toString();
            }

            msg = (String)it.next();
          } while(invalidFields != null && invalidFields.contains(msg));

          String value = (String)map.get(msg);
          msgList.add(msg + SecssConstants.KEY_VALUE_CONNECT + value);
        }
      } catch (Exception var9) {
        log.error("构建签名字符串异常", var9);
        throw new SecurityException(SecssConstants.GET_SIGN_STRING_ERROR);
      }
    } else {
      throw new SecurityException(SecssConstants.GET_SIGN_STRING_ERROR);
    }
  }

  public static String cpEncryptData(String src) throws Exception {
    CPEncryptAndDecrypt ced = new CPEncryptAndDecrypt();
    byte[] resultData = null;

    try {
      resultData = ced.encryptPassword(src.getBytes(SecssConstants.CHARSET_COMM));
    } catch (UnsupportedEncodingException var4) {
      log.error("编码异常", var4);
    } catch (Exception var5) {
      log.error("加密异常", var5);
    }

    if (resultData == null) {
      log.info("加密数据失败");
      return null;
    } else {
      return Base64.encodeBase64String(resultData);
    }
  }

  public static String cpDecryptData(String str) throws Exception {
    CPEncryptAndDecrypt ced = new CPEncryptAndDecrypt();
    byte[] resultData = null;

    try {
      resultData = ced.decryptPassword(Base64.decodeBase64(str));
    } catch (UnsupportedEncodingException var4) {
      log.error("编码异常", var4);
    } catch (Exception var5) {
      log.error("解密异常", var5);
    }

    if (resultData == null) {
      log.info("解密数据失败");
      return null;
    } else {
      return new String(resultData, SecssConstants.CHARSET_COMM);
    }
  }

  public void signFile(String filePath) {
    this.signFile(filePath, SecssConstants.SIGN512_ALGNAME);
  }

  public void signFile(String filePath, String sigAlgName) {
    if (!this.initFlag1 && !this.initFlag2) {
      log.error("进行签名操作之前，请先通过默认或指定属性集方式初始化控件");
      this.errCode = SecssConstants.NO_INIT;
    } else {
      File f = new File(filePath);
      if (f != null && f.exists()) {
        byte[] sha512Bytes = null;
        BufferedInputStream is = null;
        
        label465: {
          try {
            MessageDigest digest = MessageDigest.getInstance(SecssConstants.SIGN512);
            is = new BufferedInputStream(new FileInputStream(f));
            byte[] buffer = new byte[4096];
            int readCount = is.read(buffer, 0, 4096);

            for(int startPos = 0; readCount != -1; readCount = is.read(buffer, 0, 4096)) {
              int i;
              for(i = 0; i < readCount; ++i) {
                if (buffer[i] == 13 || buffer[i] == 10) {
                  if (i - startPos > 0) {
                    digest.update(buffer, startPos, i - startPos);
                  }

                  startPos = i + 1;
                }
              }

              if (i - startPos > 0) {
                digest.update(buffer, startPos, i - startPos);
              }

              startPos = 0;
            }

            sha512Bytes = digest.digest();
            if (log.isDebugEnabled()) {
              String base64 = Base64.encodeBase64String(sha512Bytes);
              log.info("middle sign = " + base64);
            }
            break label465;
          } catch (FileNotFoundException var42) {
            log.error("文件不存在", var42);
            this.errCode = SecssConstants.SIGN_GOES_WRONG;
            return;
          } catch (NoSuchAlgorithmException var43) {
            log.error("算法不存在", var43);
            this.errCode = SecssConstants.SIGN_GOES_WRONG;
            return;
          } catch (UnsupportedEncodingException var44) {
            log.error("不支持的编码", var44);
            this.errCode = SecssConstants.SIGN_GOES_WRONG;
          } catch (IOException var45) {
            log.error("io异常", var45);
            this.errCode = SecssConstants.SIGN_GOES_WRONG;
            return;
          } finally {
            if (is != null) {
              try {
                is.close();
              } catch (IOException var39) {
                ;
              }
            }

          }

          return;
        }

        if (sha512Bytes == null) {
          log.error("签名失败");
          this.errCode = SecssConstants.SIGN_GOES_WRONG;
        } else {
          String sign = this.signDataBytes(sha512Bytes, sigAlgName);
          if (sign != null && sign.trim().length() > 0) {
            PrintWriter writer = null;

            try {
              writer = new PrintWriter(new FileWriter(f, true));
              writer.print(SecssConstants.RETURN_LINE);
              writer.print(sign);
              this.errCode = SecssConstants.SUCCESS;
            } catch (IOException var40) {
              log.error("文件签名异常", var40);
            } finally {
              if (writer != null) {
                writer.close();
              }

            }
          } else {
            this.errCode = SecssConstants.SIGN_GOES_WRONG;
          }

        }
      } else {
        log.error("文件不存在");
        this.errCode = SecssConstants.VERIFY_FAILED;
      }
    }
  }

  private String signDataBytes(byte[] dataBytes, String sigAlgName) {
    String sign = null;

    try {
      PrivateKey priKey = this.certUtil.getPriKey();
      if (priKey == null) {
        log.error("获取到的公钥为空");
        this.errCode = SecssConstants.SIGN_GOES_WRONG;
        return null;
      } else {
        Signature signature = Signature.getInstance(sigAlgName);
        signature.initSign(priKey);
        signature.update(dataBytes);
        sign = new String(Base64.encodeBase64(signature.sign()));
        return sign;
      }
    } catch (InvalidKeyException var6) {
      log.error("秘钥不正确", var6);
      this.errCode = SecssConstants.SIGN_GOES_WRONG;
      return null;
    } catch (NoSuchAlgorithmException var7) {
      log.error("算法不存在", var7);
      this.errCode = SecssConstants.SIGN_GOES_WRONG;
      return null;
    } catch (SignatureException var8) {
      log.error("验签失败", var8);
      this.errCode = SecssConstants.SIGN_GOES_WRONG;
      return null;
    }
  }

  public void verifyFile(String filePath) {
    this.verifyFile(filePath, SecssConstants.SIGN512_ALGNAME);
  }

  public void verifyFile(String filePath, String sigAlgName) {
    if (!this.initFlag1 && !this.initFlag2) {
      log.error("进行签名操作之前，请先通过默认或指定属性集方式初始化控件");
      this.errCode = SecssConstants.NO_INIT;
    } else {
      File f = new File(filePath);
      if (f != null && f.exists()) {
        byte[] signBytes = null;
        RandomAccessFile raf = null;
        boolean var6 = true;

        int signLenth;
        label606: {
          try {
            raf = new RandomAccessFile(f, "r");

            long filePos;
            for(filePos = f.length(); filePos >= 0L; --filePos) {
              raf.seek(filePos - 1L);
              byte b = (byte)raf.read();
              if (b == 13 || b == 10) {
                break;
              }
            }

            signLenth = (int)(raf.length() - filePos);
            byte[] temp = new byte[signLenth];
            raf.read(temp, 0, signLenth);
            if (log.isDebugEnabled()) {
              log.info("sign = " + new String(temp));
            }

            signBytes = Base64.decodeBase64(temp);
            break label606;
          } catch (FileNotFoundException var56) {
            log.error("文件不存在", var56);
            this.errCode = SecssConstants.SIGN_GOES_WRONG;
            return;
          } catch (IOException var57) {
            log.error("读取文件失败", var57);
            this.errCode = SecssConstants.SIGN_GOES_WRONG;
          } finally {
            if (raf != null) {
              try {
                raf.close();
              } catch (IOException var49) {
                ;
              }
            }

          }

          return;
        }

        if (signBytes == null) {
          log.error("获取签名失败");
          this.errCode = SecssConstants.SIGN_GOES_WRONG;
        } else {
          byte[] sha512Bytes = null;
          long leftLenth = f.length();
          BufferedInputStream is = null;

          label607: {
            try {
              MessageDigest digest = MessageDigest.getInstance(SecssConstants.SIGN512);
              is = new BufferedInputStream(new FileInputStream(f));
              byte[] buffer = new byte[4096];
              int readCount = is.read(buffer, 0, 4096);

              for(int startPos = 0; readCount != -1; readCount = is.read(buffer, 0, 4096)) {
                int i;
                for(i = 0; i < readCount && leftLenth > (long)signLenth; --leftLenth) {
                  if (buffer[i] == 13 || buffer[i] == 10) {
                    if (i - startPos > 0) {
                      digest.update(buffer, startPos, i - startPos);
                    }

                    startPos = i + 1;
                  }

                  ++i;
                }

                if (i - startPos > 0) {
                  digest.update(buffer, startPos, i - startPos);
                }

                if (leftLenth <= (long)signLenth) {
                  break;
                }

                startPos = 0;
              }

              sha512Bytes = digest.digest();
              if (log.isDebugEnabled()) {
                String base64 = Base64.encodeBase64String(sha512Bytes);
                log.info("middle sign = " + base64);
              }
              break label607;
            } catch (FileNotFoundException var51) {
              log.error("文件不存在", var51);
              this.errCode = SecssConstants.SIGN_GOES_WRONG;
              return;
            } catch (NoSuchAlgorithmException var52) {
              log.error("算法不存在", var52);
              this.errCode = SecssConstants.SIGN_GOES_WRONG;
              return;
            } catch (UnsupportedEncodingException var53) {
              log.error("不支持的编码", var53);
              this.errCode = SecssConstants.SIGN_GOES_WRONG;
              return;
            } catch (IOException var54) {
              log.error("io异常", var54);
              this.errCode = SecssConstants.SIGN_GOES_WRONG;
            } finally {
              if (is != null) {
                try {
                  is.close();
                } catch (IOException var50) {
                  ;
                }
              }

            }

            return;
          }

          if (sha512Bytes == null) {
            log.error("签名失败");
            this.errCode = SecssConstants.SIGN_GOES_WRONG;
          } else {
            boolean result = this.verifyFile(sha512Bytes, signBytes, sigAlgName);
            if (result) {
              this.errCode = SecssConstants.SUCCESS;
            } else {
              this.errCode = SecssConstants.VERIFY_FAILED;
            }

          }
        }
      } else {
        log.error("文件不存在");
        this.errCode = SecssConstants.VERIFY_FAILED;
      }
    }
  }

  private boolean verifyFile(byte[] dataBytes, byte[] signBytes, String sigAlgName) {
    boolean isSucess = false;

    try {
      PublicKey pubKey = this.certUtil.getPubKey();
      if (pubKey == null) {
        log.error("获取到的公钥为空");
        this.errCode = SecssConstants.VERIFY_FAILED;
        return false;
      }

      Signature signature = Signature.getInstance(sigAlgName);
      signature.initVerify(pubKey);
      signature.update(dataBytes);
      isSucess = signature.verify(signBytes);
    } catch (InvalidKeyException var7) {
      log.error("秘钥不正确", var7);
      this.errCode = SecssConstants.VERIFY_FAILED;
      isSucess = false;
    } catch (NoSuchAlgorithmException var8) {
      log.error("算法不存在", var8);
      this.errCode = SecssConstants.VERIFY_FAILED;
      isSucess = false;
    } catch (SignatureException var9) {
      log.error("验签失败", var9);
      this.errCode = SecssConstants.VERIFY_FAILED;
      isSucess = false;
    }

    return isSucess;
  }

  private byte[] hashBytes(String hashAlg, byte[] dataBytes) throws NoSuchAlgorithmException {
    MessageDigest digest = MessageDigest.getInstance(hashAlg.trim());
    ByteArrayInputStream is = null;

    try {
      is = new ByteArrayInputStream(dataBytes);
      byte[] buffer = new byte[4096];

      for(int readCount = is.read(buffer, 0, 4096); readCount != -1; readCount = is.read(buffer, 0, 4096)) {
        digest.update(buffer, 0, readCount);
      }

      dataBytes = digest.digest();
      String base64 = Base64.encodeBase64String(dataBytes);
      log.info("hash = " + base64);
      byte[] var9 = dataBytes;
      return var9;
    } finally {
      if (is != null) {
        try {
          is.close();
        } catch (IOException var14) {
          ;
        }
      }

    }
  }

  public static boolean isEmpty(String s) {
    return s == null || "".equals(s.trim());
  }

  public static boolean isEmpty(byte[] b) {
    return b == null || b.length < 1;
  }

  public String getSign() {
    return this.sign;
  }

  public String getEncPin() {
    return this.encPin;
  }

  public String getEncValue() {
    return this.encValue;
  }

  public String getDecValue() {
    return this.decValue;
  }

  public String getCertId() {
    return this.certId;
  }

  public String getErrCode() {
    return this.errCode;
  }

  public String getErrMsg() {
    if (isEmpty(this.errCode)) {
      this.errMsg = (String) SecssConstants.ERRMAP.get(SecssConstants.UNKNOWN_WRONG);
    } else {
      this.errMsg = (String) SecssConstants.ERRMAP.get(this.errCode);
    }

    if (isEmpty(this.errMsg)) {
      this.errMsg = (String) SecssConstants.ERRMAP.get(SecssConstants.UNKNOWN_WRONG);
    }

    return this.errMsg;
  }

  public long getHashLength() {
    return this.hashLength;
  }

  public void setHashLength(long hashLength) {
    this.hashLength = hashLength;
  }

  public static void main(String[] args) throws Exception {
    String str = "你好";
    String enStr = cpEncryptData(str);
    System.out.println("加密后的数据：" + enStr);
    String decStr = cpDecryptData(enStr);
    System.out.println("解密后的数据:" + decStr);
  }
}
