package com.example.util.common.videoTOgif;

import com.madgag.gif.fmsware.AnimatedGifEncoder;
import com.madgag.gif.fmsware.GifDecoder;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageInputStream;
import javax.imageio.stream.ImageOutputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;

/**
 * 图像裁剪以及压缩处理工具类
 *
 * @author Wei.Guang
 * @create 2018-10-25 9:11
 **/
public class ImageUtil {

    public enum IMAGE_FORMAT {
        BMP("bmp"),
        JPG("jpg"),
        WBMP("wbmp"),
        JPEG("jpeg"),
        PNG("png"),
        GIF("gif");

        private String value;

        IMAGE_FORMAT(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }


    /**
     * 获取图片格式
     *
     * @param file 图片文件
     * @return 图片格式
     */
    public static String getImageFormatName(File file) throws IOException {
        String formatName = null;

        ImageInputStream iis = ImageIO.createImageInputStream(file);
        Iterator<ImageReader> imageReader = ImageIO.getImageReaders(iis);
        if (imageReader.hasNext()) {
            ImageReader reader = imageReader.next();
            formatName = reader.getFormatName();
        }

        return formatName;
    }

    /*************************  基于三方包解决方案    *****************************/
    /**
     * 剪切图片
     *
     * @param sourcePath     待剪切图片路径
     * @param targetPath 裁剪后保存路径（默认为源路径）
     * @param x          起始横坐标
     * @param y          起始纵坐标
     * @param width      剪切宽度
     * @param height     剪切高度
     * @throws IOException
     * @returns 裁剪后保存路径（图片后缀根据图片本身类型生成）
     */
    public static String cutImage(String sourcePath, String targetPath, int x, int y, int width, int height) throws IOException {
        File file = new File(sourcePath);
        if (!file.exists()) {
            throw new IOException("not found the image：" + sourcePath);
        }
        if (null == targetPath || targetPath.isEmpty()) targetPath = sourcePath;

        String formatName = getImageFormatName(file);
        if (null == formatName) return targetPath;
        formatName = formatName.toLowerCase();

        // 防止图片后缀与图片本身类型不一致的情况
        String pathPrefix = getPathWithoutSuffix(targetPath);
        targetPath = pathPrefix + formatName;

        // GIF需要特殊处理
        if (IMAGE_FORMAT.GIF.getValue() == formatName) {
            GifDecoder decoder = new GifDecoder();
            int status = decoder.read(sourcePath);
            if (status != GifDecoder.STATUS_OK) {
                throw new IOException("read image " + sourcePath + " error!");
            }

            AnimatedGifEncoder encoder = new AnimatedGifEncoder();
            encoder.start(targetPath);
            encoder.setRepeat(decoder.getLoopCount());
            for (int i = 0; i < decoder.getFrameCount(); i++) {
                encoder.setDelay(decoder.getDelay(i));
                BufferedImage childImage = decoder.getFrame(i);
                BufferedImage image = childImage.getSubimage(x, y, width, height);
                encoder.addFrame(image);
            }
            encoder.finish();
        } else {
            BufferedImage image = ImageIO.read(file);
            image = image.getSubimage(x, y, width, height);
            ImageIO.write(image, formatName, new File(targetPath));
        }
        //普通图片
        BufferedImage image = ImageIO.read(file);
        image = image.getSubimage(x, y, width, height);
        ImageIO.write(image, formatName, new File(targetPath));

        return targetPath;
    }

    /**
     * 压缩图片
     *
     * @param sourcePath 待压缩的图片路径
     * @param targetPath 压缩后图片路径（默认为初始路径）
     * @param width      压缩宽度
     * @param height     压缩高度
     * @throws IOException
     * @returns 裁剪后保存路径（图片后缀根据图片本身类型生成）
     */
    public static String zoom(String sourcePath, String targetPath, int width, int height) throws IOException {
        File file = new File(sourcePath);
        if (!file.exists()) {
            throw new IOException("not found the image ：" + sourcePath);
        }
        if (null == targetPath || targetPath.isEmpty()) targetPath = sourcePath;

        String formatName = getImageFormatName(file);
        if (null == formatName) return targetPath;
        formatName = formatName.toLowerCase();

        // 防止图片后缀与图片本身类型不一致的情况
        String pathPrefix = getPathWithoutSuffix(targetPath);
        targetPath = pathPrefix + formatName;

        // GIF需要特殊处理
        if (IMAGE_FORMAT.GIF.getValue() == formatName) {
            GifDecoder decoder = new GifDecoder();
            int status = decoder.read(sourcePath);
            if (status != GifDecoder.STATUS_OK) {
                throw new IOException("read image " + sourcePath + " error!");
            }

            AnimatedGifEncoder encoder = new AnimatedGifEncoder();
            encoder.start(targetPath);
            encoder.setRepeat(decoder.getLoopCount());
            for (int i = 0; i < decoder.getFrameCount(); i++) {
                encoder.setDelay(decoder.getDelay(i));
                BufferedImage image = zoom(decoder.getFrame(i), width, height);
                encoder.addFrame(image);
            }
            encoder.finish();
        } else {
            BufferedImage image = ImageIO.read(file);
            BufferedImage zoomImage = zoom(image, width, height);
            ImageIO.write(zoomImage, formatName, new File(targetPath));
        }
        BufferedImage image = ImageIO.read(file);
        BufferedImage zoomImage = zoom(image, width, height);
        ImageIO.write(zoomImage, formatName, new File(targetPath));

        return targetPath;
    }

