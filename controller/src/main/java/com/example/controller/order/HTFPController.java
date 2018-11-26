package com.example.controller.order;

import cn.hutool.core.codec.Base64;
import cn.hutool.json.XML;
import com.alibaba.fastjson.JSONObject;
import com.example.util.common.DateUtil;
import com.example.util.common.invoice.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.Document;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 航天信息发票controller
 *
 * @author Wei.Guang
 * @create 2018-11-22 13:43
 **/
@Slf4j
@RestController
public class HTFPController {

    /**
     * 公用参数初始化
     */
    @PostConstruct
    public void init() {
        log.info("航天信息发票基础参数初始化");
        InvoiceConfig.getConfig().loadPropertiesFromSrc();
    }

    /**
     * XML node 位置
     */
    private static final String RETURNCODE = "/interface/returnStateInfo/returnCode";
    private static final String RETURNMESSAGE = "/interface/returnStateInfo/returnMessage";
    private static final String CONTENT = "/interface/Data/content";
    private static final String KYFPSL = "/RESPONSE_KYFPSL/KYFPSL";

    /**
     * 开发票
     * @param invoiceParam
     * @return
     */
    @PostMapping(value = "/order/invoice/fpkj")
    public Map<String, Object> fpkj(@RequestBody InvoiceParam invoiceParam) {
        XmlTemplate xmlTemplate = new XmlTemplate();
        Map<String, Object> moduleMap = new HashMap<>();
        Date date = DateUtil.now();
        // 流水号
        String fpqqlsh = DateUtil.parseDateToStr(date, DateUtil.DATE_TIME_FORMAT_YYYYMMDDHHMISS);
        invoiceParam.setFpqqlsh(fpqqlsh);
        invoiceParam.setDdh(fpqqlsh);
        String globleInfo = xmlTemplate.getGlobleInfoByInterfaceCode("FPKJ");
        String content = xmlTemplate.getFpkjContentByInterfaceCode(invoiceParam);
        // String contentEncrypted = XmlTemplate.encryptContent(content);
        String contentEncrypted = Base64.encode(content);
        String soapXml = XmlTemplate.getFullXmlEncryptedString(globleInfo, contentEncrypted);
        // 接口调用
        String response = HttpClientCallSoapUtil.doPostSoap(XmlTemplate.WSDLADDRESS_HTTP, soapXml);
        // 解析
        Document doc = XmlTemplate.StringTOXml(response);
        String returnVal = XmlTemplate.getNodeValue(doc, RETURNCODE);
        String returnMessageVal = Base64.decodeStr(XmlTemplate.getNodeValue(doc, RETURNMESSAGE));
        if (returnVal.equals("0000")) {
            moduleMap.put("orderCode", fpqqlsh);
        }
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
        return moduleMap;
    }

    /**
     * 发票数据下载
     *
     * @param orderCode 订单号
     * @param xzfs      1 - PDF文件（PDF_FILE） 2 - PDF链接（PDF_URL）
     * @return
     */
    @GetMapping(value = "/order/invoice/fpxz")
    public void fpxz(@RequestParam String orderCode,
                                    @RequestParam Integer xzfs,
                                    HttpServletResponse rsp) throws Exception {
        XmlTemplate xmlTemplate = new XmlTemplate();
        // 拼接 通用 globleInfo
        String globleInfo = xmlTemplate.getGlobleInfoByInterfaceCode("FPXZ");
        // 拼接 content 中的明文
        String content = xmlTemplate.getFpxzContentByInterfaceCode(orderCode, xzfs);
        // 加密 content
        // String contentEncrypted = XmlTemplate.encryptContent(content);
        String contentEncrypted = Base64.encode(content);
        String soapXml = XmlTemplate.getFullXmlEncryptedString(globleInfo, contentEncrypted);
        // 接口调用
        String response = HttpClientCallSoapUtil.doPostSoap(XmlTemplate.WSDLADDRESS_HTTP, soapXml);
        // 解析
        Document doc = XmlTemplate.StringTOXml(response);
        String returnVal = XmlTemplate.getNodeValue(doc, RETURNCODE);
        String returnMessageVal = Base64.decodeStr(XmlTemplate.getNodeValue(doc, RETURNMESSAGE));
        if (xzfs.intValue() == 1 && returnVal.equals("0000")) {
            String returnContent = new String(SecurityUtil.unGZip(XmlTemplate.getNodeValue(doc, CONTENT)));
            String pdfFile = XmlTemplate.getNodeValue(XmlTemplate.StringTOXml(returnContent), "/REQUEST_FPKJXX_FPJGXX_NEW/PDF_FILE");
            String path =  UUID.randomUUID().toString() + ".pdf";
            // SecurityUtil.decoderBase64File(pdfFile, path);
            SecurityUtil.downLoadFile(pdfFile, path, rsp);
        }
    }

