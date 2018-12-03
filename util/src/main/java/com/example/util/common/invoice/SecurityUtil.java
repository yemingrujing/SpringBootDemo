package com.example.util.common.invoice;

import com.example.util.common.StringUtil;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

/**
 * 3DES加密解密
 *
 * @author Wei.Guang
 * @create 2018-11-21 15:38
 **/
public class SecurityUtil {

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
    private static final Base64 BASE64 = new Base64();

    /**
     * MD5Hash码位数
     */
    private static final int MD5HASHLENGTH = 16;

    /**
     * 定义 加密算法,可用 DES/CBC/PKCS5Padding(KEY 由8位字节数组通过SecretKeySpec类转换而成, IV偏转向量，由8位字节数组通过IvParameterSpec类转换而成。),
     * TripleDES/CBC/PKCS5Padding(KEY 由24位字节数组通过SecretKeySpec类转换而成, IV偏转向量，由8位字节数组通过IvParameterSpec类转换而成。)
     */
    private static final String ALGORITHM = "DES/CBC/PKCS5Padding";

    /**
     * ECB加密,不要IV
     * @param keyData 密钥
     * @param data 明文
     * @return Base64编码的密文
     * @throws Exception
     */
    public static String AESEncrypt(String keyData, String data) throws Exception {
        if (keyData == null) {
            return null;
        }

        byte[] encrypt = {};
        if (data != null) {
            encrypt = data.getBytes("utf-8");
        }
        // 取MD5Hash码，并组合加密数组
        byte[] md5Hasn = SecurityUtil.MD5Hash(encrypt, 0, encrypt.length);
        // 组合消息体
        byte[] totalByte = SecurityUtil.addMD5(md5Hasn, encrypt);

        // 取密钥和偏转向量
        byte[] key = new byte[8];
        byte[] iv = new byte[8];
        getKeyIV(keyData, key, iv);

        SecretKeySpec skeySpec = new SecretKeySpec(key, "DES");
        IvParameterSpec ivParam = new IvParameterSpec(iv);

        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, ivParam);
        // Base64 加密
        return BASE64.encodeToString(cipher.doFinal(totalByte, 0, totalByte.length));
    }

    /**
     * ECB解密,不要IV
     * @param keyData 密钥
     * @param data Base64编码的密文
     * @return 明文
     * @throws Exception
     */
    public static String AESDecrypt(String keyData, String data) throws Exception {
        if (keyData == null) {
            return null;
        }

        if (data != null){
            //解决URL里加号变空格
            data = data.replaceAll(" ", "+");
        }
        // Base64 解密
        byte[] encBuf = BASE64.decode(data);

        // 取密钥和偏转向量
        byte[] key = new byte[8];
        byte[] iv = new byte[8];
        getKeyIV(keyData, key, iv);

        SecretKeySpec skeySpec = new SecretKeySpec(key, "DES");
        IvParameterSpec ivParam = new IvParameterSpec(iv);

        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, skeySpec, ivParam);
        byte[] original = cipher.doFinal(encBuf, 0, encBuf.length);

        // 进行解密后的md5Hash校验
        byte[] md5Hash = SecurityUtil.MD5Hash(original, MD5HASHLENGTH, original.length - MD5HASHLENGTH);;
        // 进行解密校检
        for (int i = 0; i < md5Hash.length; i++) {
            if (md5Hash[i] != original[i]) {
                throw new Exception("MD5校验错误。");
            }
        }
        return new String(original, MD5HASHLENGTH, original.length - MD5HASHLENGTH, "UTF-8");
    }

    /**
     * zip压缩
     * @param data
     * @return
     * @throws Exception
     */
    public static String compress(String data) throws Exception {
        if (StringUtil.isBlank(data)) {
            return "";
        }
        byte[] tArray;
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        GZIPOutputStream gzip = new GZIPOutputStream(out);
        try {
            gzip.write(data.getBytes("UTF-8"));
            gzip.flush();
        } finally {
            gzip.close();
        }

        tArray = out.toByteArray();
        out.close();
        return new BASE64Encoder().encode(tArray);
    }

    /**
     * zip解压
     * @param data
     * @return
     * @throws Exception
     */
    public static String unGZip(String data) throws Exception {
        if (StringUtil.isBlank(data)) {
            return "";
        }
        byte[] dataBytes = new BASE64Decoder().decodeBuffer(data);
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ByteArrayInputStream bis = new ByteArrayInputStream(dataBytes);
        GZIPInputStream gzip = new GZIPInputStream(bis);
        try {
            byte[] buf = new byte[1024];
            int num = -1;
            while ((num = gzip.read(buf, 0, buf.length)) != -1) {
                bos.write(buf, 0, num);
            }
        } finally {
            gzip.close();
        }
        bos.flush();
        bos.close();
        bis.close();
        return bos.toString("UTF-8");
    }

    /**
     * 将base64字符解码保存文件
     * @param base64Code
     * @param targetPath
     * @throws Exception
     */
    public static void decoderBase64File(String base64Code, String targetPath) throws Exception {
        byte[] buffer = new BASE64Decoder().decodeBuffer(base64Code);
        FileOutputStream out = new FileOutputStream(InvoiceConfig.getConfig().getPdfFilePath() + targetPath);
        out.write(buffer);
        out.close();
    }

    /**
     * 下载文件
     * @param base64Code
     * @param targetPath
     * @param response
     */
    public static void downLoadFile (String base64Code, String targetPath, HttpServletResponse response) throws IOException {
        byte[] buffer = new BASE64Decoder().decodeBuffer(base64Code);
        response.setCharacterEncoding("UTF-8");
        response.setHeader("content-Type", "application/octet-stream");
        response.setHeader("Content-Disposition",
                "attachment;filename=" + URLEncoder.encode(targetPath, "UTF-8"));
        OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
        outputStream.write(buffer);
        outputStream.flush();
        IOUtils.closeQuietly(outputStream);
    }

    /**
     * <li>
     * 方法名称:MD5Hash</li> <li>
     * 功能描述:
     *
     * <pre>
     * MD5，进行了简单的封装，以适用于加，解密字符串的校验。
     * </pre>
     *
     * </li>
     *
     * @param buf
     *            需要MD5加密字节数组。
     * @param offset
     *            加密数据起始位置。
     * @param length
     *            需要加密的数组长度。
     * @return
     * @throws Exception
     */
    public static byte[] MD5Hash(byte[] buf, int offset, int length) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(buf, offset, length);
        return md.digest();
    }

    /**
     * <li>
     * 方法名称:addMD5</li> <li>
     * 功能描述:
     *
     * <pre>
     * MD校验码 组合方法，前16位放MD5Hash码。 把MD5验证码byte[]，加密内容byte[]组合的方法。
     * </pre>
     *
     * </li>
     *
     * @param md5Byte
     *            加密内容的MD5Hash字节数组。
     * @param bodyByte
     *            加密内容字节数组
     * @return 组合后的字节数组，比加密内容长16个字节。
     */
    public static byte[] addMD5(byte[] md5Byte, byte[] bodyByte) {
        int length = bodyByte.length + md5Byte.length;
        byte[] resutlByte = new byte[length];

        // 前16位放MD5Hash码
        for (int i = 0; i < length; i++) {
            if (i < md5Byte.length) {
                resutlByte[i] = md5Byte[i];
            } else {
                resutlByte[i] = bodyByte[i - md5Byte.length];
            }
        }

        return resutlByte;
    }

    /**
     * <li>
     * 方法名称:getKeyIV</li> <li>
     * 功能描述:
     *
     * <pre>
     *
     * </pre>
     * </li>
     *
     * @param encryptKey
     * @param key
     * @param iv
     */
    public static void getKeyIV(String encryptKey, byte[] key, byte[] iv) {
        // 密钥Base64解密
        byte[] buf = Base64.decodeBase64(encryptKey);
        // 前8位为key
        int i;
        for (i = 0; i < key.length; i++) {
            key[i] = buf[i];
        }
        // 后8位为iv向量
        for (i = 0; i < iv.length; i++) {
            iv[i] = buf[i + 8];
        }
    }
}
