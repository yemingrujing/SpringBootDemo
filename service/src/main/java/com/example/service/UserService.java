package com.example.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Wei.Guang
 * @create 2018-07-11 9:56
 **/
public interface UserService {

    /**
     * 导出
     * @param response
     */
    void export(HttpServletResponse response);

    /**
     * 导入
     */
    void importExcel(MultipartFile file);

    /**
     * 导出
     * @param response
     */
    void exportTwo(HttpServletResponse response);

    /**
     * 导入
     */
    void importExcelTwo(MultipartFile file, HttpServletRequest request);
}
