package com.example.util.image;

import java.awt.*;
import java.awt.image.BufferedImage;

/**
 * 修复水印图片小于目标图片时，不缩放
 *
 * @author Wei.Guang
 * @create 2018-09-05 11:04
 **/
public class Watermark {

    /**
     * The position of the watermark.
     */
    private final Position position;

    /**
     * The watermark image.
     */
    private BufferedImage watermarkImg;

    /**
     * The opacity of the watermark.
     */
    private final float opacity;

    /**
     * Instantiates a filter which applies a watermark to an image.
     *
     * @param position     The position of the watermark.
     * @param watermarkImg The watermark image.
     * @param opacity      The opacity of the watermark.
     *                     <p>
     *                     The value should be between {@code 0.0f} and {@code 1.0f},
     *                     where {@code 0.0f} is completely transparent, and {@code 1.0f}
     *                     is completely opaque.
     */
    public Watermark(Position position, BufferedImage watermarkImg, float opacity) {
        if (position == null) {
            throw new NullPointerException("Position is null.");
        }
        if (watermarkImg == null) {
            throw new NullPointerException("Watermark image is null.");
        }
        if (opacity > 1.0f || opacity < 0.0f) {
            throw new IllegalArgumentException("Opacity is out of range of " + "between 0.0f and 1.0f.");
        }

        this.position = position;
        this.watermarkImg = watermarkImg;
        this.opacity = opacity;
    }

    public BufferedImage apply(BufferedImage img) {
        int width = img.getWidth();
        int height = img.getHeight();

        this.resize(width, height);

        BufferedImage imgWithWatermark = Utils.createImage(img, width, height, null);

        int watermarkWidth = watermarkImg.getWidth();
        int watermarkHeight = watermarkImg.getHeight();

        Point p = position.calculate(width, height, watermarkWidth, watermarkHeight, 0, 0, 0, 0);

        Graphics2D g = imgWithWatermark.createGraphics();

        // Draw the actual image.
        g.drawImage(img, 0, 0, null);

        // Draw the watermark on top.
        g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, opacity));

        g.drawImage(watermarkImg, p.x, p.y, null);

        g.dispose();

        return imgWithWatermark;
    }

    private int[] resize(int width, int height) {
        int wmwidth = this.watermarkImg.getWidth();
        int wmheight = this.watermarkImg.getHeight();

        int drawWidth = width;
        int drawHeight = height;
        double sourceRatio = (double) wmwidth / (double) wmheight;
        double targetRatio = (double) width / (double) height;

        if (wmwidth <= drawWidth && wmheight <= drawHeight) {
            drawWidth = wmwidth;
            drawHeight = wmheight;
        } else if (Double.compare(sourceRatio, targetRatio) != 0) {
            if (sourceRatio > targetRatio) {
                // drawHeight = (int) Math.round(wmwidth / sourceRatio);
                drawHeight = (int) (drawWidth * wmheight / wmwidth);
            } else {
                // drawWidth = (int) Math.round(wmheight * sourceRatio);
                drawWidth = wmwidth * drawHeight / wmheight;
            }
        }
        this.watermarkImg = Utils.createImage(this.watermarkImg, drawWidth, drawHeight, null);
        int[] size = {drawWidth, drawHeight};
        return size;
    }
}
