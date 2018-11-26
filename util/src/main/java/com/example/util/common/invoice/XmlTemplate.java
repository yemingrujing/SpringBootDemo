package com.example.util.common.invoice;

import cn.hutool.core.codec.Base64;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.example.util.common.StringUtil;
import org.w3c.dom.Document;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 开发票模板类
 *
 * @author Wei.Guang
 * @create 2018-11-21 15:43
 **/
public class XmlTemplate {

    /**
     * API调用地址
     */
    public static final String WSDLADDRESS_HTTP = "http://fw1test.shdzfp.com:9000/sajt-shdzfp-sl-http/SvrServlet";

    /**
     * 不同 API 编码不一样 ， 需要动态调用
     */
    public static Map<String, Object> interfaceCodeMap = new ConcurrentHashMap<>();

    // 初始化
    static {
        interfaceCodeMap.put("FPKJ", "ECXML.FPKJ.BC.E_INV");
        interfaceCodeMap.put("FPXZ", "ECXML.FPXZ.CX.E_INV");
        interfaceCodeMap.put("YXTS", "ECXML.EMAILPHONEFPTS.TS.E.INV");
        interfaceCodeMap.put("FPMX", "ECXML.FPMXXZ.CX.E_INV");
        interfaceCodeMap.put("FPTS", "ECXML.FPKJJG.TS.E_INV");
        interfaceCodeMap.put("KYFPSL", "ECXML.QY.KYFPSL");
    }

