package com.example.util.common.dbTOdoc;

import com.example.util.common.JDBCUtils;
import com.example.util.common.StringUtil;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.util.LocaleUtil;
import org.apache.poi.util.Units;
import org.apache.poi.xwpf.model.XWPFHeaderFooterPolicy;
import org.apache.poi.xwpf.usermodel.*;
import org.apache.xmlbeans.impl.xb.xmlschema.SpaceAttribute;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.*;

import java.io.*;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 数据库生成文档
 *
 * @author Wei.Guang
 * @create 2018-09-26 9:22
 **/
public class DBDataToWord {

    /**
     * 生成字段名称
     */
    public static String[] FILEDS = new String[]{"字段名", "字段类型", "长度", "主键/外键", "默认值", "描述"};

    /**
     * 单元格宽度
     */
    public static int[] COLUMN_WIDTHS = new int[]{1504, 1504, 1504, 1504, 1504, 1504};

    /**
     * 生成字段名称
     */
    public static String[] FILED_NAMES = new String[]{"COLUMN_NAME", "DATA_TYPE", "COLUMN_TYPE", "COLUMN_KEY", "COLUMN_DEFAULT", "COLUMN_COMMENT"};

    /**
     * 数据库名称
     */
    public static String DATABASE = "commerce";

    private static final AtomicInteger atomicInteger = new AtomicInteger(10000);
    private static BigInteger markId;

