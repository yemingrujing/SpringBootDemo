package com.example.util.common.videoTOgif;

import com.madgag.gif.fmsware.AnimatedGifEncoder;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.Java2DFrameConverter;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/**
 * 从视频中获截帧生成静态图与GIF，图片旋转
 * javacv-platform用1.4.1版本，更高版本生成gif存在问题，暂时没有解决
 *
 * @author Wei.Guang
 * @create 2018-10-24 14:38
 **/
public class ViedoToGIf {

    /**
     * 截取视频指定帧生成gif
     * @param videofile 视频文件
     * @param startFrame 开始帧
     * @param frameCount 截取帧数
     * @param frameRate 帧频率（默认：3）
     * @param margin 每截取一次跳过多少帧（默认：3）
     * @throws IOException
     */
    public static void buildGIf(String videofile, Integer startFrame, Integer frameCount, Integer frameRate, Integer margin) throws IOException {
        OutputStream targetFile = new FileOutputStream(videofile.substring(0, videofile.lastIndexOf(".")) + ".gif");
        FFmpegFrameGrabber ff = FFmpegFrameGrabber.createDefault(videofile);
        Java2DFrameConverter converter = new Java2DFrameConverter();
        ff.start();
        if (margin == null) {
            margin = 3;
        }
        if (frameRate == null) {
            frameRate = 3;
        }
        if (startFrame == null) {
            startFrame = 0;
        }
        if (frameCount == null) {
            frameCount = ff.getLengthInFrames() - startFrame;
        }
        try {
            if (startFrame > ff.getLengthInFrames() & (startFrame + frameCount) > ff.getLengthInFrames()) {
                throw new RuntimeException("视频太短了");
            }
            ff.setFrameNumber(startFrame);
            AnimatedGifEncoder en = new AnimatedGifEncoder();
            en.setFrameRate(frameRate);
            en.start(targetFile);
            // 设置gif图无限循环播放，默认为1(只播放一次)，0无限循环
            en.setRepeat(0);
            for (int i = 0; i < frameCount; i++) {
                BufferedImage g = converter.convert(ff.grabFrame());
                if (g == null) {
                    break;
                }
                BufferedImage image = zoom(g, 200, 120);
                en.addFrame(image);
                ff.setFrameNumber(ff.getFrameNumber() + margin);
            }
            en.finish();
        } finally {
            ff.stop();
            ff.close();
        }
    }

    /**
     * 截取视频指定帧保存为指定格式的图片（图片保存在视频同文件夹下）
     * @param videoFile 视频地址
     * @param imgSuffix 图片格式
     * @param indexFrame 第几帧（默认：5）
     * @throws Exception
     */
    public static void fetchFrame(String videoFile, String imgSuffix, Integer indexFrame) throws Exception {
        if (indexFrame == null) {
            indexFrame = 5;
        }
        FFmpegFrameGrabber ff = new FFmpegFrameGrabber(videoFile);
        ff.start();
        try {
            int length = ff.getLengthInFrames();
            int i = 0;
            Frame f = null;
            while (i < length) {
                f = ff.grabFrame();
                if ((i > indexFrame) && (f.image != null)) {
                    break;
                }
                i++;
            }
            int oWidth = f.imageWidth;
            int oHeight = f.imageHeight;
            int width = 800;
            int height = (width / oWidth) * oHeight;
            Java2DFrameConverter converter = new Java2DFrameConverter();
            BufferedImage fetchedImage = converter.getBufferedImage(f);
            BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
            bi.getGraphics().drawImage(fetchedImage.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);
            bi = rotateImage(bi, 90);
            File targerFile = new File(videoFile.substring(0, videoFile.lastIndexOf(".")) + imgSuffix);
            ImageIO.write(bi, "jpg", targerFile);
        } finally {
            ff.stop();
            ff.close();
        }
    }

    /**
     * 将图片旋转指定度
     * @param bufferedImage 图片
     * @param degree 旋转角度
     * @return
     */
    public static BufferedImage rotateImage(BufferedImage bufferedImage, int degree){
        // 得到图片宽度。
        int w= bufferedImage.getWidth();
        // 得到图片高度。
        int h= bufferedImage.getHeight();
        // 得到图片透明度。
        int type= bufferedImage.getColorModel().getTransparency();
        // 空的图片。
        BufferedImage img;
        // 空的画笔。
        Graphics2D graphics2d;
        (graphics2d= (img= new BufferedImage(w, h, type))
                .createGraphics()).setRenderingHint(
                RenderingHints.KEY_INTERPOLATION,
                RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        // 旋转，degree是整型，度数，比如垂直90度。
        graphics2d.rotate(Math.toRadians(degree), w / 2, h / 2);
        // 从bufferedimagecopy图片至img，0,0是img的坐标。
        graphics2d.drawImage(bufferedImage, 0, 0, null);
        graphics2d.dispose();
        // 返回复制好的图片，原图片依然没有变，没有旋转，下次还可以使用。
        return img;
    }

    /**
     * 压缩图片
     * @param sourceImage    待压缩图片
     * @param width          压缩图片高度
     * @param heigt          压缩图片宽度
     */
    private static BufferedImage zoom(BufferedImage sourceImage , int width , int height){
        BufferedImage zoomImage = new BufferedImage(width, height, sourceImage.getType());
        Image image = sourceImage.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        Graphics gc = zoomImage.getGraphics();
        gc.setColor(Color.WHITE);
        gc.drawImage(image , 0, 0, null);
        return zoomImage;
    }

    public static void main(String[] args) throws IOException {
        buildGIf("E:\\file\\video\\test.mp4", 3, null, 10, 2);
    }
}