    /**
     * 拼接通用 XML 头信息
     *
     * @param interfaceCode
     * @return
     */
    public String getGlobleInfoByInterfaceCode(String interfaceCode) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ss");
        DateFormat mat = new SimpleDateFormat("YYYYMMDD");
        Date date = new Date();
        StringBuilder sb = new StringBuilder();
        sb.append("<?xml version=\'1.0\' encoding=\'UTF-8\'?>");
        sb.append(" <interface xmlns:xsi=\'http://www.w3.org/2001/XMLSchema-instance\'");
        sb.append(" xsi:schemaLocation=\'http://www.chinatax.gov.cn/tirip/dataspec/interfaces.xsd\'");
        sb.append(" version=\'DZFP1.0\'>");
        sb.append(" <globalInfo>");
        sb.append("<terminalCode>");
        sb.append(InvoiceConfig.getConfig().getTerminalcode());
        sb.append("</terminalCode>");
        sb.append("<appId>");
        sb.append(InvoiceConfig.getConfig().getAppid());
        sb.append("</appId>");
        sb.append("<version>");
        sb.append(InvoiceConfig.getConfig().getVersion());
        sb.append("</version>");
        sb.append("<interfaceCode>");
        sb.append(interfaceCodeMap.get(interfaceCode).toString());
        sb.append("</interfaceCode>");
        sb.append("<requestCode>");
        sb.append(InvoiceConfig.getConfig().getRequestcode());
        sb.append("</requestCode>");
        sb.append("<requestTime>");
        sb.append(format.format(date));
        sb.append("</requestTime>");
        sb.append("<responseCode>");
        sb.append(InvoiceConfig.getConfig().getResponsecode());
        sb.append("</responseCode>");
        sb.append("<dataExchangeId>");
        sb.append(InvoiceConfig.getConfig().getUsername()).append(interfaceCodeMap.get(interfaceCode).toString()).append(mat.format(date))
                .append(InvoiceConfig.getConfig().getSerialnum());
        sb.append("</dataExchangeId>");
        sb.append("<userName>");
        sb.append(InvoiceConfig.getConfig().getUsername());
        sb.append("</userName>");
        sb.append("<passWord>");
        sb.append(InvoiceConfig.getConfig().getPassword());
        sb.append("</passWord>");
        sb.append("<taxpayerId>");
        sb.append(InvoiceConfig.getConfig().getTaxpayerid());
        sb.append("</taxpayerId>");
        sb.append("<authorizationCode>");
        sb.append(InvoiceConfig.getConfig().getAuthorizationcode());
        sb.append("</authorizationCode>");
        sb.append("</globalInfo>");
        sb.append("<returnStateInfo>");
        sb.append("<returnCode/>");
        sb.append("<returnMessage/>");
        sb.append("</returnStateInfo>");
        sb.append("<Data>");
        sb.append("<dataDescription>");
        sb.append("<zipCode>");
        sb.append(InvoiceConfig.getConfig().getZipcode());
        sb.append("</zipCode>");
        sb.append("<encryptCode>");
        sb.append(InvoiceConfig.getConfig().getEncryptcode());
        sb.append("</encryptCode>");
        sb.append("<codeType>");
        sb.append(InvoiceConfig.getConfig().getCodetype());
        sb.append("</codeType>");
        sb.append("</dataDescription>");
        return sb.toString();
    }

    /**
     * 发票开具
     * @param invoiceParam
     * @return
     */
    public String getFpkjContentByInterfaceCode(InvoiceParam invoiceParam) {
        int size = invoiceParam.getInvoiceDetailParams().size();
        StringBuilder sbContent = new StringBuilder();
        sbContent.append("<REQUEST_FPKJXX class=\"REQUEST_FPKJXX\">");
        sbContent.append("<FPKJXX_FPTXX class=\"FPKJXX_FPTXX\">");
        sbContent.append("<FPQQLSH>");
        sbContent.append(InvoiceConfig.getConfig().getUsername()).append(invoiceParam.getFpqqlsh());
        sbContent.append("</FPQQLSH>");
        sbContent.append("<DSPTBM>");
        sbContent.append(InvoiceConfig.getConfig().getUsername());
        sbContent.append("</DSPTBM>");
        sbContent.append("<NSRSBH>");
        sbContent.append(InvoiceConfig.getConfig().getNsrsbh());
        sbContent.append("</NSRSBH>");
        sbContent.append("<NSRMC>");
        sbContent.append(InvoiceConfig.getConfig().getNsrmc());
        sbContent.append("</NSRMC>");
        sbContent.append("<NSRDZDAH></NSRDZDAH>");
        sbContent.append("<SWJG_DM></SWJG_DM>");
        sbContent.append("<DKBZ>");
        sbContent.append(invoiceParam.getDkbz());
        sbContent.append("</DKBZ>");
        sbContent.append("<PYDM></PYDM>");
        sbContent.append("<KPXM>");
        sbContent.append(invoiceParam.getKpxm());
        sbContent.append("</KPXM>");
        sbContent.append("<BMB_BBH>");
        sbContent.append(invoiceParam.getBmbBbh());
        sbContent.append("</BMB_BBH>");
        sbContent.append("<XHF_NSRSBH>");
        sbContent.append(invoiceParam.getXhfNsrsbh());
        sbContent.append("</XHF_NSRSBH>");
        sbContent.append("<XHFMC>");
        sbContent.append(invoiceParam.getXhfmc());
        sbContent.append("</XHFMC>");
        sbContent.append("<XHF_DZ>");
        sbContent.append(invoiceParam.getXhfDz());
        sbContent.append("</XHF_DZ>");
        sbContent.append("<XHF_DH>");
        sbContent.append(invoiceParam.getXhfDh());
        sbContent.append("</XHF_DH>");
        sbContent.append("<XHF_YHZH>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getXhfYhzh()) ? "" : invoiceParam.getXhfYhzh());
        sbContent.append("</XHF_YHZH>");
        sbContent.append("<GHFMC>");
        sbContent.append(invoiceParam.getGhfmc());
        sbContent.append("</GHFMC>");
        sbContent.append("<GHF_NSRSBH>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getGhfNsrsbh()) ? "" : invoiceParam.getGhfNsrsbh());
        sbContent.append("</GHF_NSRSBH>");
        sbContent.append("<GHF_SF>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getGhfSf()) ? "" : invoiceParam.getGhfSf());
        sbContent.append("</GHF_SF>");
        sbContent.append("<GHF_DZ>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getGhfDz()) ? "" : invoiceParam.getGhfDz());
        sbContent.append("</GHF_DZ>");
        sbContent.append("<GHF_GDDH>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getGhfGddh()) ? "" : invoiceParam.getGhfGddh());
        sbContent.append("</GHF_GDDH>");
        sbContent.append("<GHF_SJ>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getGhfSj()) ? "" : invoiceParam.getGhfSj());
        sbContent.append("</GHF_SJ>");
        sbContent.append("<GHF_EMAIL>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getGhfEmail()) ? "" : invoiceParam.getGhfEmail());
        sbContent.append("</GHF_EMAIL>");
        sbContent.append("<GHFQYLX>");
        sbContent.append(invoiceParam.getGhfqylx());
        sbContent.append("</GHFQYLX>");
        sbContent.append("<GHF_YHZH>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getGhfYhzh()) ? "" : invoiceParam.getGhfYhzh());
        sbContent.append("</GHF_YHZH>");
        sbContent.append("<HY_DM></HY_DM>");
        sbContent.append("<HY_MC></HY_MC>");
        sbContent.append("<KPY>");
        sbContent.append(invoiceParam.getKpy());
        sbContent.append("</KPY>");
        sbContent.append("<SKY></SKY>");
        sbContent.append("<FHR></FHR>");
        sbContent.append("<KPRQ></KPRQ>");
        sbContent.append("<KPLX>");
        sbContent.append(invoiceParam.getKplx());
        sbContent.append("</KPLX>");
        sbContent.append("<YFP_DM>");
        if (!"10".equals(invoiceParam.getCzdm()) || "2".equals(invoiceParam.getKplx())) {
            sbContent.append(invoiceParam.getYfpDm());
        }
        sbContent.append("</YFP_DM>");
        sbContent.append("<YFP_HM>");
        if (!"10".equals(invoiceParam.getCzdm()) || "2".equals(invoiceParam.getKplx())) {
            sbContent.append(invoiceParam.getCzdm());
        }
        sbContent.append("</YFP_HM>");
        sbContent.append("<CZDM>");
        sbContent.append(invoiceParam.getCzdm());
        sbContent.append("</CZDM>");
        sbContent.append("<QD_BZ>0</QD_BZ>");
        sbContent.append("<QDXMMC></QDXMMC>");
        sbContent.append("<CHYY>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getChyy()) ? "" : invoiceParam.getChyy());
        sbContent.append("</CHYY>");
        sbContent.append("<TSCHBZ>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getTschbz()) ? "" : invoiceParam.getTschbz());
        sbContent.append("</TSCHBZ>");
        sbContent.append("<KPHJJE>");
        sbContent.append(invoiceParam.getKphjje());
        sbContent.append("</KPHJJE>");
        sbContent.append("<HJBHSJE>");
        sbContent.append(invoiceParam.getHjbhsje());
        sbContent.append("</HJBHSJE>");
        sbContent.append("<HJSE>");
        sbContent.append(invoiceParam.getHjse());
        sbContent.append("</HJSE>");
        sbContent.append("<BZ>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getBz()) ? "" : invoiceParam.getBz());
        sbContent.append("</BZ>");
        sbContent.append("<BYZD1></BYZD1>");
        sbContent.append("<BYZD2></BYZD2>");
        sbContent.append("<BYZD3></BYZD3>");
        sbContent.append("<BYZD4></BYZD4>");
        sbContent.append("<BYZD5></BYZD5>");
        sbContent.append("</FPKJXX_FPTXX>");
        sbContent.append("<FPKJXX_XMXXS class=\"FPKJXX_XMXX;\" size=\"");
        sbContent.append(size);
        sbContent.append("\">");
        if (size > 0) {
            for (InvoiceDetailParam invoiceDetailParam : invoiceParam.getInvoiceDetailParams()) {
                sbContent.append("<FPKJXX_XMXX>");
                sbContent.append("<XMMC>");
                sbContent.append(invoiceDetailParam.getXmmc());
                sbContent.append("</XMMC>");
                sbContent.append("<XMDW>");
                sbContent.append(StringUtil.isBlank(invoiceDetailParam.getXmdw()) ? "" : invoiceDetailParam.getXmdw());
                sbContent.append("</XMDW>");
                sbContent.append("<GGXH>");
                sbContent.append(StringUtil.isBlank(invoiceDetailParam.getGgxh()) ? "" : invoiceDetailParam.getGgxh());
                sbContent.append("</GGXH>");
                sbContent.append("<XMSL>");
                sbContent.append(invoiceDetailParam.getXmsl());
                sbContent.append("</XMSL>");
                sbContent.append("<HSBZ>");
                sbContent.append(invoiceDetailParam.getHsbz());
                sbContent.append("</HSBZ>");
                sbContent.append("<XMDJ>");
                sbContent.append(invoiceDetailParam.getXmdj());
                sbContent.append("</XMDJ>");
                sbContent.append("<FPHXZ>");
                sbContent.append(invoiceDetailParam.getFphxz());
                sbContent.append("</FPHXZ>");
                sbContent.append("<SPBM>");
                sbContent.append(invoiceDetailParam.getSpbm());
                sbContent.append("</SPBM>");
                sbContent.append("<ZXBM></ZXBM>");
                sbContent.append("<YHZCBS>");
                sbContent.append(invoiceDetailParam.getYhzcbs());
                sbContent.append("</YHZCBS>");
                sbContent.append("<LSLBS>");
                sbContent.append(StringUtil.isBlank(invoiceDetailParam.getLslbs()) ? "" : invoiceDetailParam.getLslbs());
                sbContent.append("</LSLBS>");
                sbContent.append("<ZZSTSGL>");
                sbContent.append(StringUtil.isBlank(invoiceDetailParam.getZzstsgl()) ? "" : invoiceDetailParam.getZzstsgl());
                sbContent.append("</ZZSTSGL>");
                sbContent.append("<KCE>");
                sbContent.append(StringUtil.isBlank(invoiceDetailParam.getKce()) ? "" : invoiceDetailParam.getKce());
                sbContent.append("</KCE>");
                sbContent.append("<XMJE>");
                sbContent.append(invoiceDetailParam.getXmje());
                sbContent.append("</XMJE>");
                sbContent.append("<SL>");
                sbContent.append(invoiceDetailParam.getSl());
                sbContent.append("</SL>");
                sbContent.append("<SE></SE>");
                sbContent.append("<BYZD1></BYZD1>");
                sbContent.append("<BYZD2></BYZD2>");
                sbContent.append("<BYZD3></BYZD3>");
                sbContent.append("<BYZD4></BYZD4>");
                sbContent.append("<BYZD5></BYZD5>");
                sbContent.append("</FPKJXX_XMXX>");
            }
        }
        sbContent.append("</FPKJXX_XMXXS>");
        sbContent.append("<FPKJXX_DDXX class=\"FPKJXX_DDXX\">");
        sbContent.append("<DDH>");
        sbContent.append(InvoiceConfig.getConfig().getUsername()).append(invoiceParam.getDdh());
        sbContent.append("</DDH>");
        sbContent.append("<THDH>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getThdh()) ? "" : invoiceParam.getThdh());
        sbContent.append("</THDH>");
        sbContent.append("<DDDATE>");
        sbContent.append(invoiceParam.getDddate() == null ? "" : invoiceParam.getDddate());
        sbContent.append("</DDDATE>");
        sbContent.append("</FPKJXX_DDXX>");
        sbContent.append("</REQUEST_FPKJXX>");
        return sbContent.toString();
    }

    /**
     * 发票数据下载 API 编码： ECXML.FPXZ.CX.E_INV
     * @param fpqqlsh 发票请求唯一流水号
     * @param xzfs 1 - PDF文件（PDF_FILE） 2 - PDF链接（PDF_URL）
     * @return
     */
    public String getFpxzContentByInterfaceCode(String fpqqlsh, Integer xzfs) {
        StringBuilder sbContent = new StringBuilder();
        sbContent.append("<REQUEST_FPXXXZ_NEW class=\"REQUEST_FPXXXZ_NEW\">");
        sbContent.append("<FPQQLSH>");
        sbContent.append(InvoiceConfig.getConfig().getUsername()).append(fpqqlsh);
        sbContent.append("</FPQQLSH>");
        sbContent.append("<DSPTBM>");
        sbContent.append(InvoiceConfig.getConfig().getUsername());
        sbContent.append("</DSPTBM>");
        sbContent.append("<NSRSBH>");
        sbContent.append(InvoiceConfig.getConfig().getNsrsbh());
        sbContent.append("</NSRSBH>");
        sbContent.append("<DDH>");
        sbContent.append(InvoiceConfig.getConfig().getUsername()).append(fpqqlsh);
        sbContent.append("</DDH>");
        sbContent.append("<PDF_XZFS>");
        sbContent.append(xzfs);
        sbContent.append("</PDF_XZFS>");
        sbContent.append("</REQUEST_FPXXXZ_NEW>");
        return sbContent.toString();
    }

    /**
     * 发票明细信息下载 API 编码： ECXML.FPMXXZ.CX.E_INV
     * @param fpqqlsh 发票请求唯一流水号
     * @param xzfs 1 - PDF文件（PDF_FILE） 2 - PDF链接（PDF_URL）
     * @return
     */
    public String getFpmxContentByInterfaceCode(String fpqqlsh, Integer xzfs) {
        StringBuilder sbContent = new StringBuilder();
        sbContent.append("<REQUEST_FPXXXZ_NEW class=\"REQUEST_FPXXXZ_NEW\">");
        sbContent.append("<FPQQLSH>");
        sbContent.append(InvoiceConfig.getConfig().getUsername()).append(fpqqlsh);
        sbContent.append("</FPQQLSH>");
        sbContent.append("<DSPTBM>");
        sbContent.append(InvoiceConfig.getConfig().getUsername());
        sbContent.append("</DSPTBM>");
        sbContent.append("<NSRSBH>");
        sbContent.append(InvoiceConfig.getConfig().getNsrsbh());
        sbContent.append("</NSRSBH>");
        sbContent.append("<DDH>");
        sbContent.append(InvoiceConfig.getConfig().getUsername()).append(fpqqlsh);
        sbContent.append("</DDH>");
        sbContent.append("<PDF_XZFS>");
        sbContent.append(xzfs);
        sbContent.append("</PDF_XZFS>");
        sbContent.append("</REQUEST_FPXXXZ_NEW>");
        return sbContent.toString();
    }

    /**
     * 邮箱发票推送  API 编码： ECXML.EMAILPHONEFPTS.TS.E.INV
     * 将受票方(购货方)的邮箱推送给电子发票服务平台，平台可通过邮箱把发票信息推送给受票方
     * @param tsfsxx 邮箱发票推送-推送方式信息
     * @param fpxxs 邮箱发票推送-发票信息（多条）
     * @return
     */
    public String getYxfptsContentByInterfaceCode(JSONObject tsfsxx, JSONArray fpxxs) {
        StringBuilder sbContent = new StringBuilder();
        sbContent.append("<REQUEST_EMAILPHONEFPTS class=\"REQUEST_EMAILPHONEFPTS\">");
        sbContent.append("<TSFSXX class=\"TSFSXX\">");
        sbContent.append("<COMMON_NODES class=\"COMMON_NODE;\" size=\"4\">");
        sbContent.append("<COMMON_NODE><NAME>TSFS</NAME><VALUE>");
        sbContent.append(tsfsxx.get("tsfs"));
        sbContent.append("</VALUE></COMMON_NODE>");
        sbContent.append("<COMMON_NODE><NAME>SJ</NAME><VALUE>");
        sbContent.append(StringUtil.isBlank((String) tsfsxx.get("sj")) ? "" : tsfsxx.get("sj"));
        sbContent.append("</VALUE></COMMON_NODE>");
        sbContent.append("<COMMON_NODE><NAME>EMAIL</NAME><VALUE>");
        sbContent.append(tsfsxx.get("email"));
        sbContent.append("</VALUE></COMMON_NODE>");
        sbContent.append("<COMMON_NODE><NAME>扩展字段名称</NAME><VALUE>");
        sbContent.append("</VALUE></COMMON_NODE>");
        sbContent.append("</COMMON_NODES>");
        sbContent.append("</TSFSXX>");
        sbContent.append("<FPXXS class=\"FPXX;\" size=\"");
        sbContent.append(fpxxs.size());
        sbContent.append("\">");
        for (int i = 0; i < fpxxs.size(); i++) {
            JSONObject fpxx = fpxxs.getJSONObject(i);
            sbContent.append("<FPXX>");
            sbContent.append("<COMMON_NODES class=\"COMMON_NODE;\" size=\"5\">");
            sbContent.append("<COMMON_NODE><NAME>FPQQLSH</NAME><VALUE>");
            sbContent.append(InvoiceConfig.getConfig().getUsername()).append(fpxx.get("fpqqlsh"));
            sbContent.append("</VALUE></COMMON_NODE>");
            sbContent.append("<COMMON_NODE><NAME>NSRSBH</NAME><VALUE>");
            sbContent.append(fpxx.get("nsrsbh"));
            sbContent.append("</VALUE></COMMON_NODE>");
            sbContent.append("<COMMON_NODE><NAME>FP_DM</NAME><VALUE>");
            sbContent.append(fpxx.get("fpDm"));
            sbContent.append("</VALUE></COMMON_NODE>");
            sbContent.append("<COMMON_NODE><NAME>FP_HM</NAME><VALUE>");
            sbContent.append(fpxx.get("fpHm"));
            sbContent.append("</VALUE></COMMON_NODE>");
            sbContent.append("<COMMON_NODE><NAME>扩展字段名称</NAME><VALUE>");
            sbContent.append("</VALUE></COMMON_NODE>");
            sbContent.append("</COMMON_NODES>");
            sbContent.append("</FPXX>");
        }
        sbContent.append("</FPXXS>");
        sbContent.append("</REQUEST_EMAILPHONEFPTS>");
        return sbContent.toString();
    }

    /**
     * 发票信息推送 API 编码： ECXML.FPKJJG.TS.E_INV
     * 生成完成的发票信息传递给企业
     * @param fptsContent 调用发票信息下载的返回content
     * @return
     */
    public String getFptsContentByInterfaceCode(String fptsContent) {
        StringBuilder sbContent = new StringBuilder();
        sbContent.append(fptsContent);
        return sbContent.toString();
    }

    /**
     * 获取企业可用发票数量 API 编码： ECXML.QY.KYFPSL
     * @return
     */
    public String getKyfpslContentByInterfaceCode() {
        StringBuilder sbContent = new StringBuilder();
        sbContent.append("<REQUEST_KYFPSL class=\"REQUEST_KYFPSL\"><NSRSBH>");
        sbContent.append(InvoiceConfig.getConfig().getTaxpayerid());
        sbContent.append("</NSRSBH></REQUEST_KYFPSL>");
        return sbContent.toString();
    }

    /**
     * 拼接全部报文
     * @param globleInfo
     * @param encryptContent
     * @return
     */
    public static String getFullXmlEncryptedString(String globleInfo, String encryptContent) {
        StringBuilder sb = new StringBuilder();
        sb.append(globleInfo);
        sb.append("<content>");
        sb.append(encryptContent);
        sb.append("</content>");
        sb.append("</Data>");
        sb.append("</interface>");
        return sb.toString();
    }

    /**
     * 加密 Content
     *
     * @param content
     * @return
     */
    public static String encryptContent(String content) {
        DesUtil desUtil = new DesUtil();
        byte[] data = null;
        String encryptContent = "";
        try {
            data = desUtil.getStringByte(content);
            // CA 加密生产用
            data = desUtil.des3EncodeECB(InvoiceConfig.getConfig().getKeybytes().getBytes("UTF-8"), data);
            // Base64 加密
            encryptContent = Base64.encode(data);
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        // bash64 加密 content
        return encryptContent;
    }

    /**
     * 解密 Content
     *
     * @param content
     * @return
     */
    public static String decryptContent(String content) {
        DesUtil desUtil = new DesUtil();
        byte[] data = null;
        String decryptContent = "";
        try {
            data = desUtil.getStringByte(content);
            // CA 加密生产用
            data = desUtil.des3DecodeECB(InvoiceConfig.getConfig().getKeybytes().getBytes("UTF-8"), data);
            // Base64 加密
            decryptContent = new String(Base64.decode(data), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        // bash64 加密 content
        return decryptContent;
    }

    /**
     * String类型转换成Document
     * @param str xml形状的str串
     * @return Document 对象
     */
    public static Document StringTOXml(String str) {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        Document doc = null;
        try {
            InputStream is = new ByteArrayInputStream(str.getBytes("utf-8"));
            doc = dbf.newDocumentBuilder().parse(is);
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return doc;
    }

    /**
     * 获取节点名称
     * @param document
     * @param nodePaht
     * @return 某个节点的值 前提是需要知道xml格式，知道需要取的节点相对根节点所在位置
     */
    public static String getNodeValue(Document document, String nodePaht) {
        XPathFactory xpfactory = XPathFactory.newInstance();
        XPath path = xpfactory.newXPath();
        String servInitrBrch = "";
        try {
            servInitrBrch = path.evaluate(nodePaht, document);
        } catch (XPathExpressionException e) {
            e.printStackTrace();
        }
        return servInitrBrch;
    }
}
