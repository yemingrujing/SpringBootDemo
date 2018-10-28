package com.example.controller.pay;

import com.example.service.pay.AlipayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

/**
 * 蚂蚁金服支付
 *
 * @author Wei.Guang
 * @create 2018-10-17 11:40
 **/
@RestController
public class AlipayController {

    @Autowired
    private AlipayService alipayService;

    /**
     * 手机网页支付
     * @param response
     */
    @PostMapping(value = "/pay/alibaba/wapPay")
    public void wapPay(HttpServletResponse response) {
        alipayService.wapPay(response);
    }
}
