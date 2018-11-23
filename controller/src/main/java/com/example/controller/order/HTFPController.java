package com.example.controller.order;

import cn.hutool.core.codec.Base64;
import cn.hutool.json.XML;
import com.alibaba.fastjson.JSONObject;
import com.example.util.common.DateUtil;
import com.example.util.common.invoice.*;
import com.google.common.collect.Lists;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.Document;
import sun.misc.BASE64Decoder;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.*;

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
    private static final String PDF_FILE_PATH = "E:\\file\\htfp\\";

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
        // 填写学员名字或 对方单位名称
        String ghfmc = "廖兵";
        // 购货方企业类型 01：企业    02：机关事业单位    03：个人    04：其它
        String ghfqylx = "03";
        // 项目单价
        BigDecimal xmdj = new BigDecimal(200).setScale(2, BigDecimal.ROUND_HALF_UP);
        // 项目金额  设置成和单价一样
        BigDecimal xmje = new BigDecimal(400).setScale(2, BigDecimal.ROUND_HALF_UP);
        List<InvoiceDetailParam> list = Lists.newArrayList();
        InvoiceDetailParam detailParam = InvoiceDetailParam.builder().xmmc("迷你裙").xmsl("2")
                .hsbz("1").fphxz("0").xmdj(xmdj).spbm("1010101030000000000").xmje(xmje).sl("0.17").build();
        list.add(detailParam);
        InvoiceParam invoiceParam = InvoiceParam.builder().fpqqlsh(fpqqlsh).dkbz(XmlTemplate.DKBZ)
                .bmbBbh(XmlTemplate.BMB_BBH).kpxm("迷你裙")
                .xhfNsrsbh("310101000000090").xhfmc("上海市执业药师协会")
                .xhfDz("上海市柳州路615号2号楼3楼").xhfDh("213132")
                .ghfmc(ghfmc).ghfSj("13888884434")
                .ghfqylx(ghfqylx).ghfSf("江苏省").kpy("药师").kplx("1")
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
        if (returnVal.equals("0000")) {
            moduleMap.put("orderCode", fpqqlsh);
        }
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
        return moduleMap;
    }

    /**
     * 发票数据下载
     * @param orderCode 订单号
     * @param xzfs 1 - PDF文件（PDF_FILE） 2 - PDF链接（PDF_URL）
     * @return
     */
    @GetMapping(value = "/order/invoice/fpxz")
    public Map<String, Object> fpxz(@RequestParam String orderCode,
                                    @RequestParam Integer xzfs) throws Exception {
        Map<String, Object> moduleMap = new HashMap<>();
        XmlTemplate xmlTemplate = new XmlTemplate();
        // 拼接 通用 globleInfo
        String globleInfo = xmlTemplate.getGlobleInfoByInterfaceCode("FPXZ");
        // 拼接 content 中的明文
        String content = xmlTemplate.getFpxzContentByInterfaceCode(orderCode, xzfs);
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
        if (xzfs.intValue() == 1 && returnVal.equals("0000")) {
            String returnContent = new String(DesUtil.unGZip(new BASE64Decoder().decodeBuffer(xmlTemplate.getNodeValue(doc, CONTENT))));
            String pdfFile = xmlTemplate.getNodeValue(xmlTemplate.StringTOXml(returnContent), "/REQUEST_FPKJXX_FPJGXX_NEW/PDF_FILE");
            String path  = PDF_FILE_PATH + UUID.randomUUID().toString() + ".pdf";
            DesUtil.decoderBase64File(pdfFile, path);
            moduleMap.put("content", XML.toJSONObject(returnContent));
        }
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
        return moduleMap;
    }

    /**
     * 邮箱发票推送
     * @param jsonObject
     */
    @PostMapping(value = "/order/invoice/fpts", produces = "application/json;charset=UTF-8")
    public Map<String, Object> fpts(@RequestBody JSONObject jsonObject) {
        Map<String, Object> moduleMap = new HashMap<>();
        XmlTemplate xmlTemplate = new XmlTemplate();
        // 拼接 通用 globleInfo
        String globleInfo = xmlTemplate.getGlobleInfoByInterfaceCode("YXTS");
        // 拼接 content 中的明文
        String content = xmlTemplate.getYxfptsContentByInterfaceCode(jsonObject.getJSONObject("tsfsxx"), jsonObject.getJSONArray("fpxxs"));
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
        if (returnVal.equals("0000")) {
            String returnContent = Base64.decodeStr(xmlTemplate.getNodeValue(doc, CONTENT));
            String fptslsh = xmlTemplate.getNodeValue(xmlTemplate.StringTOXml(returnContent), "/RESPONSE_EMAILPHONEFPTS/COMMON_NODES/COMMON_NODE/VALUE");
            moduleMap.put("fptslsh", fptslsh);

        }
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
        return moduleMap;
    }

    /**
     * 发票明细信息下载
     * @param orderCode 订单号
     * @param xzfs PDF下载方式 1 - PDF文件（PDF_FILE） 2 - PDF链接（PDF_URL）
     * @return
     */
    @PostMapping(value = "/order/invoice/fpmx")
    public Map<String, Object> fpmx(@RequestParam String orderCode,
                                    @RequestParam Integer xzfs) throws IOException {
        Map<String, Object> moduleMap = new HashMap<>();
        XmlTemplate xmlTemplate = new XmlTemplate();
        // 拼接 通用 globleInfo
        String globleInfo = xmlTemplate.getGlobleInfoByInterfaceCode("FPMX");
        // 拼接 content 中的明文
        String content = xmlTemplate.getFpmxContentByInterfaceCode(orderCode, xzfs);
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
        if (returnVal.equals("0000")) {
            String returnContent;
            if (xzfs.intValue() == 1) {
                returnContent = new String(DesUtil.unGZip(new BASE64Decoder().decodeBuffer(xmlTemplate.getNodeValue(doc, CONTENT))));
            } else {
                returnContent = Base64.decodeStr(xmlTemplate.getNodeValue(doc, CONTENT));
            }
            moduleMap.put("returnContent", XML.toJSONObject(returnContent));

        }
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
        return moduleMap;
    }

    /**
     * 发票信息推送
     * @param fptsContent 推送参数(调用发票信息下载的返回content)
     * @return
     */
    @GetMapping(value = "/order/invoice/fpts")
    public Map<String, Object> fpts(String fptsContent) {
        Map<String, Object> moduleMap = new HashMap<>();
        XmlTemplate xmlTemplate = new XmlTemplate();
        String globleInfo = xmlTemplate.getGlobleInfoByInterfaceCode("FPTS");
        // 拼接 content 中的明文
        String content = xmlTemplate.getFptsContentByInterfaceCode(fptsContent);
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
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
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