    /**
     * 邮箱发票推送
     *
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
        // String contentEncrypted = XmlTemplate.encryptContent(content);
        String contentEncrypted = Base64.encode(content);
        String soapXml = XmlTemplate.getFullXmlEncryptedString(globleInfo, contentEncrypted);
        // 接口调用
        String response = HttpClientCallSoapUtil.doPostSoap(XmlTemplate.WSDLADDRESS_HTTP, soapXml);
        // 解析
        Document doc = XmlTemplate.StringTOXml(response);
        String returnVal = XmlTemplate.getNodeValue(doc, RETURNCODE);
        String returnMessageVal = Base64.decodeStr(XmlTemplate.getNodeValue(doc, RETURNMESSAGE));
        if (returnVal.equals("0000")) {
            String returnContent = Base64.decodeStr(XmlTemplate.getNodeValue(doc, CONTENT));
            String fptslsh = XmlTemplate.getNodeValue(XmlTemplate.StringTOXml(returnContent), "/RESPONSE_EMAILPHONEFPTS/COMMON_NODES/COMMON_NODE/VALUE");
            moduleMap.put("fptslsh", fptslsh);

        }
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
        return moduleMap;
    }

    /**
     * 发票明细信息下载
     *
     * @param orderCode 订单号
     * @param xzfs      PDF下载方式 1 - PDF文件（PDF_FILE） 2 - PDF链接（PDF_URL）
     * @return
     */
    @PostMapping(value = "/order/invoice/fpmx")
    public Map<String, Object> fpmx(@RequestParam String orderCode,
                                    @RequestParam Integer xzfs) throws Exception {
        Map<String, Object> moduleMap = new HashMap<>();
        XmlTemplate xmlTemplate = new XmlTemplate();
        // 拼接 通用 globleInfo
        String globleInfo = xmlTemplate.getGlobleInfoByInterfaceCode("FPMX");
        // 拼接 content 中的明文
        String content = xmlTemplate.getFpmxContentByInterfaceCode(orderCode, xzfs);
        // 加密 content
        // String contentEncrypted = XmlTemplate.encryptContent(content);
        String contentEncrypted = Base64.encode(content);
        String soapXml = XmlTemplate.getFullXmlEncryptedString(globleInfo, contentEncrypted);
        // 接口调用
        String response = HttpClientCallSoapUtil.doPostSoap(XmlTemplate.WSDLADDRESS_HTTP, soapXml);
        // 解析
        Document doc = XmlTemplate.StringTOXml(response);
        String returnVal = XmlTemplate.getNodeValue(doc, RETURNCODE);
        String returnMessageVal = Base64.decodeStr(XmlTemplate.getNodeValue(doc, RETURNMESSAGE));
        if (returnVal.equals("0000")) {
            String returnContent;
            if (xzfs.intValue() == 1) {
                returnContent = new String(SecurityUtil.unGZip(XmlTemplate.getNodeValue(doc, CONTENT)));
            } else {
                returnContent = Base64.decodeStr(XmlTemplate.getNodeValue(doc, CONTENT));
            }
            moduleMap.put("returnContent", XML.toJSONObject(returnContent));

        }
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
        return moduleMap;
    }

    /**
     * 发票信息推送
     *
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
        String soapXml = XmlTemplate.getFullXmlEncryptedString(globleInfo, contentEncrypted);
        // 接口调用
        String response = HttpClientCallSoapUtil.doPostSoap(XmlTemplate.WSDLADDRESS_HTTP, soapXml);
        // 解析
        Document doc = XmlTemplate.StringTOXml(response);
        String returnVal = XmlTemplate.getNodeValue(doc, RETURNCODE);
        String returnMessageVal = Base64.decodeStr(XmlTemplate.getNodeValue(doc, RETURNMESSAGE));
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
        return moduleMap;
    }

    /**
     * 获取企业可用发票数量 API
     *
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
        // String contentEncrypted = XmlTemplate.encryptContent(content);
        String contentEncrypted = Base64.encode(content);
        String soapXml = XmlTemplate.getFullXmlEncryptedString(globleInfo, contentEncrypted);
        // 接口调用
        String response = HttpClientCallSoapUtil.doPostSoap(XmlTemplate.WSDLADDRESS_HTTP, soapXml);
        // 解析
        Document doc = XmlTemplate.StringTOXml(response);
        String returnVal = XmlTemplate.getNodeValue(doc, RETURNCODE);
        String returnMessageVal = Base64.decodeStr(XmlTemplate.getNodeValue(doc, RETURNMESSAGE));
        String returnContent = Base64.decodeStr(XmlTemplate.getNodeValue(doc, CONTENT));
        moduleMap.put("code", returnVal);
        moduleMap.put("message", returnMessageVal);
        if (returnVal.equals("0000")) {
            String sl = XmlTemplate.getNodeValue(XmlTemplate.StringTOXml(returnContent), KYFPSL);
            moduleMap.put("kyfpsl", sl);
        }
        return moduleMap;
    }
}