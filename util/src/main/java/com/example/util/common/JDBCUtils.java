package com.example.util.common;

import org.apache.commons.collections4.CollectionUtils;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.*;

/**
 * JDBC工具类
 *
 * @author Wei.Guang
 * @create 2018-09-26 13:31
 **/
public class JDBCUtils {


    /**
     * 数据库用户名
     */
    private static final String USERNAME = "root";

    /**
     * 数据库密码
     */
    private static final String PASSWORD = "MyNewPass4!";

    /**
     * 驱动信息
     */
    private static final String DRIVER = "com.mysql.jdbc.Driver";

    /**
     * 数据库地址
     */
    private static final String URL = "jdbc:mysql://192.168.168.5:3306/commerce?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&autoReconnectForPools=true&zeroDateTimeBehavior=convertToNull";

    //数据库连接
    private static Connection connection;

    private PreparedStatement pstmt;
    private ResultSet resultSet;

    public JDBCUtils() {
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("数据库连接失败");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("数据库连接失败");
        }
    }

    /**
     * 获取数据库的连接
     *
     * @return
     */
    public static Connection getConnection() {
        try {
            //获取连接
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * 查询单条记录
     *
     * @param sql
     * @param params
     * @return
     * @throws SQLException
     */
    public Map<String, Object> findSimpleResult(String sql, List<Object> params) throws SQLException {
        Map<String, Object> map = new HashMap<>();
        int index = 1;
        pstmt = connection.prepareStatement(sql);
        if (CollectionUtils.isNotEmpty(params)) {
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(index++, params.get(i));
            }
        }
        //返回查询结果
        resultSet = pstmt.executeQuery();
        ResultSetMetaData metaData = resultSet.getMetaData();
        int colLen = metaData.getColumnCount();
        while (resultSet.next()) {
            for (int i = 0; i < colLen; i++) {
                String colsName = metaData.getColumnName(i + 1);
                Object colsVaule = resultSet.getObject(colsName);
                if (colsVaule == null) {
                    colsVaule = "";
                }
                map.put(colsName, colsVaule);
            }
        }
        return map;
    }

    /**
     * 查询多条记录
     *
     * @param sql
     * @param params
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> findModeResult(String sql, List<Object> params) throws SQLException {
        List<Map<String, Object>> list = new ArrayList<>();
        int index = 1;
        pstmt = connection.prepareStatement(sql);
        if (CollectionUtils.isNotEmpty(params)) {
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(index++, params.get(i));
            }
        }
        //返回查询结果
        resultSet = pstmt.executeQuery();
        ResultSetMetaData metaData = resultSet.getMetaData();
        int colLen = metaData.getColumnCount();
        while (resultSet.next()) {
            Map<String, Object> map = new HashMap<>();
            for (int i = 0; i < colLen; i++) {
                String colsName = metaData.getColumnName(i + 1);
                Object colsVaule = resultSet.getObject(colsName);
                if (colsVaule == null) {
                    colsVaule = "";
                }
                map.put(colsName, colsVaule);
            }
            list.add(map);
        }
        return list;
    }

    /**
     * 通过反射机制查询单条记录
     *
     * @param sql
     * @param params
     * @param cls
     * @param <T>
     */
    public <T> T findSimpleRefResult(String sql, List<Object> params, Class<T> cls) throws SQLException, IllegalAccessException, InstantiationException, NoSuchFieldException {
        T resultObject = null;
        int index = 1;
        pstmt = connection.prepareStatement(sql);
        if (CollectionUtils.isNotEmpty(params)) {
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(index++, params.get(i));
            }
        }
        resultSet = pstmt.executeQuery();
        ResultSetMetaData metaData = resultSet.getMetaData();
        int colsLen = metaData.getColumnCount();
        while (resultSet.next()) {
            //通过反射机制创建一个实例
            resultObject = cls.newInstance();
            for (int i = 0; i < colsLen; i++) {
                String colsName = metaData.getColumnName(i + 1);
                Object colsValue = resultSet.getObject(colsName);
                if (colsValue != null) {
                    colsValue = "";
                }
                Field field = cls.getDeclaredField(colsName);
                // 打开javabean的访问权限
                field.setAccessible(true);
                field.set(resultObject, colsValue);
            }
        }
        return resultObject;
    }

    /**
     * 通过反射机制查询多条记录
     *
     * @param sql
     * @param params
     * @param cls
     * @param <T>
     * @return
     */
    public <T> List<T> findMoreRefResult(String sql, List<Object> params, Class<T> cls) throws SQLException, IllegalAccessException, NoSuchFieldException, InstantiationException {
        List<T> list = new ArrayList<>();
        int index = 1;
        pstmt = connection.prepareStatement(sql);
        if (CollectionUtils.isNotEmpty(params)) {
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(index++, params.get(i));
            }
        }
        resultSet = pstmt.executeQuery();
        ResultSetMetaData metaData = resultSet.getMetaData();
        int colsLen = metaData.getColumnCount();
        while (resultSet.next()) {
            //通过反射机制创建一个实例
            T resultObject = cls.newInstance();
            for (int i = 0; i < colsLen; i++) {
                String colsName = metaData.getColumnName(i + 1);
                Object colsValue = resultSet.getObject(colsName);
                if (colsValue != null) {
                    colsValue = "";
                }
                Field field = cls.getDeclaredField(colsName);
                // 打开javabean的访问权限
                field.setAccessible(true);
                field.set(resultObject, colsValue);
            }
            list.add(resultObject);
        }
        return list;
    }

    /**
     * 释放数据库连接
     */
    public void releaseConn() {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
