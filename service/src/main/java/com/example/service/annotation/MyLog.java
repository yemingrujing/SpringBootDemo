package com.example.service.annotation;

import java.lang.annotation.*;

/**
 * 日志类
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface MyLog {
    String value() default "";
}
