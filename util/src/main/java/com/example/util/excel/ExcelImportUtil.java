package com.example.util.excel;

import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.result.ExcelImportResult;
import cn.afterturn.easypoi.excel.imports.sax.SaxReadExcel;
import cn.afterturn.easypoi.excel.imports.sax.parse.ISaxRowRead;
import cn.afterturn.easypoi.exception.excel.ExcelImportException;
import cn.afterturn.easypoi.handler.inter.IExcelReadRowHanlder;
import org.apache.poi.util.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

/**
 * @author Wei.Guang
 * @create 2018-07-17 16:02
 **/
public class ExcelImportUtil {

    private ExcelImportUtil() {
    }

    private static final Logger LOGGER = LoggerFactory.getLogger(ExcelImportUtil.class);

    /**
     * Excel 导入 数据源本地文件,不返回校验结果 导入 字 段类型 Integer,Long,Double,Date,String,Boolean
     *
     * @param file
     * @param pojoClass
     * @param params
     * @return
     */
    public static <T> List<T> importExcel(File file, Class<?> pojoClass, ImportParams params) {
        FileInputStream in = null;
        try {
            in = new FileInputStream(file);
            return new ExcelImportServer().importExcelByIs(in, pojoClass, params).getList();
        } catch (ExcelImportException e) {
            throw new ExcelImportException(e.getType(), e);
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new ExcelImportException(e.getMessage(), e);
        } finally {
            IOUtils.closeQuietly(in);
        }
    }

    /**
     * Excel 导入 数据源IO流,不返回校验结果 导入 字段类型 Integer,Long,Double,Date,String,Boolean
     *
     * @param inputstream
     * @param pojoClass
     * @param params
     * @return
     * @throws Exception
     */
    public static <T> List<T> importExcel(InputStream inputstream, Class<?> pojoClass,
                                          ImportParams params) throws Exception {
        return new ExcelImportServer().importExcelByIs(inputstream, pojoClass, params).getList();
    }

    /**
     * Excel 导入 数据源IO流 字段类型 Integer,Long,Double,Date,String,Boolean
     * 支持校验,支持Key-Value
     *
     * @param inputstream
     * @param pojoClass
     * @param params
     * @return
     * @throws Exception
     */
    public static <T> ExcelImportResult<T> importExcelMore(InputStream inputstream,
                                                           Class<?> pojoClass,
                                                           ImportParams params) throws Exception {
        return new ExcelImportServer().importExcelByIs(inputstream, pojoClass, params);
    }

    /**
     * Excel 导入 数据源本地文件 字段类型 Integer,Long,Double,Date,String,Boolean
     * 支持校验,支持Key-Value
     *
     * @param file
     * @param pojoClass
     * @param params
     * @return
     */
    public static <T> ExcelImportResult<T> importExcelMore(File file, Class<?> pojoClass,
                                                           ImportParams params) {
        FileInputStream in = null;
        try {
            in = new FileInputStream(file);
            return new ExcelImportServer().importExcelByIs(in, pojoClass, params);
        } catch (ExcelImportException e) {
            throw new ExcelImportException(e.getType(), e);
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            throw new ExcelImportException(e.getMessage(), e);
        } finally {
            IOUtils.closeQuietly(in);
        }
    }

    /**
     * Excel 通过SAX解析方法,适合大数据导入,不支持图片
     * 导入 数据源IO流,不返回校验结果 导入 字段类型 Integer,Long,Double,Date,String,Boolean
     *
     * @param inputstream
     * @param pojoClass
     * @param params
     * @return
     */
    public static <T> List<T> importExcelBySax(InputStream inputstream, Class<?> pojoClass,
                                               ImportParams params) {
        return new SaxReadExcel().readExcel(inputstream, pojoClass, params, null, null);
    }

    /**
     * Excel 通过SAX解析方法,适合大数据导入,不支持图片
     * 导入 数据源本地文件,不返回校验结果 导入 字 段类型 Integer,Long,Double,Date,String,Boolean
     *
     * @param inputstream
     * @param pojoClass
     * @param params
     * @param hanlder
     */
    @SuppressWarnings("rawtypes")
    public static void importExcelBySax(InputStream inputstream, Class<?> pojoClass,
                                        ImportParams params, IExcelReadRowHanlder hanlder) {
        new SaxReadExcel().readExcel(inputstream, pojoClass, params, null, hanlder);
    }

    /**
     * Excel 通过SAX解析方法,适合大数据导入,不支持图片
     * 导入 数据源IO流,不返回校验结果 导入 字段类型 Integer,Long,Double,Date,String,Boolean
     *
     * @param inputstream
     * @param rowRead
     * @return
     */
    public static <T> List<T> importExcelBySax(InputStream inputstream, ISaxRowRead rowRead) {
        return new SaxReadExcel().readExcel(inputstream, null, null, rowRead, null);
    }
}