    /*********************** 基于JDK 解决方案     ********************************/

    /**
     * 读取图片
     *
     * @param file 图片文件
     * @return 图片数据
     * @throws IOException
     */
    public static BufferedImage[] readerImage(File file) throws IOException {
        BufferedImage sourceImage = ImageIO.read(file);
        BufferedImage[] images = null;
        ImageInputStream iis = ImageIO.createImageInputStream(file);
        Iterator<ImageReader> imageReaders = ImageIO.getImageReaders(iis);
        if (imageReaders.hasNext()) {
            ImageReader reader = imageReaders.next();
            reader.setInput(iis);
            int imageNumber = reader.getNumImages(true);
            images = new BufferedImage[imageNumber];
            for (int i = 0; i < imageNumber; i++) {
                BufferedImage image = reader.read(i);
                if (sourceImage.getWidth() > image.getWidth() || sourceImage.getHeight() > image.getHeight()) {
                    image = zoom(image, sourceImage.getWidth(), sourceImage.getHeight());
                }
                images[i] = image;
            }
            reader.dispose();
            iis.close();
        }
        return images;
    }

    /**
     * 根据要求处理图片
     *
     * @param images 图片数组
     * @param x      横向起始位置
     * @param y      纵向起始位置
     * @param width  宽度
     * @param height 宽度
     * @return 处理后的图片数组
     * @throws Exception
     */
    public static BufferedImage[] processImage(BufferedImage[] images, int x, int y, int width, int height) throws Exception {
        if (null == images) {
            return images;
        }
        BufferedImage[] oldImages = images;
        images = new BufferedImage[images.length];
        for (int i = 0; i < oldImages.length; i++) {
            BufferedImage image = oldImages[i];
            images[i] = image.getSubimage(x, y, width, height);
        }
        return images;
    }

    /**
     * 写入处理后的图片到file
     * <p>
     * 图片后缀根据图片格式生成
     *
     * @param images     处理后的图片数据
     * @param formatName 图片格式
     * @param file       写入文件对象
     * @throws Exception
     */
    public static void writerImage(BufferedImage[] images, String formatName, File file) throws Exception {
        Iterator<ImageWriter> imageWriters = ImageIO.getImageWritersByFormatName(formatName);
        if (imageWriters.hasNext()) {
            ImageWriter writer = imageWriters.next();
            String fileName = file.getName();
            int index = fileName.lastIndexOf(".");
            if (index > 0) {
                fileName = fileName.substring(0, index + 1) + formatName;
            }
            String pathPrefix = getFilePrefixPath(file.getPath());
            File outFile = new File(pathPrefix + fileName);
            ImageOutputStream ios = ImageIO.createImageOutputStream(outFile);
            writer.setOutput(ios);

            if (writer.canWriteSequence()) {
                writer.prepareWriteSequence(null);
                for (int i = 0; i < images.length; i++) {
                    BufferedImage childImage = images[i];
                    IIOImage image = new IIOImage(childImage, null, null);
                    writer.writeToSequence(image, null);
                }
                writer.endWriteSequence();
            } else {
                for (int i = 0; i < images.length; i++) {
                    writer.write(images[i]);
                }
            }

            writer.dispose();
            ios.close();
        }
    }

    /**
     * 剪切格式图片
     * <p>
     * 基于JDK Image I/O解决方案
     *
     * @param sourceFile 待剪切图片文件对象
     * @param destFile   裁剪后保存文件对象
     * @param x          剪切横向起始位置
     * @param y          剪切纵向起始位置
     * @param width      剪切宽度
     * @param height     剪切宽度
     * @throws Exception
     */
    public static void cutImage(File sourceFile, File destFile, int x, int y, int width, int height) throws Exception {
        // 读取图片信息
        BufferedImage[] images = readerImage(sourceFile);
        // 处理图片
        images = processImage(images, x, y, width, height);
        // 获取文件后缀
        String formatName = getImageFormatName(sourceFile);
        destFile = new File(getPathWithoutSuffix(destFile.getPath()) + formatName);

        // 写入处理后的图片到文件
        writerImage(images, formatName, destFile);
    }


