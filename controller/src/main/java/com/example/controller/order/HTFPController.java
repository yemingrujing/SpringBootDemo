package com.example.controller.order;

import cn.hutool.core.codec.Base64;
import com.example.util.common.invoice.HttpClientCallSoapUtil;
import com.example.util.common.invoice.XmlTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;

import java.util.HashMap;
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
