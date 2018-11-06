package com.example.util.common;

import cn.hutool.core.io.resource.ClassPathResource;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.util.Properties;

/**
 * 加载配置文件
 *
 * @author Wei.Guang
 * @create 2018-11-02 10:07
 **/
@Slf4j
public abstract class LoadProperties {

    /**
     * 属性文件对象
     */
    private Properties properties;

    /**
     * 配置文件目录
     */
    private String fileName;

    /**
     * 从properties文件加载
     *
     * @param rootPath
     *            不包含文件名的目录.
     */
    public void loadPropertiesFromPath(String rootPath) {
        if (StringUtils.isNotBlank(rootPath)) {
            log.info("从路径读取配置文件: " + rootPath + File.separator + fileName);
            File file = new File(rootPath + File.separator + fileName);
            InputStream in = null;
            if (file.exists()) {
                try {
                    in = new FileInputStream(file);
                    properties = new Properties();
                    properties.load(in);
                    loadProperties(properties);
                } catch (FileNotFoundException e) {
                    log.error(e.getMessage(), e);
                } catch (IOException e) {
                    log.error(e.getMessage(), e);
                } finally {
                    if (null != in) {
                        try {
                            in.close();
                        } catch (IOException e) {
                            log.error(e.getMessage(), e);
                        }
                    }
                }
            } else {
                // 由于此时可能还没有完成LOG的加载，因此采用标准输出来打印日志信息
                log.error(rootPath + fileName + "不存在,加载参数失败");
            }
        } else {
            loadPropertiesFromSrc();
        }
    }

    /**
     * 从classpath路径下加载配置参数
     */
    public void loadPropertiesFromSrc() {
        InputStream in = null;
        try {
            log.info("从classpath: " + LoadProperties.class.getClassLoader().getResource("").getPath() + " 获取属性文件：" + fileName);
            in = new ClassPathResource(fileName).getStream();
            if (null != in) {
                properties = new Properties();
                try {
                    properties.load(in);
                } catch (IOException e) {
                    throw e;
                }
            } else {
                log.error(fileName + "属性文件未能在classpath指定的目录下 " + LoadProperties.class.getClassLoader().getResource("").getPath() + " 找到!");
                return;
            }
            loadProperties(properties);
        } catch (IOException e) {
            log.error(e.getMessage(), e);
        } finally {
            if (null != in) {
                try {
                    in.close();
                } catch (IOException e) {
                    log.error(e.getMessage(), e);
                }
            }
        }
    }

    /**
     * 加载配置文件
     * @param pro
     */
    public abstract void loadProperties(Properties pro);

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