    /**
     * 获取系统支持的图片格式
     */
    public static void getOSSupportsStandardImageFormat() {
        String[] readerFormatName = ImageIO.getReaderFormatNames();
        String[] readerSuffixName = ImageIO.getReaderFileSuffixes();
        String[] readerMIMEType = ImageIO.getReaderMIMETypes();
        System.out.println("========================= OS supports reader ========================");
        System.out.println("OS supports reader format name :  " + Arrays.asList(readerFormatName));
        System.out.println("OS supports reader suffix name :  " + Arrays.asList(readerSuffixName));
        System.out.println("OS supports reader MIME type :  " + Arrays.asList(readerMIMEType));

        String[] writerFormatName = ImageIO.getWriterFormatNames();
        String[] writerSuffixName = ImageIO.getWriterFileSuffixes();
        String[] writerMIMEType = ImageIO.getWriterMIMETypes();

        System.out.println("========================= OS supports writer ========================");
        System.out.println("OS supports writer format name :  " + Arrays.asList(writerFormatName));
        System.out.println("OS supports writer suffix name :  " + Arrays.asList(writerSuffixName));
        System.out.println("OS supports writer MIME type :  " + Arrays.asList(writerMIMEType));
    }

    /**
     * 压缩图片
     *
     * @param sourceImage 待压缩图片
     * @param width       压缩图片高度
     * @param height       压缩图片宽度
     */
    private static BufferedImage zoom(BufferedImage sourceImage, int width, int height) {
        BufferedImage zoomImage = new BufferedImage(width, height, sourceImage.getType());
        Image image = sourceImage.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        Graphics gc = zoomImage.getGraphics();
        gc.setColor(Color.WHITE);
        gc.drawImage(image, 0, 0, null);
        return zoomImage;
    }

    /**
     * 获取某个文件的前缀路径
     * <p>
     * 不包含文件名的路径
     *
     * @param file 当前文件对象
     * @return
     * @throws IOException
     */
    public static String getFilePrefixPath(File file) throws IOException {
        String path = null;
        if (!file.exists()) {
            throw new IOException("not found the file !");
        }
        String fileName = file.getName();
        path = file.getPath().replace(fileName, "");
        return path;
    }

    /**
     * 获取某个文件的前缀路径
     * <p>
     * 不包含文件名的路径
     *
     * @param path 当前文件路径
     * @return 不包含文件名的路径
     * @throws Exception
     */
    public static String getFilePrefixPath(String path) throws Exception {
        if (null == path || path.isEmpty()) throw new Exception("文件路径为空！");
        int index = path.lastIndexOf(File.separator);
        if (index > 0) {
            path = path.substring(0, index + 1);
        }
        return path;
    }

    /**
     * 获取不包含后缀的文件路径
     *
     * @param src
     * @return
     */
    public static String getPathWithoutSuffix(String src) {
        String path = src;
        int index = path.lastIndexOf(".");
        if (index > 0) {
            path = path.substring(0, index + 1);
        }
        return path;
    }

    /**
     * 获取文件名
     *
     * @param filePath 文件路径
     * @return 文件名
     * @throws IOException
     */
    public static String getFileName(String filePath) throws IOException {
        File file = new File(filePath);
        if (!file.exists()) {
            throw new IOException("not found the file !");
        }
        return file.getName();
    }

    /**
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception {
        // 获取系统支持的图片格式
        //ImageCutterUtil.getOSSupportsStandardImageFormat();

        try {
            // 起始坐标，剪切大小
            int x = 100;
            int y = 75;
            int width = 100;
            int height = 100;
            // 参考图像大小
            int clientWidth = 300;
            int clientHeight = 250;


            File file = new File("C:\\1.jpg");
            BufferedImage image = ImageIO.read(file);
            double destWidth = image.getWidth();
            double destHeight = image.getHeight();

            if (destWidth < width || destHeight < height)
                throw new Exception("源图大小小于截取图片大小!");

            double widthRatio = destWidth / clientWidth;
            double heightRatio = destHeight / clientHeight;

            x = Double.valueOf(x * widthRatio).intValue();
            y = Double.valueOf(y * heightRatio).intValue();
            width = Double.valueOf(width * widthRatio).intValue();
            height = Double.valueOf(height * heightRatio).intValue();

            System.out.println("裁剪大小  x:" + x + ",y:" + y + ",width:" + width + ",height:" + height);

            /************************ 基于三方包解决方案 *************************/
            String formatName = getImageFormatName(file);
            String pathSuffix = "." + formatName;
            String pathPrefix = getFilePrefixPath(file);
            String targetPath = pathPrefix + System.currentTimeMillis() + pathSuffix;
            targetPath = ImageUtil.cutImage(file.getPath(), targetPath, x, y, width, height);

            String bigTargetPath = pathPrefix + System.currentTimeMillis() + pathSuffix;
            ImageUtil.zoom(targetPath, bigTargetPath, 100, 100);

            String smallTargetPath = pathPrefix + System.currentTimeMillis() + pathSuffix;
            ImageUtil.zoom(targetPath, smallTargetPath, 50, 50);

            /************************ 基于JDK Image I/O 解决方案(JDK探索失败) *************************/
//	            File destFile = new File(targetPath);
//	            ImageCutterUtil.cutImage(file, destFile, x, y, width, height);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
