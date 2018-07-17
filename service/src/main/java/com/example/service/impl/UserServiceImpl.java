package com.example.service.impl;

import com.alibaba.fastjson.JSON;
import com.example.base.dto.UserDTO;
import com.example.base.login.User;
import com.example.mapper.login.UserMapper;
import com.example.service.UserService;
import com.example.util.excel.FileUtil;
import com.example.util.service.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author Wei.Guang
 * @create 2018-07-11 9:57
 **/
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void export(HttpServletResponse response) {
       List<User> list = userMapper.findAll();
       List<UserDTO> userDTOS = JSON.parseArray(JSON.toJSONString(list), UserDTO.class);
       FileUtil.exportExcels(userDTOS, "用户列表", "sheet1", UserDTO.class, "用户.xlsx", response);
    }


    @Override
    public void importExcel(MultipartFile file) {
        List<UserDTO> userDTOS = FileUtil.importExcel(file, 1, 1, UserDTO.class);
        System.out.println("导入数据一共【" + userDTOS.size() + "】行");
    }

    @Override
    public void exportTwo(HttpServletResponse response) {

    }

    @Override
    public void importExcelTwo(MultipartFile file, HttpServletRequest request) {

    }
}
