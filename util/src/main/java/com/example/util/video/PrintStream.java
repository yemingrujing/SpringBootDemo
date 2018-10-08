package com.example.util.video;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author Wei.Guang
 * @create 2018-09-06 14:47
 **/
public class PrintStream extends Thread {
    InputStream _is = null;

    public PrintStream(InputStream is) {
        _is = is;
    }

    @Override
    public void run() {
        try {
            while (this != null) {
                int _ch = _is.read();
                if (_ch != -1) {
                    System.out.println((char) _ch);
                } else {
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
