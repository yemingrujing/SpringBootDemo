package com.example.util.common.invoice;

import org.apache.commons.codec.binary.Base64;
import sun.misc.BASE64Decoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.util.zip.GZIPInputStream;

/**
 * 3DES加密解密
 *
 * @author Wei.Guang
 * @create 2018-11-21 15:38
 **/
public class DesUtil {

    /**
     * 【Java使用3DES加密解密的流程】
     * ①传入共同约定的密钥（keyBytes）以及算法（Algorithm），来构建SecretKey密钥对象
     * SecretKey deskey = new SecretKeySpec(keyBytes, Algorithm);
     * ②根据算法实例化Cipher对象。它负责加密/解密
     * Cipher c1 = Cipher.getInstance(Algorithm);
     * ③传入加密/解密模式以及SecretKey密钥对象，实例化Cipher对象
     * c1.init(Cipher.ENCRYPT_MODE, deskey);
     * ④传入字节数组，调用Cipher.doFinal()方法，实现加密/解密，并返回一个byte字节数组
     * c1.doFinal(src);
     */
    private final Base64 base64 = new Base64();


    /**
     * 加密
     * base64 encrypt
     * @param strMingByte
     * @return
     * @throws UnsupportedEncodingException
     */
    public String getBase64EncString(byte[] strMingByte) throws UnsupportedEncodingException {
        String encodedText = base64.encodeToString(strMingByte);
        return encodedText;
    }

    /**
     * 解密
     * base64 decrypt
     * @param encodedText
     * @return
     * @throws UnsupportedEncodingException
     */
    public byte[] getBase64DecString(String encodedText) throws UnsupportedEncodingException  {
        return base64.decode(encodedText);
    }

    /**
     * 字符串转换为数组
     * @param strMing
     * @return
     * @throws UnsupportedEncodingException
     */
    public byte[] getStringByte(String strMing) throws UnsupportedEncodingException{
        return strMing.getBytes("UTF-8");
    }

    /**
     * ECB加密,不要IV
     * @param key 密钥
     * @param data 明文
     * @return Base64编码的密文
     * @throws Exception
     */
    public  byte[] des3EncodeECB(byte[] key, byte[] data) throws Exception {
        Key deskey;
        DESedeKeySpec spec = new DESedeKeySpec(key);
        SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");
        deskey = keyfactory.generateSecret(spec);
        Cipher cipher = Cipher.getInstance("desede" + "/ECB/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, deskey);
        byte[] bOut = cipher.doFinal(data);
        return bOut;
    }

    /**
     * ECB解密,不要IV
     * @param key 密钥
     * @param data Base64编码的密文
     * @return 明文
     * @throws Exception
     */
    public  byte[] ees3DecodeECB(byte[] key, byte[] data) throws Exception {
        Key deskey;
        DESedeKeySpec spec = new DESedeKeySpec(key);
        SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");
        deskey = keyfactory.generateSecret(spec);
        Cipher cipher = Cipher.getInstance("desede" + "/ECB/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, deskey);
        byte[] bOut = cipher.doFinal(data);
        return bOut;
    }

    /**
     * zip解压
     * @param data
     * @return
     */
    public static byte[] unGZip(byte[] data) {
        byte[] b = null;
        try {
            ByteArrayInputStream bis = new ByteArrayInputStream(data);
            GZIPInputStream gzip = new GZIPInputStream(bis);
            byte[] buf = new byte[1024];
            int num = -1;
            ByteArrayOutputStream bs = new ByteArrayOutputStream();
            while ((num = gzip.read(buf, 0, buf.length)) != -1) {
                bs.write(buf, 0, num);
            }
            b = bs.toByteArray();
            bs.flush();
            bs.close();
            gzip.close();
            bis.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return b;
    }

    /**
     * ECB加密
     * @param key
     * @param data
     * @return
     * @throws Exception
     */
    public  String ees3encodeECB(String key, String data) throws Exception {
        Key deskey;
        DESedeKeySpec spec = new DESedeKeySpec(key.getBytes("UTF-8"));
        SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");
        deskey = keyfactory.generateSecret(spec);
        Cipher cipher = Cipher.getInstance("desede" + "/ECB/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, deskey);
        byte[] bOut = cipher.doFinal(data.getBytes("UTF-8"));
        sun.misc.BASE64Encoder encoder=new sun.misc.BASE64Encoder();
        return encoder.encode(bOut);
    }

    /**
     * 将base64字符解码保存文件
     * @param base64Code
     * @param targetPath
     * @throws Exception
     */
    public static void decoderBase64File(String base64Code, String targetPath) throws Exception {
        byte[] buffer = new BASE64Decoder().decodeBuffer(base64Code);
        FileOutputStream out = new FileOutputStream(targetPath);
        out.write(buffer);
        out.close();

    }
}
