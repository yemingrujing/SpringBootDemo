package com.example.controller.order;

import com.alibaba.fastjson.JSON;
import com.example.util.common.DateUtil;
import com.example.util.common.StringUtil;
import com.example.util.common.invoice.HttpClientCallSoapUtil;
import com.example.util.common.invoice.nuonuo.InvoiceMethodEnum;
import com.example.util.common.invoice.nuonuo.InvoiceParam;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 诺诺发票请求开发
 *
 * @author Wei.Guang
 * @create 2018-11-28 10:40
 **/
@RestController
public class NuoNFPController {

    /**
     * 开票请求接口地址
     */
    public static final String FPKJURL = "https://nnfpdev.jss.com.cn/shop/buyer/allow/cxfKp/cxfServerKpOrderSync.action";

    /**
     * 开票结果查询接口地址
     */
    public static final String FPJGCXURL = "https://nnfpdev.jss.com.cn/shop/buyer/allow/ecOd/queryElectricKp.action";

    /**
     * 开票结果查询接口地址
     */
    public static final String KPCXURL = "https://nnfpdev.jss.com.cn/shop/buyer/allow/ecOd/queryElectricKp.action";

    /**
     * 发票开具
     * @param invoiceParam
     * @return
     */
    @PostMapping(value = "/order/nuonuo/fpkj")
    public Map<String, Object> fpkj(@RequestBody InvoiceParam invoiceParam) {
        Map<String, Object> map = new HashMap<>();
        Date date = DateUtil.now();
        // 流水号
        String fpqqlsh = DateUtil.parseDateToStr(date, DateUtil.DATE_TIME_FORMAT_YYYYMMDDHHMISS);
        invoiceParam.setOrderno(fpqqlsh);
        invoiceParam.setInvoicedate(DateUtil.parseDateToStr(date, DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS));
        String content = InvoiceMethodEnum.getContentTemplate(InvoiceMethodEnum.fpkj, invoiceParam);
        String response = HttpClientCallSoapUtil.sendSyncSingleHttp(FPKJURL, content);
        System.out.println(response);
        map.put("response", JSON.parseObject(response));
        return map;
    }

    /**
     * 开票结果查询接口
     * @param param
     * @return
     */
    @GetMapping(value = "/order/nuonuo/fpjgcx")
    public Map<String, Object> fpjgcx(@RequestParam String param) {
        Map<String, Object> map = new HashMap<>();
        if (StringUtil.isBlank(param)) {
            map.put("error", "请输入订单号");
            return map;
        }
        List<String> fpqqlshs = Arrays.asList(param.trim().split(","));
        String content = InvoiceMethodEnum.getContentTemplate(InvoiceMethodEnum.fpjgcx, fpqqlshs);
        String response = HttpClientCallSoapUtil.sendSyncSingleHttp(FPJGCXURL, content);
        System.out.println(response);
        map.put("response", JSON.parseObject(response));
        return map;
    }

    /**
     * 根据订单号查询发票请求流水号接口
     * @param param
     * @return
     */
    @GetMapping(value = "/order/nuonuo/kpcx")
    public Map<String, Object> kpcx(@RequestParam String param) {
        Map<String, Object> map = new HashMap<>();
        if (StringUtil.isBlank(param)) {
            map.put("error", "请输入订单号");
            return map;
        }
        List<String> fpqqlshs = Arrays.asList(param.trim().split(","));
        String content = InvoiceMethodEnum.getContentTemplate(InvoiceMethodEnum.kpcx, fpqqlshs);
        String response = HttpClientCallSoapUtil.sendSyncSingleHttp(KPCXURL, content);
        System.out.println(response);
        map.put("response", JSON.parseObject(response));
        return map;
    }
}
