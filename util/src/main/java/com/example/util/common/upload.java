package com.example.util.common;

import org.apache.commons.io.IOUtils;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;

/**
 * 图片上传
 *
 * @author Wei.Guang
 * @create 2018-08-09 11:47
 **/
public class upload {
    /**
     * 根据url上传图片
     *
     * @param url
     * @param path
     * @return
     */
    public static String urlUpload(String imageUrl, String path, String imageName) throws IOException {
        if (StringUtil.isBlank(imageUrl)) {
            imageUrl = "http://wx3.sinaimg.cn/mw690/0066IjKzly1fmwbygz9x7j30j50q7my3.jpg";
        }
        // 构造URL
        URL url = new URL(imageUrl);
        // 打开连接
        URLConnection conn = url.openConnection();
        // 设置请求超时为5s
        conn.setConnectTimeout(5 * 1000);
        // 通过输入流获取图片数据
        InputStream ds = new DataInputStream(conn.getInputStream());
        // 文件夹不存在，创建
        File sf = new File(path);
        if (!sf.exists()) {
            sf.mkdirs();
        }
        // 文件名称
        String fileName = imageName + ".jpg";
        // 定义上传路径
        String tarpath = sf.getPath() + "\\" + fileName;
        OutputStream os = new FileOutputStream(tarpath);
        os.write(saveImage(ds, tarpath));
        IOUtils.close(conn);
        ds.close();
        // 关闭输出流
        os.close();
        return tarpath;
    }

    /**
     * 保存图片到服务器
     *
     * @param is
     * @param tarpath
     */
    private static byte[] saveImage(InputStream is, String tarpath) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int length = 0;
        // 使用一个输入流从buffer里把数据读取出来
        while ((length = is.read(buffer)) != -1) {
            // 用输出流往buffer里写入数据，中间参数代表从哪个位置开始读，len代表读取的长度
            output.write(buffer, 0, length);
        }
        output.close();
        // 把outStream里的数据写入内存
        return output.toByteArray();
    }
}
