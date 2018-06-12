package com.example.config;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.util.Properties;

/**
 * Kaptcha验证码生成配置
 *
 * @author Wei.Guang
 * @create 2018-06-12 15:03
 **/
@Component
public class KaptchaConfig {

    /**
     *
     * @return
     */
    @Bean
    public DefaultKaptcha getDefaultKaptcha() {
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        Properties properties = new Properties();
        //图片边框
        properties.setProperty("kaptcha.border", "yes");
        //边框颜色
        properties.setProperty("kaptcha.border.color", "105,179,90");
        //字体颜色，合法值： r,g,b  或者 white,black,blue.
        properties.setProperty("kaptcha.textproducer.font.color", "blue");
        //图片宽
        properties.setProperty("kaptcha.image.width", "110");
        //图片高
        properties.setProperty("kaptcha.image.height", "40");
        //session key
        properties.setProperty("kaptcha.session.key", "code");
        //图片样式
        properties.setProperty("kaptcha.obscurificator.impl", "com.google.code.kaptcha.impl.WaterRipple");
        //字体大小
        properties.setProperty("kaptcha.textproducer.font.size", "30");
        //文字间隔
        properties.setProperty("kaptcha.textproducer.char.length", "4");
        //字体
        properties.setProperty("kaptcha.textproducer.font.names", "宋体,楷体,微软雅黑");
        Config config = new Config(properties);
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }
}
