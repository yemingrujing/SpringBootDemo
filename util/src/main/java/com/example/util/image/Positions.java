package com.example.util.image;

import java.awt.*;

/**
 * 添加水印
 *
 * @author Wei.Guang
 * @create 2018-09-05 11:01
 **/
public enum Positions implements Position {
    /**
     * Calculates the {@link Point} at which an enclosed image should be placed
     * if it is to be placed at the top left-hand corner of the enclosing
     * image.
     */
    TOP_LEFT() {
        @Override
        public Point calculate(int enclosingWidth, int enclosingHeight,
                               int width, int height, int insetLeft, int insetRight,
                               int insetTop, int insetBottom) {
            int x = insetLeft;
            int y = insetTop;
            return new Point(x, y);
        }
    },

    /**
     * Calculates the {@link Point} at which an enclosed image should be placed
     * if it is to be horizontally centered at the top of the enclosing image.
     */
    TOP_CENTER() {
        @Override
        public Point calculate(int enclosingWidth, int enclosingHeight,
                               int width, int height, int insetLeft, int insetRight,
                               int insetTop, int insetBottom) {
            int x = (enclosingWidth / 2) - (width / 2);
            int y = insetTop;
            return new Point(x, y);
        }
    },

    /**
     * Calculates the {@link Point} at which an enclosed image should be placed
     * if it is to be placed at the top right-hand corner of the enclosing
     * image.
     */
    TOP_RIGHT() {
        @Override
        public Point calculate(int enclosingWidth, int enclosingHeight,
                               int width, int height, int insetLeft, int insetRight,
                               int insetTop, int insetBottom) {
            int x = enclosingWidth - width - insetRight;
            int y = insetTop;
            return new Point(x, y);
        }
    },

    /**
     * Calculates the {@link Point} at which an enclosed image should be placed
     * if it is to be placed vertically centered at the left-hand corner of
     * the enclosing image.
     */
    CENTER_LEFT() {
        @Override
        public Point calculate(int enclosingWidth, int enclosingHeight,
                               int width, int height, int insetLeft, int insetRight,
                               int insetTop, int insetBottom) {
            int x = insetLeft;
            int y = (enclosingHeight / 2) - (height / 2);
            return new Point(x, y);
        }
    },

    /**
     * Calculates the {@link Point} at which an enclosed image should be placed
     * horizontally and vertically centered in the enclosing image.
     */
    CENTER() {
        @Override
        public Point calculate(int enclosingWidth, int enclosingHeight,
                               int width, int height, int insetLeft, int insetRight,
                               int insetTop, int insetBottom) {
            int x = (enclosingWidth / 2) - (width / 2);
            int y = (enclosingHeight / 2) - (height / 2);
            return new Point(x, y);
        }
    },

    /**
     * Calculates the {@link Point} at which an enclosed image should be placed
     * if it is to be placed vertically centered at the right-hand corner of
     * the enclosing image.
     */
    CENTER_RIGHT() {
        @Override
        public Point calculate(int enclosingWidth, int enclosingHeight,
                               int width, int height, int insetLeft, int insetRight,
                               int insetTop, int insetBottom) {
            int x = enclosingWidth - width - insetRight;
            int y = (enclosingHeight / 2) - (height / 2);
            return new Point(x, y);
        }
    },

    /**
     * Calculates the {@link Point} at which an enclosed image should be placed
     * if it is to be placed at the bottom left-hand corner of the enclosing
     * image.
     */
    BOTTOM_LEFT() {
        @Override
        public Point calculate(int enclosingWidth, int enclosingHeight,
                               int width, int height, int insetLeft, int insetRight,
                               int insetTop, int insetBottom) {
            int x = insetLeft;
            int y = enclosingHeight - height - insetBottom;
            return new Point(x, y);
        }
    },

    /**
     * Calculates the {@link Point} at which an enclosed image should be placed
     * if it is to be horizontally centered at the bottom of the enclosing
     * image.
     */
    BOTTOM_CENTER() {
        @Override
        public Point calculate(int enclosingWidth, int enclosingHeight,
                               int width, int height, int insetLeft, int insetRight,
                               int insetTop, int insetBottom) {
            int x = (enclosingWidth / 2) - (width / 2);
            int y = enclosingHeight - height - insetBottom;
            return new Point(x, y);
        }
    },

    /**
     * Calculates the {@link Point} at which an enclosed image should be placed
     * if it is to be placed at the bottom right-hand corner of the enclosing
     * image.
     */
    BOTTOM_RIGHT() {
        @Override
        public Point calculate(int enclosingWidth, int enclosingHeight,
                               int width, int height, int insetLeft, int insetRight,
                               int insetTop, int insetBottom) {
            int x = enclosingWidth - width - insetRight;
            int y = enclosingHeight - height - insetBottom;
            return new Point(x, y);
        }
    },
    ;
}
