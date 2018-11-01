package com.example.util.common;

import com.example.util.image.ImageOperateUtil;
import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageConfig;
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
    private static final int LOGO_WIDTH = 80;

    /**
     * LOGO高度
     */
    private static final int LOGO_HEIGHT = 60;

    /**
     * 左上角颜色
     */
    private static final int RADIUS = 60;

    /**
     * 边框边距
     */
    private static final int MARGIN = 2;

    /**
     * 默认是黑色
     */
    private static final int QRCOLOR = 0xff0000ff;

    /**
     * 背景颜色
     */
    private static final int BGWHITE = 0xffFFFF00;

    /**
     * 背景图填充样式（1：选择一块区域进行填充， 其他：覆盖方式）
     */
    public static final int STYLE = 0;

    /**
     * 背景图选择区域填充
     */
    private static final int BGSTARTX = 10;

    /**
     * 背景图选择区域填充
     */
    private static final int BGSTARTY = 10;

    /**
     * 创建二维码
     *
     * @param content      二维码内容
     * @param logoPath     logo路径
     * @param needCompress 是否压缩
     * @param bgPath       背景图路径
     * @param note
     * @return
     * @throws Exception
     */
    private static BufferedImage createImage(String content, String logoPath, boolean needCompress, String bgPath, String note) throws Exception {
        Hashtable<EncodeHintType, Object> hints = new Hashtable<>();
        // 指定纠错等级
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        // 指定编码格式
        hints.put(EncodeHintType.CHARACTER_SET, CHARSET);
        // 设置白边
        hints.put(EncodeHintType.MARGIN, 1);
        // 参数顺序分别为：编码内容，编码类型，生成图片宽度，生成图片高度，设置参数
        BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, QRCODE_SIZE, QRCODE_SIZE, hints);
        int width = bitMatrix.getWidth();
        int height = bitMatrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                MatrixToImageConfig config = new MatrixToImageConfig(QRCOLOR, BGWHITE);
                if (x > 0 && x < RADIUS && y > 0 && y < RADIUS) {
                    image.setRGB(x, y, bitMatrix.get(x, y) ? Color.RED.getRGB() : config.getPixelOffColor());
                } else if(x > QRCODE_SIZE - RADIUS && x < QRCODE_SIZE && y > 0 && y < RADIUS) {
                    image.setRGB(x, y, bitMatrix.get(x, y) ? Color.RED.getRGB() : config.getPixelOffColor());
                } else if(x > 0 && x < RADIUS && y > QRCODE_SIZE - RADIUS && y < QRCODE_SIZE) {
                    image.setRGB(x, y, bitMatrix.get(x, y) ? Color.RED.getRGB() : config.getPixelOffColor());
                }  else {
                    // 开始利用二维码数据创建Bitmap图片
                    image.setRGB(x, y, bitMatrix.get(x, y) ? config.getPixelOnColor() : config.getPixelOffColor());
                }
            }
        }
        // 插入图片
        if (StringUtil.isNotBlank(logoPath)) {
            image = QRCodeUtil.insertImage(image, logoPath, needCompress);
        }
        // 添加背景图
        if (StringUtil.isNotBlank(bgPath)) {
            image = QRCodeUtil.drawBackground(image, bgPath);
        }
        // 插入文字
        if (StringUtil.isNotBlank(note)) {
            image = QRCodeUtil.insertStr(image, note);
        }
        return image;
    }

    /**
     * 插入LOGO
     *
     * @param source       二维码图片
     * @param logoPath     LOGO图片地址
     * @param needCompress 是否压缩
     * @throws Exception
     */
    private static BufferedImage insertImage(BufferedImage source, String logoPath, boolean needCompress) throws Exception {
        File file = new File(logoPath);
        if (!file.exists()) {
            throw new Exception("logo file not found");
        }
        Image src = ImageIO.read(file);
        int width = src.getWidth(null);
        int height = src.getHeight(null);
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
        //src = ImageOperateUtil.makeRoundBorder(src, src.getWidth(null) / 4, Color.BLUE);
        Graphics2D graph = source.createGraphics();
        //logo放在中心
        int x = (QRCODE_SIZE - width) / 2;
        int y = (QRCODE_SIZE - height) / 2;
        //logo放在右下角
        //int x = QRCODE_SIZE - width;
        //int y = QRCODE_SIZE - height;

        graph.setComposite(AlphaComposite.SrcAtop);
        // 设置颜色
        graph.setColor(Color.GREEN);
        graph.drawImage(src, x, y, width, height, null);
        // 画圆角矩形
        Shape shape = new RoundRectangle2D.Double(x, y, width, height, 6, 6);
        // 控制线条的宽度、笔形样式、线段连接方式或短划线图案
        graph.setStroke(new BasicStroke(3f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
        graph.draw(shape);
        graph.dispose();
        source.flush();
        return source;
    }

    /**
     * 绘制背景图
     *
     * @param source 二维码图
     * @param bgPath 背景图路径
     * @return
     * @throws Exception
     */
    public static BufferedImage drawBackground(BufferedImage source, String bgPath) throws Exception {
        int sW = source.getWidth();
        int sH = source.getHeight();
        File file = new File(bgPath);
        if (!file.exists()) {
            throw new Exception("logo file not found");
        }
        Image src = ImageIO.read(file);
        // 压缩图片大小
        BufferedImage bg = new BufferedImage(QRCODE_SIZE, QRCODE_SIZE, BufferedImage.TYPE_INT_RGB);
        Graphics g = bg.getGraphics();
        g.drawImage(src.getScaledInstance(QRCODE_SIZE, QRCODE_SIZE, Image.SCALE_SMOOTH), 0, 0, null);
        g.dispose();

        Graphics2D graph = bg.createGraphics();
        if (STYLE == 1) {
            // 选择一块区域进行填充
            graph.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 1.0f));
            graph.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            graph.drawImage(source, BGSTARTX, BGSTARTY, sW, sH, null);
        } else {
            // 覆盖方式
            int x = (sW - QRCODE_SIZE) >> 1;
            int y = (sH - QRCODE_SIZE) >> 1;
            // 透明度， 避免看不到背景
            graph.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 0.8f));
            graph.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            graph.drawImage(source, x, y, sW, sH, null);
            graph.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 1.0f));
        }
        graph.dispose();
        bg.flush();
        return bg;
    }

    /**
     * 插入文本
     *
     * @param image 二维码图片
     * @param note  插入的文本描述
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
     * 生成二维码(内嵌LOGO)
     * 二维码文件名随机，文件名可能会有重复
     *
     * @param content      内容
     * @param logoPath     LOGO地址
     * @param destPath     存放目录
     * @param bgPath       背景图地址
     * @param needCompress 是否压缩LOGO
     * @return
     */
    public static String encode(String content, String logoPath, String destPath, boolean needCompress, String bgPath, String note) throws Exception {
        BufferedImage image = QRCodeUtil.createImage(content, logoPath, needCompress, bgPath, note);
        mkdirs(destPath);
        String fileName = UUID.randomUUID().toString() + "." + FORMAT.toLowerCase();
        ImageIO.write(image, FORMAT, new File(destPath + File.separator + fileName));
        return fileName;
    }

    /**
     * 生成二维码(内嵌LOGO) 调用者指定二维码文件名
     *
     * @param content      内容
     * @param logoPath     LOGO地址
     * @param destPath     存放目录
     * @param fileName     二维码文件名
     * @param needCompress 是否压缩LOGO
     * @param bgPath       背景图地址
     * @param note
     * @return
     * @throws Exception
     */
    public static String encode(String content, String logoPath, String destPath, String fileName, boolean needCompress, String bgPath, String note) throws Exception {
        BufferedImage image = QRCodeUtil.createImage(content, logoPath, needCompress, bgPath, note);
        mkdirs(destPath);
        fileName = fileName.substring(0, fileName.indexOf(".") > 0 ? fileName.indexOf(".") : fileName.length()) + "." + FORMAT.toLowerCase();
        ImageIO.write(image, FORMAT, new File(destPath + "/" + fileName));
        return fileName;
    }

    /**
     * 当文件夹不存在时，mkdirs会自动创建多层目录，区别于mkdir．(mkdir如果父目录不存在则会抛出异常)
     *
     * @param destPath
     */
    public static void mkdirs(String destPath) {
        File file = new File(destPath);
        if (!file.exists() && !file.isDirectory()) {
            file.mkdirs();
        }
    }

    /**
     * 生成二维码(内嵌LOGO) + 背景图
     *
     * @param content  内容
     * @param logoPath LOGO地址
     * @param destPath 存储地址
     * @param fileName 二维码文件名
     * @param note     嵌入文字内容
     * @param bgPath   背景图地址
     * @return
     * @throws Exception
     */
    public static String encode(String content, String logoPath, String destPath, String fileName, String bgPath, String note) throws Exception {
        return QRCodeUtil.encode(content, logoPath, destPath, fileName, false, bgPath, note);
    }

    /**
     * 生成二维码(内嵌LOGO) + 背景图
     *
     * @param content  内容
     * @param logoPath LOGO地址
     * @param destPath 存储地址
     * @param note     嵌入文字内容
     * @param bgPath   背景图地址
     * @return
     * @throws Exception
     */
    public static String encode(String content, String logoPath, String destPath, String bgPath, String note) throws Exception {
        return QRCodeUtil.encode(content, logoPath, destPath, false, bgPath, note);
    }

    /**
     * 生成二维码(内嵌LOGO)
     *
     * @param content      内容
     * @param logoPath     LOGO地址
     * @param destPath     存储地址
     * @param note         嵌入文字内容
     * @param fileName     二维码文件名
     * @param needCompress 是否压缩LOGO
     * @return
     * @throws Exception
     */
    public static String encode(String content, String logoPath, String destPath, String fileName, boolean needCompress, String note) throws Exception {
        return QRCodeUtil.encode(content, logoPath, destPath, fileName, needCompress, null, note);
    }

    /**
     * 生成二维码(内嵌LOGO)
     *
     * @param content      内容
     * @param logoPath     LOGO地址
     * @param destPath     存储地址
     * @param bgPath       背景图地址
     * @param needCompress 是否压缩LOGO
     * @return
     * @throws Exception
     */
    public static String encode(String content, String logoPath, String destPath, String bgPath, boolean needCompress) throws Exception {
        return QRCodeUtil.encode(content, logoPath, destPath, needCompress, bgPath, null);
    }

    /**
     * 生成二维码(内嵌LOGO)
     *
     * @param content      内容
     * @param logoPath     LOGO地址
     * @param destPath     存储地址
     * @param note         嵌入文字内容
     * @param needCompress 是否压缩LOGO
     * @return
     * @throws Exception
     */
    public static String encode(String content, String logoPath, String destPath, boolean needCompress, String note) throws Exception {
        return QRCodeUtil.encode(content, logoPath, destPath, needCompress, null, note);
    }

    /**
     * 生成二维码(内嵌LOGO)
     *
     * @param content  内容
     * @param logoPath LOGO地址
     * @param destPath 存储地址
     * @param note     嵌入文字内容
     * @return
     * @throws Exception
     */
    public static String encode(String content, String logoPath, String destPath, String note) throws Exception {
        return QRCodeUtil.encode(content, logoPath, destPath, false, null, note);
    }

    /**
     * 生成二维码
     *
     * @param content      内容
     * @param destPath     存储地址
     * @param logoPath     LOGO地址
     * @param needCompress 是否压缩LOGO
     * @return
     * @throws Exception
     */
    public static String encode(String content, String destPath, String logoPath, boolean needCompress) throws Exception {
        return QRCodeUtil.encode(content, logoPath, destPath, needCompress, null, null);
    }

    /**
     * 生成二维码 + 背景图
     *
     * @param content  内容
     * @param destPath 存储地址
     * @param bgPath   背景图地址
     * @return
     * @throws Exception
     */
    public static String encode(String content, String destPath, String bgPath) throws Exception {
        return QRCodeUtil.encode(content, null, destPath, false, bgPath, null);
    }

    /**
     * 生成二维码
     *
     * @param content  内容
     * @param destPath 存储地址
     * @return
     * @throws Exception
     */
    public static String encode(String content, String destPath) throws Exception {
        return QRCodeUtil.encode(content, null, destPath, false, null, null);
    }

    /**
     * 生成二维码(内嵌LOGO) + 背景
     *
     * @param content      内容
     * @param logoPath     LOGO地址
     * @param outputStream 输出流
     * @param needCompress 是否压缩LOGO
     * @param bgPath       背景图地址
     * @param note         嵌入文字内容
     * @throws Exception
     */
    public static void encode(String content, String logoPath, OutputStream outputStream, boolean needCompress, String bgPath, String note) throws Exception {
        BufferedImage image = QRCodeUtil.createImage(content, logoPath, needCompress, bgPath, note);
        ImageIO.write(image, FORMAT, outputStream);
    }

    /**
     * 生成二维码 + 背景图
     *
     * @param content      内容
     * @param outputStream 输出流
     * @param bgPath       背景图地址
     * @throws Exception
     */
    public static void encode(String content, OutputStream outputStream, String bgPath) throws Exception {
        QRCodeUtil.encode(content, null, outputStream, false, bgPath, null);
    }

    /**
     * 生成二维码(内嵌LOGO)
     *
     * @param content      内容
     * @param outputStream 输出流
     * @param logoPath     LOGO地址
     * @param needCompress 是否压缩
     * @throws Exception
     */
    public static void encode(String content, OutputStream outputStream, String logoPath, boolean needCompress) throws Exception {
        QRCodeUtil.encode(content, logoPath, outputStream, needCompress, null, null);
    }

    /**
     * 生成二维码
     *
     * @param content      内容
     * @param outputStream 输出流
     * @throws Exception
     */
    public static void encode(String content, OutputStream outputStream) throws Exception {
        QRCodeUtil.encode(content, null, outputStream, false, null, null);
    }

    /**
     * 解析二维码
     *
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
     *
     * @param path 二维码图片地址
     * @return
     * @throws IOException
     * @throws NotFoundException
     */
    public static String decode(String path) throws IOException, NotFoundException {
        return QRCodeUtil.decode(new File(path));
    }

    public static void main(String[] args) throws Exception {
        String text = "http://192.168.168.5:9901/app/listensignin/?activityId=68";
        //不含LOGO
        QRCodeUtil.encode(text, null, "E:\\file\\qrcode", true, null);
        //含LOGO，不指定二维码图片
        QRCodeUtil.encode(text, "C:\\Users\\guang\\Desktop\\timg.jpg", "E:\\file\\qrcode", true, "淘美妆商友会");
        //含LOGO，指定二维码图片名
        QRCodeUtil.encode(text, "C:\\Users\\guang\\Desktop\\timg.jpg", "E:\\file\\qrcode", "qrcode", true, "淘美妆商友会");

        //含LOGO，背景图
        QRCodeUtil.encode(text, "C:\\Users\\guang\\Desktop\\timg.jpg", "E:\\file\\qrcode", "C:\\Users\\guang\\Desktop\\logo.jpg", true);
        //背景图
        QRCodeUtil.encode(text, "E:\\file\\qrcode", "C:\\Users\\guang\\Desktop\\logo.jpg");
        //含LOGO，背景图，文本
        QRCodeUtil.encode(text, "C:\\Users\\guang\\Desktop\\timg.jpg", "E:\\file\\qrcode", true, "C:\\Users\\guang\\Desktop\\logo.jpg", "淘美妆商友会");
        //含LOGO，文本
        QRCodeUtil.encode(text, null, "E:\\file\\qrcode", true, null, "淘美妆商友会");
    }
}
