package com.example.util.common;

import com.example.util.image.ImageOperateUtil;
import com.example.util.image.ImageUtils;
import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;
import java.util.UUID;

/**
 * 二维码工具类
 *
 * @author Wei.Guang
 * @create 2018-09-04 18:02
 **/
public class QRCodeUtil {

    private static final String CHARSET = "UTF-8";

    /**
     * 图片格式
     */
    private static final String FORMAT = "JPG";

    /**
     * 二维码尺寸
     */
    private static final int QRCODE_SIZE = 300;

    /**
     * 二维码尺寸(一半)
     */
    private static final int QRCODE_HALF_SIZE = QRCODE_SIZE / 2;

    /**
     * LOGO宽度
     */
    private static final int LOGO_WIDTH = 60;

    /**
     * LOGO高度
     */
    private static final int LOGO_HEIGHT = 60;

    /**
     * 圆角半径
     */
    private static final int RADIUS = 10;

    /**
     * 边框边距
     */
    private static final int MARGIN = 2;

    /**
     * 默认是黑色
     */
    private static final int QRCOLOR = 0xFF000000;

    /**
     * 背景颜色
     */
    private static final int BGWHITE = 0xFFFFFFFF;

    /**
     * 创建二维码
     * @param content
     * @param logoPath
     * @param needCompress
     * @param note
     * @return
     * @throws Exception
     */
    private static BufferedImage createImage(String content, String logoPath, boolean needCompress, String note) throws Exception {
        Hashtable<EncodeHintType, Object> hints = new Hashtable<>();
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        hints.put(EncodeHintType.CHARACTER_SET, CHARSET);
        hints.put(EncodeHintType.MARGIN, 1);
        // 参数顺序分别为：编码内容，编码类型，生成图片宽度，生成图片高度，设置参数
        BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, QRCODE_SIZE, QRCODE_SIZE, hints);
        int width = bitMatrix.getWidth();
        int height = bitMatrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                // 开始利用二维码数据创建Bitmap图片，分别设为黑（0xFFFFFFFF）白（0xFF000000）两色
                image.setRGB(x, y, bitMatrix.get(x, y) ? QRCOLOR : BGWHITE);
            }
        }
        if (StringUtil.isBlank(logoPath)) {
            return image;
        }
        // 插入图片
        QRCodeUtil.insertImage(image, logoPath, needCompress);
        if (StringUtil.isBlank(note)) {
            return image;
        }
        // 插入文字
        image = QRCodeUtil.insertStr(image, note);
        return image;
    }

    /**
     * 插入LOGO
     * @param source 二维码图片
     * @param logoPath LOGO图片地址
     * @param needCompress 是否压缩
     * @throws Exception
     */
    private static void insertImage(BufferedImage source, String logoPath, boolean needCompress) throws Exception {
        File file = new File(logoPath);
        if (!file.exists()) {
            throw new Exception("logo file not found");
        }
        Image src = ImageIO.read(new File(logoPath));
        int width =  src.getWidth(null);
        int height =  src.getHeight(null);
        if (needCompress) {
            int cornerRadius = LOGO_WIDTH / 4;
            //压缩LOGO
            if (width > LOGO_WIDTH) {
                width = LOGO_WIDTH;
            }

            if (height > LOGO_HEIGHT) {
                height = LOGO_HEIGHT;
            }
            Image image = src.getScaledInstance(width, height, Image.SCALE_SMOOTH);
            BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = tag.createGraphics();
            g.setComposite(AlphaComposite.Src);
            g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g.setColor(Color.WHITE);
            g.fill(new RoundRectangle2D.Float(0, 0, width, height, cornerRadius, cornerRadius));
            // 绘制缩小后的图
            g.drawImage(image, 0, 0, null);
            g.dispose();
            src = image;
        }
        // 绘制圆角图片
        src = ImageOperateUtil.makeRoundedCorner(src, src.getWidth(null) / 4);
        // 绘制边框
        src = ImageOperateUtil.makeRoundBorder(src, src.getWidth(null) / 4, Color.BLUE);
        Graphics2D graph = source.createGraphics();
        //logo放在中心
        int x = (QRCODE_SIZE - width) / 2;
        int y = (QRCODE_SIZE - height) / 2;
        //logo放在右下角
        //int x = QRCODE_SIZE - width;
        //int y = QRCODE_SIZE - height;

        graph.setComposite(AlphaComposite.SrcAtop);
        graph.drawImage(src, x, y, width, height, null);
//        Shape shape = new RoundRectangle2D.Float(x, y, width, height, 6, 6);
//        graph.setStroke(new BasicStroke(3f));
//        graph.draw(shape);
        graph.dispose();
        source.flush();
    }

    /**
     * 插入文本
     * @param image 二维码图片
     * @param note 插入的文本描述
     */
    private static BufferedImage insertStr(BufferedImage image, String note) {
        // 新的图片，把带logo的二维码下面加上文字
        BufferedImage outImage = new BufferedImage(QRCODE_SIZE, QRCODE_SIZE + 45, BufferedImage.TYPE_INT_BGR);
        int height = image.getHeight();
        Graphics2D outg = outImage.createGraphics();
        // 画二维码到新的面板
        outg.drawImage(image, 0, 0, image.getWidth(), image.getHeight(), null);
        // 画文字到新的面板
        outg.setColor(Color.WHITE);
        outg.setFont(new Font("楷体", Font.BOLD, 30));
        int strWidth = outg.getFontMetrics().stringWidth(note);
        if (strWidth > QRCODE_SIZE) {
            //长度过长就截取前面部分 换行
            String note1 = note.substring(0, note.length() / 2);
            String note2 = note.substring(note.length() / 2, note.length());
            int strWidth1 = outg.getFontMetrics().stringWidth(note1);
            int strWidth2 = outg.getFontMetrics().stringWidth(note2);
            outg.drawString(note1, QRCODE_SIZE / 2 - strWidth1 / 2, height + (outImage.getHeight() - height) / 2 + 12);
            BufferedImage outImage2 = new BufferedImage(QRCODE_SIZE, QRCODE_SIZE + 85, BufferedImage.TYPE_INT_BGR);
            Graphics2D outg2 = outImage2.createGraphics();
            outg2.drawImage(outImage, 0, 0, outImage.getWidth(), outImage.getHeight(), null);
            outg2.setColor(Color.WHITE);
            // 字体、字型、字号
            outg2.setFont(new Font("宋体", Font.BOLD, 30));
            outg2.drawString(note2, QRCODE_SIZE / 2 - strWidth2 / 2, outImage.getHeight() + (outImage2.getHeight() - outImage.getHeight()) / 2 + 5);
            outg2.dispose();
            outImage2.flush();
            outImage = outImage2;
        } else {
            //画文字
            outg.drawString(note, QRCODE_SIZE / 2 - strWidth / 2, height + (outImage.getHeight() - height) / 2 + 12);
        }
        outg.dispose();
        outImage.flush();
        image = outImage;
        image.flush();
        return image;
    }

    /**
     * 插入LOGO
     * @param source 二维码图片
     * @param logoPath LOGO图片地址
     * @throws Exception
     */
    private static void insertImage(BufferedImage source, String logoPath) throws Exception {
        File file = new File(logoPath);
        if (!file.exists()) {
            throw new Exception("logo file not found");
        }
        BufferedImage src = ImageIO.read(new File(logoPath));
        src = ImageUtils.fromFile(new File(logoPath)).width(LOGO_WIDTH).height(LOGO_HEIGHT).resize(src);
        Graphics2D graph = source.createGraphics();
        //logo放在中心
        int x = (QRCODE_SIZE - LOGO_WIDTH) / 2;
        int y = (QRCODE_SIZE - LOGO_HEIGHT) / 2;
        //logo放在右下角
        //int x = QRCODE_SIZE - width;
        //int y = QRCODE_SIZE - height;

        graph.drawImage(src, x, y, LOGO_WIDTH, LOGO_HEIGHT, null);
        Shape shape = new RoundRectangle2D.Float(x, y, LOGO_WIDTH, LOGO_HEIGHT, 6, 6);
        graph.setStroke(new BasicStroke(3f));
        graph.draw(shape);
        graph.dispose();
    }

    /**
     * 生成二维码(内嵌LOGO)
     * 二维码文件名随机，文件名可能会有重复
     * @param content 内容
     * @param logoPath LOGO地址
     * @param destPath 存放目录
     * @param needCompress 是否压缩LOGO
     * @return
     */
    public static String encode(String content, String logoPath, String destPath, boolean needCompress, String note) throws Exception {
        BufferedImage image = QRCodeUtil.createImage(content, logoPath, needCompress, note);
        mkdirs(destPath);
        String fileName = UUID.randomUUID().toString() + "." + FORMAT.toLowerCase();
        ImageIO.write(image, FORMAT, new File(destPath + File.separator + fileName));
        return fileName;
    }

    /**
     * 生成二维码(内嵌LOGO) 调用者指定二维码文件名
     * @param content 内容
     * @param logoPath LOGO地址
     * @param destPath 存放目录
     * @param fileName 二维码文件名
     * @param needCompress 是否压缩LOGO
     * @return
     * @throws Exception
     */
    public static String encode(String content, String logoPath, String destPath, String fileName, boolean needCompress, String note) throws Exception {
        BufferedImage image = QRCodeUtil.createImage(content, logoPath, needCompress, note);
        mkdirs(destPath);
        fileName = fileName.substring(0, fileName.indexOf(".") > 0 ? fileName.indexOf(".") : fileName.length()) + "." + FORMAT.toLowerCase();
        ImageIO.write(image, FORMAT, new File(destPath + "/" + fileName));
        return fileName;
    }

    /**
     * 当文件夹不存在时，mkdirs会自动创建多层目录，区别于mkdir．(mkdir如果父目录不存在则会抛出异常)
     * @param destPath
     */
    public static void mkdirs(String destPath) {
        File file = new File(destPath);
        if (!file.exists() && !file.isDirectory()) {
            file.mkdirs();
        }
    }

    /**
     * 生成二维码(内嵌LOGO)
     * @param content 内容
     * @param logoPath LOGO地址
     * @param destPath 存储地址
     * @param note 嵌入文字内容
     * @return
     * @throws Exception
     */
    public static String encode(String content, String logoPath, String destPath, String note) throws Exception {
        return QRCodeUtil.encode(content, logoPath, destPath, false, note);
    }

    /**
     * 生成二维码
     * @param content 内容
     * @param destPath 存储地址
     * @param needCompress 是否压缩LOGO
     * @return
     * @throws Exception
     */
    public static String encode(String content, String destPath, boolean needCompress) throws Exception {
        return QRCodeUtil.encode(content, null, destPath, needCompress, null);
    }

    /**
     * 生成二维码
     * @param content 内容
     * @param destPath 存储地址
     * @return
     * @throws Exception
     */
    public static String encode(String content, String destPath) throws Exception {
        return QRCodeUtil.encode(content, null, destPath, false, null);
    }

    /**
     * 生成二维码(内嵌LOGO)
     * @param content 内容
     * @param logoPath LOGO地址
     * @param outputStream 输出流
     * @param needCompress 是否压缩LOGO
     * @param note 嵌入文字内容
     * @throws Exception
     */
    public static void encode(String content, String logoPath, OutputStream outputStream, boolean needCompress, String note) throws Exception {
        BufferedImage image = QRCodeUtil.createImage(content, logoPath, needCompress, note);
        ImageIO.write(image, FORMAT, outputStream);
    }

    /**
     * 生成二维码
     * @param content 内容
     * @param outputStream 输出流
     * @throws Exception
     */
    public static void encode(String content, OutputStream outputStream) throws Exception {
        QRCodeUtil.encode(content, null, outputStream, false, null);
    }

    /**
     * 解析二维码
     * @param file 二维码图片
     * @return
     * @throws IOException
     * @throws NotFoundException
     */
    public static String decode(File file) throws IOException, NotFoundException {
        BufferedImage image;
        image = ImageIO.read(file);
        if (image == null) {
            return null;
        }
        BufferedImageLuminanceSource source = new BufferedImageLuminanceSource(image);
        BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
        Result result;
        Hashtable<DecodeHintType, Object> hints = new Hashtable<>();
        hints.put(DecodeHintType.CHARACTER_SET, CHARSET);
        result = new MultiFormatReader().decode(bitmap, hints);
        String resultStr = result.getText();
        return resultStr;
    }

    /**
     * 解析二维码
     * @param path 二维码图片地址
     * @return
     * @throws IOException
     * @throws NotFoundException
     */
    public static String decode(String path) throws IOException, NotFoundException {
        return QRCodeUtil.decode(new File(path));
    }
    
    public static void main(String[] args) throws Exception {
        String text = "http://www.baidu.com";
        //不含LOGO
        QRCodeUtil.encode(text, null, "E:\\file\\qrcode", true, null);
        //含LOGO，不指定二维码图片
        QRCodeUtil.encode(text, "C:\\Users\\guang\\Desktop\\logo.jpg", "E:\\file\\qrcode", true, "淘美妆");
        //含LOGO，指定二维码图片名
        QRCodeUtil.encode(text, "C:\\Users\\guang\\Desktop\\logo.jpg", "E:\\file\\qrcode", "qrcode", true, "淘美妆");
    }
}