    public static void main(String[] args) throws Exception {
        Map<String, Object> params = new LinkedHashMap<>();
        JDBCUtils jdbcUtils = new JDBCUtils();
        List<Map<String, Object>> list = jdbcUtils.findModeResult("select table_name, table_comment from information_schema.tables WHERE table_schema = ?", Arrays.asList("commerce"));
        jdbcUtils.releaseConn();
        if (CollectionUtils.isNotEmpty(list)) {
            for (Map map : list) {
                params.put((String) map.get("TABLE_NAME"), map.get("TABLE_COMMENT"));
            }
            XWPFDocument xdoc = new XWPFDocument();
            DBDataToWord xsg_data = new DBDataToWord();
            CTSdtBlock block = CustomTOC(xdoc);
            for (Map.Entry<String, Object> entry : params.entrySet()) {
                String tableName = entry.getKey();
                String tableName_CN = String.valueOf(entry.getValue());
                xsg_data.createTable(xdoc, tableName, tableName_CN);
            }
            List<XWPFParagraph> paragraphs = xdoc.getParagraphs();
            for (XWPFParagraph par : paragraphs) {
                String parStyle = par.getStyle();
                if (parStyle != null && parStyle.startsWith("Heading")) {
                    List<CTBookmark> bookmarkList = par.getCTP().getBookmarkStartList();
                    try {
                        int level = Integer.parseInt(parStyle.substring("Heading".length()));
                        if (level == 1) {
                            // 添加栏目
                            addRowOnlyTitle(block, level, par.getText());
                        } else if (level == 2) {
                            // 添加标题
                            addRow(block, level, par.getText(), level, bookmarkList.get(0).getName());
                        }
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                }
            }
            createHeader(xdoc, "C:\\Users\\guang\\Desktop\\logo.jpg");
            createFooter(xdoc, "淘 美 妆 商 会");
            // 强制执行制度保护
            //xdoc.enforceReadonlyProtection();
            xsg_data.saveDocument(xdoc, "e:/" + "commerce" + ".docx");
        }

    }

    /**
     * core code	 * @param xdoc	 * @param tableName	 * @param tableName_CN	 * @throws Exception
     */
    public void createTable(XWPFDocument xdoc, String tableName, String tableName_CN) throws Exception {
        //查数据有多少列
        Connection conn = JDBCUtils.getConnection();
        String sql = "select count(1) from (" + getTableSql(DATABASE, tableName) + ")t";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int count = 1;
        if (rs.next()) {
            count = rs.getInt(1);
        }

        setCustomHeadingStyle(xdoc, "Heading1", 1);
        XWPFParagraph p = xdoc.createParagraph();
        setParagraphSpacingInfo(p, true, "0", "80", null, null, true, "500", STLineSpacingRule.EXACT);
        setParagraphAlignInfo(p, ParagraphAlignment.CENTER, TextAlignment.CENTER);
        XWPFRun pRun = getOrAddParagraphFirstRun(p, 1, false, false, null);
        /**
         * 设置标题头 start
         */
        setParagraphRunFontInfo(p, pRun, tableName_CN, "宋体", "华文楷体", "36", true, false, false, false, null, null, 0, 0, 90, "9A32CD", true);

        setCustomHeadingStyle(xdoc, "Heading2", 2);
        p = xdoc.createParagraph();
        setParagraphSpacingInfo(p, true, "0", "80", null, null, true, "500", STLineSpacingRule.EXACT);
        setParagraphAlignInfo(p, ParagraphAlignment.CENTER, TextAlignment.CENTER);
        pRun = getOrAddParagraphFirstRun(p, 2, false, false, tableName);
        setParagraphRunFontInfo(p, pRun, tableName, "宋体", "华文楷体", "36", true, false, false, false, null, null, 0, 0, 90, "9A32CD", true);
        addParagraphContentBookmarkEnd(p, markId);

        p = xdoc.createParagraph();
        setParagraphSpacingInfo(p, true, "0", "0", "0", "0", true, "240", STLineSpacingRule.AUTO);
        setParagraphAlignInfo(p, ParagraphAlignment.LEFT, TextAlignment.CENTER);
        pRun = getOrAddParagraphFirstRun(p, 0, false, false, null);
        // 创建表格21行3列
        XWPFTable table = xdoc.createTable((count == 1 ? 1 : count + 1), FILEDS.length);
        setTableBorders(table, STBorder.SINGLE, "4", "00CD00", "0");
        setTableWidthAndHAlign(table, "9024", STJc.CENTER);
        setTableCellMargin(table, 0, 108, 0, 108);
        setTableGridCol(table, COLUMN_WIDTHS);
        XWPFTableRow row = table.getRow(0);
        setRowHeight(row, "460");
        XWPFTableCell cell = row.getCell(0);
        setCellShdStyle(cell, true, "FFFFFF", null);

        p = getCellFirstParagraph(cell);
        pRun = getOrAddParagraphFirstRun(p, 0, false, false, null);
        int index = 0;
        //创建行
        row = table.getRow(index);
        setRowHeight(row, "567");
        //创建列
        for (int i = 0; i < FILEDS.length; i++) {
            cell = row.getCell(i);
            setCellShdStyle(cell, true, "FFFACD", STShd.SOLID);
            setCellWidthAndVAlign(cell, String.valueOf(COLUMN_WIDTHS[i]), STTblWidth.DXA, STVerticalJc.CENTER);
            p = getCellFirstParagraph(cell);
            pRun = getOrAddParagraphFirstRun(p, 0, false, false, null);
            setParagraphRunFontInfo(p, pRun, FILEDS[i], "宋体", "Times New Roman", "21", true, false, false, false, null, null, 0, 6, 0, "8B2500", false);
        }
        index = 1;
        //查询数据库表
        sql = getTableSql(DATABASE, tableName);
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
        ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();
        while (rs.next()) {
            row = table.getRow(index);
            for (int i = 0; i < columnCount; i++) {
                String filedName = FILED_NAMES[i];
                String columnValue = rs.getString(filedName) == null ? "" : rs.getString(FILED_NAMES[i]);
                if ("COLUMN_TYPE".equals(filedName.toUpperCase())) {
                    try {
                        String tmp = columnValue.substring(columnValue.indexOf("(") + 1, columnValue.length() - 1);
                        Integer.parseInt(tmp);
                        columnValue = tmp;
                    } catch (Exception e) {
                        columnValue = columnValue;
                    }
                }
                cell = row.getCell(i);
                setCellWidthAndVAlign(cell, String.valueOf(COLUMN_WIDTHS[i]), STTblWidth.DXA, STVerticalJc.TOP);
                p = getCellFirstParagraph(cell);
                pRun = getOrAddParagraphFirstRun(p, 0, false, false, null);
                setParagraphRunFontInfo(p, pRun, columnValue, "宋体", "Times New Roman", "21", false, false, false, false, null, null, 0, 6, 0, "8968CD", false);
            }
            index++;
        }
        System.out.println("创建【" + tableName_CN + "】成功！");
    }

    private String getTableSql(String database, String tableName) {
        return "select COLUMN_NAME,DATA_TYPE,COLUMN_TYPE,COLUMN_KEY,COLUMN_DEFAULT,COLUMN_COMMENT from information_schema.columns " + "where table_schema = '" + database + "' " + "and table_name = '" + tableName + "'";
    }

    /**
     * @Description: 设置Table的边框
     */
    public void setTableBorders(XWPFTable table, STBorder.Enum borderType, String size, String color, String space) {
        CTTblPr tblPr = getTableCTTblPr(table);
        CTTblBorders borders = tblPr.isSetTblBorders() ? tblPr.getTblBorders() : tblPr.addNewTblBorders();
        CTBorder hBorder = borders.isSetInsideH() ? borders.getInsideH() : borders.addNewInsideH();
        hBorder.setVal(borderType);
        hBorder.setSz(new BigInteger(size));
        hBorder.setColor(color);
        hBorder.setSpace(new BigInteger(space));
        CTBorder vBorder = borders.isSetInsideV() ? borders.getInsideV() : borders.addNewInsideV();
        vBorder.setVal(borderType);
        vBorder.setSz(new BigInteger(size));
        vBorder.setColor(color);
        vBorder.setSpace(new BigInteger(space));
        CTBorder lBorder = borders.isSetLeft() ? borders.getLeft() : borders.addNewLeft();
        lBorder.setVal(borderType);
        lBorder.setSz(new BigInteger(size));
        lBorder.setColor(color);
        lBorder.setSpace(new BigInteger(space));
        CTBorder rBorder = borders.isSetRight() ? borders.getRight() : borders.addNewRight();
        rBorder.setVal(borderType);
        rBorder.setSz(new BigInteger(size));
        rBorder.setColor(color);
        rBorder.setSpace(new BigInteger(space));
        CTBorder tBorder = borders.isSetTop() ? borders.getTop() : borders.addNewTop();
        tBorder.setVal(borderType);
        tBorder.setSz(new BigInteger(size));
        tBorder.setColor(color);
        tBorder.setSpace(new BigInteger(space));
        CTBorder bBorder = borders.isSetBottom() ? borders.getBottom() : borders.addNewBottom();
        bBorder.setVal(borderType);
        bBorder.setSz(new BigInteger(size));
        bBorder.setColor(color);
        bBorder.setSpace(new BigInteger(space));
    }

    /**
     * @Description: 得到Table的CTTblPr, 不存在则新建
     */
    public CTTblPr getTableCTTblPr(XWPFTable table) {
        CTTbl ttbl = table.getCTTbl();
        CTTblPr tblPr = ttbl.getTblPr() == null ? ttbl.addNewTblPr() : ttbl.getTblPr();
        return tblPr;
    }

    /**
     * @Description: 设置表格总宽度与水平对齐方式
     */
    public void setTableWidthAndHAlign(XWPFTable table, String width, STJc.Enum enumValue) {
        CTTblPr tblPr = getTableCTTblPr(table);
        CTTblWidth tblWidth = tblPr.isSetTblW() ? tblPr.getTblW() : tblPr.addNewTblW();
        if (enumValue != null) {
            CTJc cTJc = tblPr.addNewJc();
            cTJc.setVal(enumValue);
        }
        tblWidth.setW(new BigInteger(width));
        tblWidth.setType(STTblWidth.DXA);
    }

    /**
     * @Description: 设置单元格Margin
     */
    public void setTableCellMargin(XWPFTable table, int top, int left, int bottom, int right) {
        table.setCellMargins(top, left, bottom, right);
    }

    /**
     * @Description: 设置表格列宽
     */
    public void setTableGridCol(XWPFTable table, int[] colWidths) {
        CTTbl ttbl = table.getCTTbl();
        CTTblGrid tblGrid = ttbl.getTblGrid() != null ? ttbl.getTblGrid() : ttbl.addNewTblGrid();
        for (int j = 0, len = colWidths.length; j < len; j++) {
            CTTblGridCol gridCol = tblGrid.addNewGridCol();
            gridCol.setW(new BigInteger(String.valueOf(colWidths[j])));
        }
    }

    /**
     * @Description: 设置行高
     */
    public void setRowHeight(XWPFTableRow row, String hight) {
        CTTrPr trPr = getRowCTTrPr(row);
        CTHeight trHeight;
        trHeight = trPr.addNewTrHeight();
        trHeight.setVal(new BigInteger(hight));
    }

    /**
     * @Description: 设置底纹
     */
    public void setCellShdStyle(XWPFTableCell cell, boolean isShd, String shdColor, STShd.Enum shdStyle) {
        CTTcPr tcPr = getCellCTTcPr(cell);
        if (isShd) {
            // 设置底纹
            CTShd shd = tcPr.isSetShd() ? tcPr.getShd() : tcPr.addNewShd();
            if (shdStyle != null) {
                shd.setVal(shdStyle);
            }
            if (shdColor != null) {
                shd.setColor(shdColor);
                shd.setFill(shdColor);
            }
        }
    }

    /**
     * @Description: 得到CTTrPr, 不存在则新建
     */
    public CTTrPr getRowCTTrPr(XWPFTableRow row) {
        CTRow ctRow = row.getCtRow();
        CTTrPr trPr = ctRow.isSetTrPr() ? ctRow.getTrPr() : ctRow.addNewTrPr();
        return trPr;
    }

    /**
     * * @Description: 得到Cell的CTTcPr,不存在则新建
     */
    public CTTcPr getCellCTTcPr(XWPFTableCell cell) {
        CTTc cttc = cell.getCTTc();
        CTTcPr tcPr = cttc.isSetTcPr() ? cttc.getTcPr() : cttc.addNewTcPr();
        return tcPr;
    }

    /**
     * @Description: 设置段落间距信息, 一行=100 一磅=20
     */
    public void setParagraphSpacingInfo(XWPFParagraph p, boolean isSpace, String before, String after, String beforeLines, String afterLines, boolean isLine, String line, STLineSpacingRule.Enum lineValue) {
        CTPPr pPPr = getParagraphCTPPr(p);
        CTSpacing pSpacing = pPPr.getSpacing() != null ? pPPr.getSpacing() : pPPr.addNewSpacing();
        if (isSpace) {
            // 段前磅数
            if (before != null) {
                pSpacing.setBefore(new BigInteger(before));
            }
            // 段后磅数
            if (after != null) {
                pSpacing.setAfter(new BigInteger(after));
            }
            // 段前行数
            if (beforeLines != null) {
                pSpacing.setBeforeLines(new BigInteger(beforeLines));
            }
            // 段后行数
            if (afterLines != null) {
                pSpacing.setAfterLines(new BigInteger(afterLines));
            }
        }
        // 间距
        if (isLine) {
            if (line != null) {
                pSpacing.setLine(new BigInteger(line));
            }
            if (lineValue != null) {
                pSpacing.setLineRule(lineValue);
            }
        }
    }

    /**
     * @Description: 得到段落CTPPr
     */
    public CTPPr getParagraphCTPPr(XWPFParagraph p) {
        CTPPr pPPr = null;
        if (p.getCTP() != null) {
            if (p.getCTP().getPPr() != null) {
                pPPr = p.getCTP().getPPr();
            } else {
                pPPr = p.getCTP().addNewPPr();
            }
        }
        return pPPr;
    }

    /**
     * @Description: 设置段落对齐
     */
    public void setParagraphAlignInfo(XWPFParagraph p, ParagraphAlignment pAlign, TextAlignment valign) {
        if (pAlign != null) {
            p.setAlignment(pAlign);
        }
        if (valign != null) {
            p.setVerticalAlignment(valign);
        }
    }

    public XWPFRun getOrAddParagraphFirstRun(XWPFParagraph p, int level, boolean isInsert, boolean isNewLine, String bookMarkName) {
        XWPFRun pRun;
        if (level == 1) {
            p.setStyle("Heading1");
        } else if (level == 2) {
            CTBookmark bookStart = p.getCTP().addNewBookmarkStart();
            markId = BigInteger.valueOf(atomicInteger.getAndIncrement());
            System.out.println(markId);
            bookStart.setId(markId);
            bookStart.setName(bookMarkName);
            p.setStyle("Heading2");
        }

        if (isInsert) {
            pRun = p.createRun();
        } else {
            if (p.getRuns() != null && p.getRuns().size() > 0) {
                pRun = p.getRuns().get(0);
            } else {
                pRun = p.createRun();
            }
        }

        return pRun;
    }

    /**
     * @Description: 得到单元格第一个Paragraph
     */
    public XWPFParagraph getCellFirstParagraph(XWPFTableCell cell) {
        XWPFParagraph p;
        if (cell.getParagraphs() != null && cell.getParagraphs().size() > 0) {
            p = cell.getParagraphs().get(0);
        } else {
            p = cell.addParagraph();
        }
        return p;
    }

    /**
     * @Description: 设置列宽和垂直对齐方式
     */
    public void setCellWidthAndVAlign(XWPFTableCell cell, String width, STTblWidth.Enum typeEnum, STVerticalJc.Enum vAlign) {
        CTTcPr tcPr = getCellCTTcPr(cell);
        CTTblWidth tcw = tcPr.isSetTcW() ? tcPr.getTcW() : tcPr.addNewTcW();
        if (width != null) {
            tcw.setW(new BigInteger(width));
        }
        if (typeEnum != null) {
            tcw.setType(typeEnum);
        }
        if (vAlign != null) {
            CTVerticalJc vJc = tcPr.isSetVAlign() ? tcPr.getVAlign() : tcPr.addNewVAlign();
            vJc.setVal(vAlign);
        }
    }

    /**
     * @param verticalAlign : SUPERSCRIPT上标 SUBSCRIPT下标
     * @param position      :字符间距位置：>0提升 <0降低=磅值*2 如3磅=6
     * @param spacingValue  :字符间距间距 >0加宽 <0紧缩 =磅值*20 如2磅=40
     * @param indent        :字符间距缩进 <100 缩
     * @param colorVal      字体颜色
     * @Description: 设置段落文本样式(高亮与底纹显示效果不同)设置字符间距信息(CTSignedTwipsMeasure)
     */
    public void setParagraphRunFontInfo(XWPFParagraph p, XWPFRun pRun, String content, String cnFontFamily, String enFontFamily, String fontSize, boolean isBlod, boolean isItalic, boolean isStrike, boolean isShd, String shdColor, STShd.Enum shdStyle, int position, int spacingValue, int indent, String colorVal, boolean isShadow) {
        CTRPr pRpr = getRunCTRPr(p, pRun);
        if (StringUtils.isNotBlank(content)) {
            pRun.setText(content);
            if (content.contains("\n")) {
                System.out.println("line.separator");
                String[] lines = content.split("\n");
                pRun.setText(lines[0], 0);
                // set first line into XWPFRun
                for (int i = 1; i < lines.length; i++) {
                    // add break and insert new text
                    pRun.addBreak();
                    pRun.setText(lines[i]);
                }
            } else {
                pRun.setText(content, 0);
            }
        }

        // 设置字体
        CTFonts fonts = pRpr.isSetRFonts() ? pRpr.getRFonts() : pRpr.addNewRFonts();
        if (StringUtils.isNotBlank(enFontFamily)) {
            fonts.setAscii(enFontFamily);
            fonts.setHAnsi(enFontFamily);
        }
        if (StringUtils.isNotBlank(cnFontFamily)) {
            fonts.setEastAsia(cnFontFamily);
        }

        // 设置字体大小
        CTHpsMeasure sz = pRpr.isSetSz() ? pRpr.getSz() : pRpr.addNewSz();
        sz.setVal(new BigInteger(fontSize));
        CTHpsMeasure szCs = pRpr.isSetSzCs() ? pRpr.getSzCs() : pRpr.addNewSzCs();
        szCs.setVal(new BigInteger(fontSize));
        // 设置字体样式
        // 加粗
        if (isBlod) {
            pRun.setBold(isBlod);
        }
        // 倾斜
        if (isItalic) {
            pRun.setItalic(isItalic);
        }
        // 删除线
        if (isStrike) {
            pRun.setStrike(isStrike);
        }
        // 字体颜色
        if (StringUtil.isNotBlank(colorVal)) {
            pRun.setColor(colorVal);
        }
        // 文本会变粗有重影
        if (isShadow) {
            pRun.setShadow(true);
        }

        if (isShd) {
            // 设置底纹
            CTShd shd = pRpr.isSetShd() ? pRpr.getShd() : pRpr.addNewShd();
            if (shdStyle != null) {
                shd.setVal(shdStyle);
            }
            if (shdColor != null) {
                shd.setColor(shdColor);
                shd.setFill(shdColor);
            }
        }
        // 设置文本位置
        if (position != 0) {
            pRun.setTextPosition(position);
        }
    }

    /**
     * 增加自定义标题样式。这里用的是stackoverflow的源码
     *
     * @param docxDocument 目标文档
     * @param strStyleId   样式名称
     * @param headingLevel 样式级别
     */
    public static void setCustomHeadingStyle(XWPFDocument docxDocument, String strStyleId, int headingLevel) {
        CTStyle ctStyle = CTStyle.Factory.newInstance();
        ctStyle.setStyleId(strStyleId);

        CTString styleName = CTString.Factory.newInstance();
        styleName.setVal(strStyleId);
        ctStyle.setName(styleName);

        CTDecimalNumber indentNumber = CTDecimalNumber.Factory.newInstance();
        indentNumber.setVal(BigInteger.valueOf(headingLevel));

        // lower number > style is more prominent in the formats bar
        ctStyle.setUiPriority(indentNumber);

        CTOnOff onoffnull = CTOnOff.Factory.newInstance();
        ctStyle.setUnhideWhenUsed(onoffnull);

        // style shows up in the formats bar
        ctStyle.setQFormat(onoffnull);

        // style defines a heading of the given level
        CTPPr ppr = CTPPr.Factory.newInstance();
        ppr.setOutlineLvl(indentNumber);
        ctStyle.setPPr(ppr);

        XWPFStyle style = new XWPFStyle(ctStyle);

        // is a null op if already defined
        XWPFStyles styles = docxDocument.createStyles();

        style.setType(STStyleType.PARAGRAPH);
        styles.addStyle(style);
    }

    /**
     * @Description: 跨列合并
     */
    public void mergeCellsHorizontal(XWPFTable table, int row, int fromCell, int toCell) {
        for (int cellIndex = fromCell; cellIndex <= toCell; cellIndex++) {
            XWPFTableCell cell = table.getRow(row).getCell(cellIndex);
            if (cellIndex == fromCell) {
                // The first merged cell is set with RESTART merge value
                getCellCTTcPr(cell).addNewHMerge().setVal(STMerge.RESTART);
            } else {
                // Cells which join (merge) the first one,are set with CONTINUE
                getCellCTTcPr(cell).addNewHMerge().setVal(STMerge.CONTINUE);
            }
        }
    }

    /**
     * @Description: 得到XWPFRun的CTRPr
     */
    public CTRPr getRunCTRPr(XWPFParagraph p, XWPFRun pRun) {
        CTRPr pRpr = null;
        if (pRun.getCTR() != null) {
            pRpr = pRun.getCTR().getRPr();
            if (pRpr == null) {
                pRpr = pRun.getCTR().addNewRPr();
            }
        } else {
            pRpr = p.getCTP().addNewR().addNewRPr();
        }
        return pRpr;
    }

    /**
     * @Description: 保存文档
     */
    public void saveDocument(XWPFDocument document, String savePath) throws Exception {
        FileOutputStream fos = new FileOutputStream(savePath);
        document.write(fos);
        fos.close();
    }

    /**
     * 标签末尾
     *
     * @param p
     * @param markId
     */
    public void addParagraphContentBookmarkEnd(XWPFParagraph p, BigInteger markId) {
        CTMarkupRange bookEnd = p.getCTP().addNewBookmarkEnd();
        bookEnd.setId(markId);
    }

    /**
     * 设置目录
     *
     * @param xdoc
     * @return
     */
    public static CTSdtBlock CustomTOC(XWPFDocument xdoc) {
        CTSdtBlock block = xdoc.getDocument().getBody().addNewSdt();
        //setCustomHeadingStyle(xdoc, "Heading1", 1);
        CTSdtPr sdtPr = block.addNewSdtPr();
        CTDecimalNumber id = sdtPr.addNewId();
        id.setVal(new BigInteger("4844945"));
        sdtPr.addNewDocPartObj().addNewDocPartGallery().setVal("Table of contents");
        CTSdtEndPr sdtEndPr = block.addNewSdtEndPr();
        CTRPr rPr = sdtEndPr.addNewRPr();
        CTFonts fonts = rPr.addNewRFonts();
        fonts.setAsciiTheme(STTheme.MINOR_H_ANSI);
        fonts.setEastAsiaTheme(STTheme.MINOR_H_ANSI);
        fonts.setHAnsiTheme(STTheme.MINOR_H_ANSI);
        fonts.setCstheme(STTheme.MINOR_BIDI);
        rPr.addNewB().setVal(STOnOff.OFF);
        rPr.addNewBCs().setVal(STOnOff.OFF);
        rPr.addNewColor().setVal("auto");
        rPr.addNewSz().setVal(new BigInteger("24"));
        rPr.addNewSzCs().setVal(new BigInteger("24"));
        CTSdtContentBlock content = block.addNewSdtContent();
        CTP p = content.addNewP();
        p.setRsidR("00EF7E24".getBytes(LocaleUtil.CHARSET_1252));
        p.setRsidRDefault("00EF7E24".getBytes(LocaleUtil.CHARSET_1252));
        p.addNewPPr().addNewPStyle().setVal("TOCHeading");
        p.addNewR().addNewT().setStringValue("目     录");
        // 设置段落对齐方式，即将“目录”二字居中
        CTPPr pr = p.getPPr();
        CTJc jc = pr.isSetJc() ? pr.getJc() : pr.addNewJc();
        STJc.Enum en = STJc.Enum.forInt(ParagraphAlignment.CENTER.getValue());
        jc.setVal(en);
        // "目录"二字的字体
        CTRPr pRpr = p.getRArray(0).addNewRPr();
        fonts = pRpr.isSetRFonts() ? pRpr.getRFonts() : pRpr.addNewRFonts();
        fonts.setAscii("Times New Roman");
        fonts.setEastAsia("华文中宋");
        fonts.setHAnsi("华文中宋");
        // "目录"二字加粗
        CTOnOff bold = pRpr.isSetB() ? pRpr.getB() : pRpr.addNewB();
        bold.setVal(STOnOff.TRUE);
        // 设置“目录”二字字体大小为24号
        CTHpsMeasure sz = pRpr.isSetSz() ? pRpr.getSz() : pRpr.addNewSz();
        sz.setVal(new BigInteger("36"));
        return block;
    }

    /**
     * 添加标题
     *
     * @param block
     * @param level
     * @param title
     * @param page
     * @param bookmarkRef
     */
    public static void addRow(CTSdtBlock block, int level, String title, int page, String bookmarkRef) {
        CTSdtContentBlock contentBlock = block.getSdtContent();
        CTP p = contentBlock.addNewP();
        p.setRsidR("00EF7E24".getBytes(LocaleUtil.CHARSET_1252));
        p.setRsidRDefault("00EF7E24".getBytes(LocaleUtil.CHARSET_1252));
        CTPPr pPr = p.addNewPPr();
        pPr.addNewPStyle().setVal("TOC" + level);
        CTTabs tabs = pPr.addNewTabs();
        CTTabStop tab = tabs.addNewTab();
        tab.setVal(STTabJc.RIGHT);
        tab.setLeader(STTabTlc.DOT);
        tab.setPos(new BigInteger("9100"));
        pPr.addNewRPr().addNewNoProof();

        // STFldCharType.BEGIN标识与结尾处STFldCharType.END相对应
        CTR run = p.addNewR();
        run.addNewRPr().addNewNoProof();
        run.addNewFldChar().setFldCharType(STFldCharType.BEGIN);
        // pageref run
        run = p.addNewR();
        run.addNewRPr().addNewNoProof();
        CTText text = run.addNewInstrText();
        text.setSpace(SpaceAttribute.Space.PRESERVE);
        // bookmark reference
        // 源码的域名为" PAGEREF _Toc","\h"含义为在目录内建立目录项与页码的超链接
        text.setStringValue(" PAGEREF " + bookmarkRef + " \\h ");
        p.addNewR().addNewRPr().addNewNoProof();
        run = p.addNewR();
        run.addNewRPr().addNewNoProof();
        run.addNewFldChar().setFldCharType(STFldCharType.SEPARATE);

        run = p.addNewR();
        run.addNewRPr().addNewNoProof();
        run.addNewT().setStringValue(title);
        // 设置标题字体
        CTRPr pRpr = run.getRPr();
        CTFonts fonts = pRpr.isSetRFonts() ? pRpr.getRFonts() : pRpr.addNewRFonts();
        fonts.setAscii("Times New Roman");
        fonts.setEastAsia("楷体");
        fonts.setHAnsi("楷体");
        // 设置标题字体大小
        CTHpsMeasure sz = pRpr.isSetSz() ? pRpr.getSz() : pRpr.addNewSz();
        sz.setVal(new BigInteger("21"));
        // 设置颜色
        CTColor ctColor = pRpr.isSetColor() ? pRpr.getColor() : pRpr.addNewColor();
        ctColor.setVal("6C7B8B");

        run = p.addNewR();
        run.addNewRPr().addNewNoProof();
        // STFldCharType.END标识与上面STFldCharType.BEGIN相对应
        run.addNewFldChar().setFldCharType(STFldCharType.END);

        // 添加制表符
        run = p.addNewR();
        run.addNewRPr().addNewNoProof();
        run.addNewTab();
        // 添加页码左括号
        p.addNewR().addNewT().setStringValue("(");
        // page number run
        run = p.addNewR();
        run.addNewRPr().addNewNoProof();
        run.addNewT().setStringValue(Integer.toString(page));
        // 添加页码右括号
        p.addNewR().addNewT().setStringValue(")");
        // 设置行间距
        CTSpacing pSpacing = pPr.getSpacing() != null ? pPr.getSpacing() : pPr.addNewSpacing();
        pSpacing.setLineRule(STLineSpacingRule.AUTO);
        pSpacing.setLine(new BigInteger("360"));
    }

    /**
     * 添加栏目
     *
     * @param block
     * @param level
     * @param title
     */
    public static void addRowOnlyTitle(CTSdtBlock block, int level, String title) {
        CTSdtContentBlock contentBlock = block.getSdtContent();
        CTP p = contentBlock.addNewP();
        p.setRsidR("00EF7E24".getBytes(LocaleUtil.CHARSET_1252));
        p.setRsidRDefault("00EF7E24".getBytes(LocaleUtil.CHARSET_1252));
        CTPPr pPr = p.addNewPPr();
        pPr.addNewPStyle().setVal("TOC" + level);
        CTTabs tabs = pPr.addNewTabs();
        CTTabStop tab = tabs.addNewTab();
        tab.setVal(STTabJc.RIGHT);
        tab.setLeader(STTabTlc.DOT);
        tab.setPos(new BigInteger("9190"));
        pPr.addNewRPr().addNewNoProof();
        CTR run = p.addNewR();
        run.addNewRPr().addNewNoProof();
        run.addNewT().setStringValue(title);
        // 设置行间距
        CTSpacing pSpacing = pPr.getSpacing() != null ? pPr.getSpacing() : pPr.addNewSpacing();
        pSpacing.setLineRule(STLineSpacingRule.AUTO);
        pSpacing.setLine(new BigInteger("360"));
        pSpacing.setBeforeLines(new BigInteger("20"));
        pSpacing.setAfterLines(new BigInteger("10"));
        // 设置字体
        CTRPr pRpr = run.getRPr();
        CTFonts fonts = pRpr.isSetRFonts() ? pRpr.getRFonts() : pRpr.addNewRFonts();
        fonts.setAscii("Times New Roman");
        fonts.setEastAsia("黑体");
        fonts.setHAnsi("黑体");
        // 设置字体大小
        CTHpsMeasure sz = pRpr.isSetSz() ? pRpr.getSz() : pRpr.addNewSz();
        sz.setVal(new BigInteger("24"));

        // 设置颜色
        CTColor ctColor = pRpr.isSetColor() ? pRpr.getColor() : pRpr.addNewColor();
        ctColor.setVal("EE9572");

        CTHpsMeasure szCs = pRpr.isSetSzCs() ? pRpr.getSzCs() : pRpr.addNewSzCs();
        szCs.setVal(new BigInteger("24"));
    }

    /**
     * 设置页眉
     *
     * @param doc
     * @param orgFullName
     * @param imgFile
     * @throws Exception
     */
    public static void createHeader(XWPFDocument doc, String imgFile) throws Exception {
        /*
         * 对页眉段落作处理，使公司logo图片在页眉左边，公司全称在页眉右边
         * */
        CTSectPr sectPr = doc.getDocument().getBody().addNewSectPr();
        XWPFHeaderFooterPolicy headerFooterPolicy = new XWPFHeaderFooterPolicy(doc, sectPr);
        XWPFHeader header = headerFooterPolicy.createHeader(XWPFHeaderFooterPolicy.DEFAULT);

        XWPFParagraph paragraph = header.getParagraphArray(0);
        paragraph.setAlignment(ParagraphAlignment.LEFT);
        paragraph.setBorderBottom(Borders.THICK);

        CTTabStop tabStop = paragraph.getCTP().getPPr().addNewTabs().addNewTab();
        tabStop.setVal(STTabJc.RIGHT);
        int twipsPerInch = 1440;
        tabStop.setPos(BigInteger.valueOf(6 * twipsPerInch));

        XWPFRun run = paragraph.createRun();
        setXWPFRunStyle(run, "新宋体", 10, "00FF00");

        /*
         * 根据公司logo在ftp上的路径获取到公司到图片字节流
         * 添加公司logo到页眉，logo在左边
         * */
        if (StringUtils.isNotBlank(imgFile)) {
            InputStream is = new FileInputStream(new File(imgFile));

            XWPFPicture picture = run.addPicture(is, XWPFDocument.PICTURE_TYPE_JPEG, imgFile, Units.toEMU(30), Units.toEMU(30));

            String blipID = "";
            // 这段必须有，不然打开的logo图片不显示
            for (XWPFPictureData picturedata : header.getAllPackagePictures()) {
                blipID = header.getRelationId(picturedata);
            }
            picture.getCTPicture().getBlipFill().getBlip().setEmbed(blipID);
            run.addTab();
            is.close();
        }

        /*
         * 添加字体页眉，公司全称
         * 公司全称在右边
         * */
        run = paragraph.createRun();
        CTFldChar fldChar = run.getCTR().addNewFldChar();
        fldChar.setFldCharType(STFldCharType.Enum.forString("begin"));

        run = paragraph.createRun();
        CTText ctText = run.getCTR().addNewInstrText();
        //ctText.setStringValue("TIME \\@ \"EEEE\"");
        //ctText.setStringValue("DATE \\@ \"yyyy\"");
        ctText.setStringValue("DATE \\@ \"h:mm am/pm\"");
        ctText.setSpace(SpaceAttribute.Space.Enum.forString("preserve"));
        run.setFontSize(11);
        CTRPr rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        CTFonts fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("微软雅黑");
        fonts.setEastAsia("微软雅黑");
        fonts.setHAnsi("微软雅黑");

        fldChar = run.getCTR().addNewFldChar();
        fldChar.setFldCharType(STFldCharType.Enum.forString("end"));

        run = paragraph.createRun();
        //run.setText("年");
        run.setText(" ");
        run.setFontSize(11);
        rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("微软雅黑");
        fonts.setEastAsia("微软雅黑");
        fonts.setHAnsi("微软雅黑");

        run = paragraph.createRun();
        fldChar = run.getCTR().addNewFldChar();
        fldChar.setFldCharType(STFldCharType.Enum.forString("begin"));

        run = paragraph.createRun();
        ctText = run.getCTR().addNewInstrText();
        //ctText.setStringValue("TIME \\@ \"O\"");
        //ctText.setStringValue("DATE \\@ \"M\"");
        ctText.setStringValue("DATE \\@ \"dddd\"");
        ctText.setSpace(SpaceAttribute.Space.Enum.forString("preserve"));
        run.setFontSize(11);
        rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("微软雅黑");
        fonts.setEastAsia("微软雅黑");
        fonts.setHAnsi("微软雅黑");

        fldChar = run.getCTR().addNewFldChar();
        fldChar.setFldCharType(STFldCharType.Enum.forString("end"));

        run = paragraph.createRun();
        //run.setText("月");
        run.setText(" ");
        run.setFontSize(11);
        rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("微软雅黑");
        fonts.setEastAsia("微软雅黑");
        fonts.setHAnsi("微软雅黑");

        run = paragraph.createRun();
        fldChar = run.getCTR().addNewFldChar();
        fldChar.setFldCharType(STFldCharType.Enum.forString("begin"));

        run = paragraph.createRun();
        ctText = run.getCTR().addNewInstrText();
        //ctText.setStringValue("TIME \\@ \"A\"");
        //ctText.setStringValue("DATE \\@ \"D\"");
        ctText.setStringValue("DATE \\@ \"MMMM d\"");
        ctText.setSpace(SpaceAttribute.Space.Enum.forString("preserve"));
        run.setFontSize(11);
        rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("微软雅黑");
        fonts.setEastAsia("微软雅黑");
        fonts.setHAnsi("微软雅黑");

        fldChar = run.getCTR().addNewFldChar();
        fldChar.setFldCharType(STFldCharType.Enum.forString("end"));

        run = paragraph.createRun();
        //run.setText("日");
        run.setText(" ");
        run.setFontSize(11);
        rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("微软雅黑");
        fonts.setEastAsia("微软雅黑");
        fonts.setHAnsi("微软雅黑");
    }

    /**
     * 设置页脚
     *
     * @param document
     * @throws Exception
     */
    public static void createFooter(XWPFDocument document, String content) throws Exception {
        CTP ctp = CTP.Factory.newInstance();
        XWPFParagraph paragraph = new XWPFParagraph(ctp, document);
        paragraph.setAlignment(ParagraphAlignment.LEFT);
        paragraph.setVerticalAlignment(TextAlignment.CENTER);
        paragraph.setBorderTop(Borders.THICK);
        CTTabStop tabStop = paragraph.getCTP().getPPr().addNewTabs().addNewTab();
        tabStop.setVal(STTabJc.RIGHT);
        int twipsPerInch = 1440;
        tabStop.setPos(BigInteger.valueOf(6 * twipsPerInch));

        XWPFRun run;

        if (StringUtil.isNotBlank(content)) {
            run = paragraph.createRun();
            run.setText(content);
            setXWPFRunStyle(run, "宋体", 12, "EE30A7");
            run.addTab();
        }

        run = paragraph.createRun();
        run.setText("第");
        run.setFontSize(11);
        CTRPr rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        CTFonts fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("宋体");
        fonts.setEastAsia("宋体");
        fonts.setHAnsi("宋体");

        run = paragraph.createRun();
        CTFldChar fldChar = run.getCTR().addNewFldChar();
        fldChar.setFldCharType(STFldCharType.Enum.forString("begin"));

        run = paragraph.createRun();
        CTText ctText = run.getCTR().addNewInstrText();
        ctText.setStringValue("PAGE  \\* MERGEFORMAT");
        ctText.setSpace(SpaceAttribute.Space.Enum.forString("preserve"));
        run.setFontSize(11);
        rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("宋体");
        fonts.setEastAsia("宋体");
        fonts.setHAnsi("宋体");

        fldChar = run.getCTR().addNewFldChar();
        fldChar.setFldCharType(STFldCharType.Enum.forString("end"));

        run = paragraph.createRun();
        run.setText("页 总共");
        run.setFontSize(11);
        rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("宋体");
        fonts.setEastAsia("宋体");
        fonts.setHAnsi("宋体");

        run = paragraph.createRun();
        fldChar = run.getCTR().addNewFldChar();
        fldChar.setFldCharType(STFldCharType.Enum.forString("begin"));

        run = paragraph.createRun();
        ctText = run.getCTR().addNewInstrText();
        ctText.setStringValue("NUMPAGES  \\* MERGEFORMAT ");
        ctText.setSpace(SpaceAttribute.Space.Enum.forString("preserve"));
        run.setFontSize(11);
        rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("宋体");
        fonts.setEastAsia("宋体");
        fonts.setHAnsi("宋体");

        fldChar = run.getCTR().addNewFldChar();
        fldChar.setFldCharType(STFldCharType.Enum.forString("end"));

        run = paragraph.createRun();
        run.setText("页");
        run.setFontSize(11);
        rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii("宋体");
        fonts.setEastAsia("宋体");
        fonts.setHAnsi("宋体");

        XWPFParagraph[] newparagraphs = new XWPFParagraph[1];
        newparagraphs[0] = paragraph;
        CTSectPr sectPr = document.getDocument().getBody().addNewSectPr();
        XWPFHeaderFooterPolicy headerFooterPolicy = new XWPFHeaderFooterPolicy(document, sectPr);
        headerFooterPolicy.createFooter(STHdrFtr.DEFAULT, newparagraphs);
    }

    /**
     * 设置页脚样式
     *
     * @param run
     * @param font
     * @param fontSize
     */
    private static void setXWPFRunStyle(XWPFRun run, String font, int fontSize, String color) {
        run.setFontSize(fontSize);
        CTRPr rpr = run.getCTR().isSetRPr() ? run.getCTR().getRPr() : run.getCTR().addNewRPr();
        CTFonts fonts = rpr.isSetRFonts() ? rpr.getRFonts() : rpr.addNewRFonts();
        fonts.setAscii(font);
        fonts.setEastAsia(font);
        fonts.setHAnsi(font);
        if (StringUtil.isNotBlank(color)) {
            run.setColor(color);
        }
    }

}
