package com.example.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试
 *
 * @author Wei.Guang
 * @create 2018-06-04 10:01
 **/
@RestController
@RequestMapping("/test")
public class Test {

    @RequestMapping("/")
    public String helloWorld(){
        return "Hello World!";
    }
}
