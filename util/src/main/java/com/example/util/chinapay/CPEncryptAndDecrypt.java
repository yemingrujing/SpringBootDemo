package com.example.util.chinapay;

import lombok.extern.slf4j.Slf4j;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.security.Security;

@Slf4j
public class CPEncryptAndDecrypt
{
  private String keyStr = "ChinaPay20150708";
  private String provider = "BC";
  public static final String ENC_AES_ECB_PKCS5PADDING = "AES/ECB/PKCS5Padding";
  
  static
  {
    Security.addProvider(new BouncyCastleProvider());
  }
  
  public byte[] encryptPassword(byte[] orgBytes)
    throws Exception
  {
    byte[] encPassBytes = null;
    byte[] scrKeyBytes = this.keyStr.getBytes(SecssConstants.CHARSET_COMM);
    if (isEmpty(scrKeyBytes)) {
      throw new Exception("加密密钥为空，无法进行加密操作！");
    }
    try
    {
      encPassBytes = encryptWithSecretKey(orgBytes, scrKeyBytes, "AES/ECB/PKCS5Padding", 
        this.provider);
    }
    catch (Exception e)
    {
      log.error("加密所需密钥发错误！", e);
      throw new Exception("加密所需密钥发错误！");
    }
    return encPassBytes;
  }
  
  public byte[] decryptPassword(byte[] orgBytes)
    throws Exception
  {
    byte[] decPassBytes = null;
    byte[] scrKeyBytes = this.keyStr.getBytes(SecssConstants.CHARSET_COMM);
    if (isEmpty(scrKeyBytes)) {
      throw new Exception("解密密钥为空，无法进行解密操作！");
    }
    try
    {
      decPassBytes = decryptWithSecretKey(orgBytes, scrKeyBytes, "AES/ECB/PKCS5Padding", 
        this.provider);
    }
    catch (Exception e)
    {
      log.error("解密密钥发错误！", e);
      throw new Exception("解密钥发错误！");
    }
    return decPassBytes;
  }
  
  public static byte[] decryptWithSecretKey(byte[] dataBytes, byte[] keyBytes, String algName, String provider)
    throws Exception
  {
    return doSecure(dataBytes, keyBytes, 2, algName, 
      provider);
  }
  
  public static byte[] encryptWithSecretKey(byte[] dataBytes, byte[] keyBytes, String algName, String provider)
    throws Exception
  {
    return doSecure(dataBytes, keyBytes, 1, algName, 
      provider);
  }
  
  public static byte[] doSecure(byte[] dataBytes, byte[] keyBytes, int mode, String algName, String provider)
    throws Exception
  {
    Key key = generateSecretKey(keyBytes, algName);
    return doSecure(dataBytes, key, mode, algName, provider);
  }
  
  public static Key generateSecretKey(byte[] enCodeFormat, String algName)
  {
    String localName = algName;
    if (algName.contains("/")) {
      localName = localName.split("[/]")[0];
    }
    return new SecretKeySpec(enCodeFormat, localName);
  }
  
  public static byte[] doSecure(byte[] dataBytes, Key key, int mode, String algName, String provider)
    throws Exception
  {
    Cipher cipher = Cipher.getInstance(algName, provider);
    cipher.init(mode, key);
    return cipher.doFinal(dataBytes);
  }
  
  public static boolean isEmpty(byte[] bty)
  {
    return bty == null;
  }
  
  public static String parseByte2HexStr(byte[] buf)
  {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < buf.length; i++)
    {
      String hex = Integer.toHexString(buf[i] & 0xFF);
      if (hex.length() == 1) {
        hex = '0' + hex;
      }
      sb.append(hex.toUpperCase());
    }
    return sb.toString();
  }
  
  public static byte[] parseHexStr2Byte(String hexStr)
  {
    if (hexStr.length() < 1) {
      return null;
    }
    byte[] result = new byte[hexStr.length() / 2];
    for (int i = 0; i < hexStr.length() / 2; i++)
    {
      int high = Integer.parseInt(hexStr.substring(i * 2, i * 2 + 1), 16);
      int low = Integer.parseInt(hexStr.substring(i * 2 + 1, i * 2 + 2), 16);
      result[i] = ((byte)(high * 16 + low));
    }
    return result;
  }
}
