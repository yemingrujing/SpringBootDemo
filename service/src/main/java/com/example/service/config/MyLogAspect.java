package com.example.service.config;

import com.example.service.annotation.MyLogAnnotation;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * 日志切面类
 *
 * @author Wei.Guang
 * @create 2018-08-12 13:58
 **/
@Aspect
@Component
public class MyLogAspect {

    @Pointcut("@annotation(com.example.service.annotation.MyLogAnnotation)")
    public void logPointCut() {

    }

    @Before("logPointCut()")
    public void before(JoinPoint joinPoint) {
        MethodSignature sign = (MethodSignature) joinPoint.getSignature();
        Method method = sign.getMethod();
        System.out.println("接受方法：" + method.getName() + "前置日志");

        MyLogAnnotation logAnnotation = method.getAnnotation(MyLogAnnotation.class);
        if (logAnnotation != null) {
            System.out.println(logAnnotation.value());
        }
    }
}
