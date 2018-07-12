package com.example.controller;

import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Wei.Guang
 * @create 2018-07-11 11:07
 **/
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = {""}, method = RequestMethod.GET)
    public String user(Model model) {
        return "user";
    }

    @RequestMapping(value = {"/export"}, method = RequestMethod.GET)
    public void export(HttpServletResponse response) {
        userService.export(response);
    }

    @RequestMapping(value = {"/import"}, method = RequestMethod.POST)
    @ResponseBody
    public void importExcel(@RequestParam("filename") MultipartFile filename) {
        userService.importExcel(filename);
    }
}
