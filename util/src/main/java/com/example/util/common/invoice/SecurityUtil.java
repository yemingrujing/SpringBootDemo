package com.example.util.common.invoice;

import com.example.util.common.StringUtil;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.security.Key;
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
    private static final Base64 base64 = new Base64();

    /**
     * 定义 加密算法,可用 DES,DESede,Blowfish,AES/ECB/PKCS5Padding
     */
    private static final String Algorithm = "AES/ECB/PKCS5Padding";

    /**
     * ECB加密,不要IV
     * @param key 密钥
     * @param data 明文
     * @return Base64编码的密文
     * @throws Exception
     */
    public static String AESEncrypt(String key, String data) throws Exception {
        if (key == null) {
            return null;
        }
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
        Cipher cipher = Cipher.getInstance(Algorithm);
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        // Base64 加密
        return base64.encodeToString(cipher.doFinal(data.getBytes("UTF-8")));
    }

    /**
     * ECB解密,不要IV
     * @param key 密钥
     * @param data Base64编码的密文
     * @return 明文
     * @throws Exception
     */
    public static String AESDecrypt(String key,String data) throws Exception {
        if (key == null) {
            return null;
        }
        // Base64 解密
        byte[] dateBytes = base64.decode(data);
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
        Cipher cipher = Cipher.getInstance(Algorithm);
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] original = cipher.doFinal(dateBytes);
        return new String(original, "UTF-8");
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
}
