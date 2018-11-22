package com.example.util.common.invoice;

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
import java.util.List;
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
     * 不同 API 编码不一样 ， 需要动态调用
     */
    public static Map<String, Object> interfaceCodeMap = new ConcurrentHashMap<>();

    // 初始化
    static {
        interfaceCodeMap.put("FPKJ", "ECXML.FPKJ.BC.E_INV");
        interfaceCodeMap.put("FPXZ", "ECXML.FPXZ.CX.E_INV");
    }

    /**
     * 终端类型标识(0:B/S 请求来源;1:C/S 请求来源
     */
    private String TERMINALCODE = "0";

    /**
     * DZFP 表示普通发票。ZZS_PT_DZFP 表示增值税普通电子发票
     */
    private String APPID = "ZZS_PT_DZFP";

    /**
     * API 版本,当前 1.0
     */
    private String VERSION = "1.0";

    /**
     * 平台编码, 事先取得从管理端（请求前）test 111MFWIK;  药师 P0000391
     */
    private String USERNAME = "testing";

    /**
     * 事先取得从管理端（请求前）
     */
    private String PASSWORD ="";

    /**
     * 数据交换流水号
     */
    private String SERIALNUM = "eXl4EymmJ";

    /**
     * 数据交换请求发起方代码 ,用平台编码
     */
    private String REQUESTCODE = "testing";

    /**
     *  纳税人识别号 test 310101000000090
     */
    private String TAXPAYERID = "51310000501778371C";

    /**
     * 纳税人授权码, 事先取得从平台系统获取（请求前) test 3100000090  ；药师 	70MP0I49BH
     */
    private String AUTHORIZATIONCODE = "70MP0I49BH";

    /**
     * 数据交换请求接受方代码
     */
    private String RESPONSECODE = "121";

    /**
     * 压缩标识 0 不压缩 1 压缩
     */
    private String ZIPCODE_NO_COMPRESS = "0";

    /**
     *  压缩标识 0 不压缩 1 压缩
     */
    private String ZIPCODE_COMPRESS = "1";

    /**
     * 加密标识 0:不加密 1: 3DES 加密 2:CA
     */
    private String ENCRYPTCODE_NO = "0";

    /**
     * 加密标识 0:不加密 1: 3DES 加密 2:CA
     */
    private String ENCRYPTCODE_3DES = "1";

    /**
     * 加密标识 0:不加密 1: 3DES 加密 2:CA
     */
    private String ENCRYPTCODE_CA = "2";

    /**
     * 加密方式
     */
    private String CODETYPE = "0";

    /**
     * 加密方式
     */
    private String CODETYPE_3DES = "3DES";

    /**
     * 加密方式
     */
    private String CODETYPE_CA = "CA";

    /**
     * 开票方识别号
     */
    private String NSRSBH = "51310000501778371C";

    /**
     * 开票方名称
     */
    private String NSRMC = "上海市执业药师协会";

    /**
     * 编码表版本号 12.0 now
     */
    private String BMB_BBH = "26.0";

    /**
     * 加密字符串
     */
    private String KEYBYTES = "==testing testing==";

    /**
     * 拼接通用 XML 头信息
     *
     * @param interfaceCode
     * @return
     */
    public String getGlobleInfoByInterfaceCode(String interfaceCode) {
        DateFormat format = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
        DateFormat mat = new SimpleDateFormat("YYYYMMDD");
        Date date = new Date();
        StringBuilder sb = new StringBuilder();
        sb.append("<?xml version=\'1.0\' encoding=\'UTF-8\'?>");
        sb.append(" <interface xmlns:xsi=\'http://www.w3.org/2001/XMLSchema-instance\'");
        sb.append(" xsi:schemaLocation=\'http://www.chinatax.gov.cn/tirip/dataspec/interfaces.xsd\'");
        sb.append(" version=\'DZFP1.0\'>");
        sb.append(" <globalInfo>");
        sb.append("<terminalCode>");
        sb.append(TERMINALCODE);
        sb.append("</terminalCode>");
        sb.append("<appId>");
        sb.append(APPID);
        sb.append("</appId>");
        sb.append("<version>");
        sb.append(VERSION);
        sb.append("</version>");
        sb.append("<interfaceCode>");
        sb.append(interfaceCodeMap.get(interfaceCode).toString());
        sb.append("</interfaceCode>");
        sb.append("<requestCode>");
        sb.append(REQUESTCODE);
        sb.append("</requestCode>");
        sb.append("	<requestTime>");
        sb.append(format.format(date));
        sb.append("</requestTime>");
        sb.append("<responseCode>");
        sb.append(RESPONSECODE);
        sb.append("</responseCode>");
        sb.append("<dataExchangeId>");
        sb.append(USERNAME).append(interfaceCodeMap.get(interfaceCode).toString()).append(mat.format(date))
                .append(SERIALNUM);
        sb.append("</dataExchangeId>");
        sb.append("<userName>");
        sb.append(USERNAME);
        sb.append("</userName>");
        sb.append("<passWord>");
        sb.append(PASSWORD);
        sb.append("</passWord>");
        sb.append("<taxpayerId>");
        sb.append(TAXPAYERID);
        sb.append("</taxpayerId>");
        sb.append("<authorizationCode>");
        sb.append(AUTHORIZATIONCODE);
        sb.append("</authorizationCode>");
        sb.append("</globalInfo>");
        sb.append("<returnStateInfo>");
        sb.append("<returnCode/>");
        sb.append("<returnMessage/>");
        sb.append("</returnStateInfo>");
        sb.append("<Data>");
        sb.append("<dataDescription>");
        sb.append("<zipCode>");
        sb.append(ZIPCODE_NO_COMPRESS);
        sb.append("</zipCode>");
        sb.append("<encryptCode>");
        // 正式
        sb.append(ENCRYPTCODE_3DES);
        sb.append("</encryptCode>");
        sb.append("<codeType>");
        // test
        // sb.append(CODETYPE);
        // 正式
        sb.append(CODETYPE_3DES);
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
        sbContent.append(USERNAME).append(invoiceParam.getFpqqlsh());
        //sbContent.append(fpqqlsh);
        sbContent.append("</FPQQLSH>");
        sbContent.append("<DSPTBM>");
        sbContent.append(USERNAME);
        sbContent.append("</DSPTBM>");
        sbContent.append("<NSRSBH>");
        sbContent.append(NSRSBH);
        sbContent.append("</NSRSBH>");
        sbContent.append("<NSRMC>");
        sbContent.append(NSRMC);
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
        sbContent.append("<XHF_YHZH></XHF_YHZH>");
        sbContent.append("<GHFMC>");
        sbContent.append(invoiceParam.getGhfmc());
        sbContent.append("</GHFMC>");
        sbContent.append("<GHF_NSRSBH>");
        sbContent.append(invoiceParam.getGhfNsrsbh());
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
        sbContent.append(StringUtil.isBlank(invoiceParam.getGhfSf()) ? "" : invoiceParam.getGhfSf());
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
        sbContent.append("<YFP_DM></YFP_DM>");
        sbContent.append("<YFP_HM></YFP_HM>");
        sbContent.append("<CZDM>");
        sbContent.append(invoiceParam.getCzdm());
        sbContent.append("</CZDM>");
        sbContent.append("<QD_BZ>0</QD_BZ>");
        sbContent.append("<QDXMMC></QDXMMC>");
        sbContent.append("<CHYY>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getChyy()) ? "" : invoiceParam.getChyy());
        sbContent.append("</CHYY>");
        sbContent.append("<TSCHBZ></TSCHBZ>");
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
            for (InvoiceParam.InvoiceDetailParam invoiceDetailParam : invoiceParam.getInvoiceDetailParams()) {
                sbContent.append("<FPKJXX_XMXX>");
                sbContent.append("<XMMC>");
                sbContent.append(invoiceDetailParam.getXmmc());
                sbContent.append("</XMMC>");
                sbContent.append("<XMDW></XMDW>");
                sbContent.append("<GGXH></GGXH>");
                sbContent.append("<XMSL></XMSL>");
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
                sbContent.append("<LSLBS></LSLBS>");
                sbContent.append("<ZZSTSGL></ZZSTSGL>");
                sbContent.append("<KCE></KCE>");
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
        sbContent.append(invoiceParam.getDDH());
        sbContent.append("</DDH>");
        sbContent.append("<THDH/>");
        sbContent.append(StringUtil.isBlank(invoiceParam.getThdh()) ? "" : invoiceParam.getThdh());
        sbContent.append("<THDH/>");
        sbContent.append("<DDDATE><DDDATE/>");
        sbContent.append(invoiceParam.getDddate() == null ? "" : new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(invoiceParam.getDddate()));
        sbContent.append("<DDDATE><DDDATE/>");
        sbContent.append("</FPKJXX_DDXX>");
        sbContent.append("</REQUEST_FPKJXX>");
        return sbContent.toString();
    }

    /**
     * 加密 Content
     *
     * @param content
     * @return
     */
    public String encryptContent(String content) {
        DesUtil desUtil = new DesUtil();
        byte[] data = null;
        String encryptContent = "";
        try {
            data = desUtil.getStringByte(content);
            // CA 加密生产用
            data = desUtil.des3EncodeECB(KEYBYTES.getBytes("UTF-8"), data);
            // Base64 加密
            encryptContent = desUtil.getBase64EncString(data);
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
     * 拼接全部报文
     * @param globleInfo
     * @param encryptContent
     * @return
     */
    public String getFullXmlEncryptedString(String globleInfo, String encryptContent) {
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
     *
     * @param str xml形状的str串
     * @return Document 对象
     */
    public Document StringTOXml(String str) {
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
     *
     * @param document
     * @param nodePaht
     * @return 某个节点的值 前提是需要知道xml格式，知道需要取的节点相对根节点所在位置
     */
    public String getNodeValue(Document document, String nodePaht) {
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

    /**
     * 发票数据下载 API 编码： ECXML.FPXZ.CX.E_INV
     * @param fpqqlsh 发票请求唯一流水号
     * @param ddh 订单号
     * @param xzfs 1 - PDF文件（PDF_FILE） 2 - PDF链接（PDF_URL）
     * @return
     */
    public String getFpxzContentByInterfaceCode(String fpqqlsh, String ddh, Integer xzfs) {
        StringBuilder sbContent = new StringBuilder();
        sbContent.append("<REQUEST_FPXXXZ_NEW class=\"REQUEST_FPXXXZ_NEW\">");
        sbContent.append("<FPQQLSH>");
        sbContent.append(fpqqlsh);
        sbContent.append("</FPQQLSH>");
        sbContent.append("<DSPTBM>");
        sbContent.append(USERNAME);
        sbContent.append("</DSPTBM>");
        sbContent.append("<NSRSBH>");
        sbContent.append(NSRSBH);
        sbContent.append("</NSRSBH>");
        sbContent.append("<DDH>");
        sbContent.append(ddh);
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
     * @param ddh 订单号
     * @param xzfs 1 - PDF文件（PDF_FILE） 2 - PDF链接（PDF_URL）
     * @return
     */
    public String getFpmxContentByInterfaceCode(String fpqqlsh, String ddh, Integer xzfs) {
        StringBuilder sbContent = new StringBuilder();
        sbContent.append("<REQUEST_FPXXXZ_NEW class=\"REQUEST_FPXXXZ_NEW\">");
        sbContent.append("<FPQQLSH>");
        sbContent.append(fpqqlsh);
        sbContent.append("</FPQQLSH>");
        sbContent.append("<DSPTBM>");
        sbContent.append(USERNAME);
        sbContent.append("</DSPTBM>");
        sbContent.append("<NSRSBH>");
        sbContent.append(NSRSBH);
        sbContent.append("</NSRSBH>");
        sbContent.append("<DDH>");
        sbContent.append(ddh);
        sbContent.append("</DDH>");
        sbContent.append("<PDF_XZFS>");
        sbContent.append(xzfs);
        sbContent.append("</PDF_XZFS>");
        sbContent.append("</REQUEST_FPXXXZ_NEW>");
        return sbContent.toString();
    }

    /**
     * 邮箱发票推送  API 编码： ECXML.EMAILPHONEFPTS.TS.E.INV
     * @param tsfsxx 邮箱发票推送-推送方式信息
     * @param fpxxs 邮箱发票推送-发票信息（多条）
     * @return
     */
    public String getYxfptsContentByInterfaceCode(Map<String, String> tsfsxx, List<Map<String, String>> fpxxs) {
        StringBuilder sbContent = new StringBuilder();
        sbContent.append("REQUEST_EMAILPHONEFPTS class=\"REQUEST_EMAILPHONEFPTS\">");
        sbContent.append("<TSFSXX class=\"TSFSXX\">");
        sbContent.append("<COMMON_NODES class=\"COMMON_NODE;\" size=\"3\">");
        sbContent.append("<COMMON_NODE><NAME>TSFS</NAME><VALUE>");
        sbContent.append(tsfsxx.get("tsfs"));
        sbContent.append("<NAME>TSFS</NAME></VALUE></COMMON_NODE>");
        sbContent.append("<COMMON_NODE><NAME>SJ</NAME><VALUE>");
        sbContent.append(StringUtil.isBlank(tsfsxx.get("sj")) ? "" : tsfsxx.get("sj"));
        sbContent.append("<NAME>SJ</NAME></VALUE></COMMON_NODE>");
        sbContent.append("<COMMON_NODE><NAME>EMAIL</NAME><VALUE>");
        sbContent.append(tsfsxx.get("email"));
        sbContent.append("<NAME>EMAIL</NAME></VALUE></COMMON_NODE>");
        sbContent.append("</COMMON_NODES>");
        sbContent.append("</TSFSXX>");
        sbContent.append("<FPXXS class=\"FPXX;\" size=\"");
        sbContent.append(fpxxs.size());
        sbContent.append("\">");
        for (Map<String, String> map : fpxxs) {
            sbContent.append("<FPXX>");
            sbContent.append("<COMMON_NODES class=\"COMMON_NODE;\" size=\"4\">");
            sbContent.append("<COMMON_NODE><NAME>FPQQLSH</NAME><VALUE>");
            sbContent.append(map.get("fpqqlsh"));
            sbContent.append("<NAME>EMAIL</NAME></VALUE></COMMON_NODE>");
            sbContent.append("<COMMON_NODE><NAME>NSRSBH</NAME><VALUE>");
            sbContent.append(map.get("nsrsbh"));
            sbContent.append("<NAME>EMAIL</NAME></VALUE></COMMON_NODE>");
            sbContent.append("<COMMON_NODE><NAME>FP_DM</NAME><VALUE>");
            sbContent.append(map.get("fpDm"));
            sbContent.append("<NAME>EMAIL</NAME></VALUE></COMMON_NODE>");
            sbContent.append("<COMMON_NODE><NAME>FP_HM</NAME><VALUE>");
            sbContent.append(map.get("fpHm"));
            sbContent.append("<NAME>EMAIL</NAME></VALUE></COMMON_NODE>");
            sbContent.append("</COMMON_NODES>");
            sbContent.append("</FPXX>");
        }
        sbContent.append("<FPXXS>");
        sbContent.append("</REQUEST_EMAILPHONEFPTS>");
        return sbContent.toString();
    }

    /**
     * 获取企业可用发票数量 API 编码： ECXML.QY.KYFPSL
     * @return
     */
    public String getKyfpslContentByInterfaceCode() {
        StringBuilder sbContent = new StringBuilder();
        sbContent.append("<REQUEST_KYFPSL class=\"REQUEST_KYFPSL\"><NSRSBH>");
        sbContent.append(TAXPAYERID);
        sbContent.append("</NSRSBH></REQUEST_KYFPSL>");
        return sbContent.toString();
    }
}
