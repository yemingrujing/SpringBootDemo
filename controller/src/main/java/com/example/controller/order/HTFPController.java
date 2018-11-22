package com.example.controller.order;

import cn.hutool.core.codec.Base64;
import com.example.util.common.DateUtil;
import com.example.util.common.invoice.HttpClientCallSoapUtil;
import com.example.util.common.invoice.InvoiceDetailParam;
import com.example.util.common.invoice.InvoiceParam;
import com.example.util.common.invoice.XmlTemplate;
import com.google.common.collect.Lists;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 航天信息发票controller
 *
 * @author Wei.Guang
 * @create 2018-11-22 13:43
 **/
@RestController
public class HTFPController {

    /**
     * XML node 位置
     */
    private static final String RETURNCODE = "/interface/returnStateInfo/returnCode";
    private static final String RETURNMESSAGE = "/interface/returnStateInfo/returnMessage";
    private static final String CONTENT = "/interface/Data/content";
    private static final String KYFPSL = "/RESPONSE_KYFPSL/KYFPSL";

    /**
     * 开发票
     * @return
     */
    @GetMapping(value = "/order/invoice/fpkj")
    public Map<String, Object> fpkj() {
        XmlTemplate xmlTemplate = new XmlTemplate();
        Map<String, Object> moduleMap = new HashMap<>();
        Date date = DateUtil.now();
        // 流水号
        String fpqqlsh = DateUtil.parseDateToStr(date, DateUtil.DATE_TIME_FORMAT_YYYYMMDDHHMISS);
        // 购货方识别号(学员企业)
        String ghfNsrsbh = "310101000000090";
        // 填写学员名字或 对方单位名称
        String ghfmc = "广州金仕达有限公司";
        // 购货方企业类型 01：企业    02：机关事业单位    03：个人    04：其它
        String ghfqylx = "01";
        // 项目单价
        BigDecimal xmdj = new BigDecimal(200).setScale(2, BigDecimal.ROUND_HALF_UP);
        // 项目金额  设置成和单价一样
        BigDecimal xmje = new BigDecimal(400).setScale(2, BigDecimal.ROUND_HALF_UP);
        List<InvoiceDetailParam> list = Lists.newArrayList();
        InvoiceDetailParam detailParam = InvoiceDetailParam.builder().xmmc("继续教育培训费").xmsl("2")
                .hsbz("1").fphxz("0").xmdj(xmdj).spbm("1010101030000000000").xmje(xmje).sl("0.17").build();
        list.add(detailParam);
        InvoiceParam invoiceParam = InvoiceParam.builder().fpqqlsh(fpqqlsh).dkbz(XmlTemplate.DKBZ)
                .bmbBbh(XmlTemplate.BMB_BBH).kpxm("继续教育培训费")
                .xhfNsrsbh("310101000000090").xhfmc("上海市执业药师协会")
                .xhfDz("上海市柳州路615号2号楼3楼").xhfDh("64516320")
                .ghfmc(ghfmc).ghfNsrsbh(ghfNsrsbh).ghfSj("13888884434")
                .ghfqylx(ghfqylx).ghfSf("江苏省").kpy("殷晓梅").kplx("1")
                .czdm("10").chyy("").kphjje(xmje).hjbhsje(new BigDecimal(BigInteger.ZERO)).hjse(new BigDecimal(BigInteger.ZERO))
                .invoiceDetailParams(list).ddh(fpqqlsh).dddate(DateUtil.parseDateToStr(date, DateUtil.DATE_TIME_FORMAT_YYYY_MM_DD_HH_MI_SS)).build();
        String globleInfo = xmlTemplate.getGlobleInfoByInterfaceCode("FPKJ");
        String content = xmlTemplate.getFpkjContentByInterfaceCode(invoiceParam);
        // String contentEncrypted = xmlTemplate.encryptContent(content);
        String contentEncrypted = Base64.encode(content);
        String soapXml = xmlTemplate.getFullXmlEncryptedString(globleInfo, contentEncrypted);
        // 接口调用
        String response = HttpClientCallSoapUtil.doPostSoap(XmlTemplate.WSDLADDRESS_HTTP, soapXml);
        // 解析
        Document doc = xmlTemplate.StringTOXml(response);
        String returnVal = xmlTemplate.getNodeValue(doc, RETURNCODE);
        String returnMessageVal = Base64.decodeStr(xmlTemplate.getNodeValue(doc, RETURNMESSAGE));
        String returnContent = Base64.decodeStr(xmlTemplate.getNodeValue(doc, CONTENT));
        moduleMap.put("code", returnVal);
        moduleMap.put("orderCode", fpqqlsh);
        moduleMap.put("message", returnMessageVal);
        moduleMap.put("message", returnContent);
        return moduleMap;
    }

    /**
     * 获取企业可用发票数量 API
     * @return
     */
    @GetMapping(value = "/order/invoice/getkyfpsl")
    public Map<String, Object> getKyfpsl() {
        Map<String, Object> moduleMap = new HashMap<>();
        XmlTemplate xmlTemplate = new XmlTemplate();
        // 拼接 通用 globleInfo
        String globleInfo = xmlTemplate.getGlobleInfoByInterfaceCode("KYFPSL");
        // 拼接 content 中的明文
        String content = xmlTemplate.getKyfpslContentByInterfaceCode();
        // 加密 content
        // String contentEncrypted = xmlTemplate.encryptContent(content);
        String contentEncrypted = Base64.encode(content);
        String soapXml = xmlTemplate.getFullXmlEncryptedString(globleInfo, contentEncrypted);
        // 接口调用
        String response = HttpClientCallSoapUtil.doPostSoap(XmlTemplate.WSDLADDRESS_HTTP, soapXml);
        // 解析
        Document doc = xmlTemplate.StringTOXml(response);
        String returnVal = xmlTemplate.getNodeValue(doc, RETURNCODE);
        String returnMessageVal = Base64.decodeStr(xmlTemplate.getNodeValue(doc, RETURNMESSAGE));
        String returnContent = Base64.decodeStr(xmlTemplate.getNodeValue(doc, CONTENT));
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
        if (returnVal.equals("0000")) {
            String sl = xmlTemplate.getNodeValue(xmlTemplate.StringTOXml(returnContent), KYFPSL);
            moduleMap.put("kyfpsl", sl);
        }
        return moduleMap;
    }
}
