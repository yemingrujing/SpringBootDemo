package com.example.util.common;

import cn.hutool.core.io.IoUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;

import java.io.*;
import java.net.*;
import java.util.Enumeration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * ip地址工具类
 *
 * @author Wei.Guang
 * @create 2018-12-28 9:53
 **/
@Slf4j
public class AddressUtils {

    private static Pattern pattern = Pattern.compile("(2(5[0-5]{1}|[0-4]\\d{1})|[0-1]?\\d{1,2})(\\.(2(5[0-5]{1}|[0-4]\\d{1})|[0-1]?\\d{1,2})){3}");

    /**
     * 获取本机的内网ip地址
     * @return
     * @throws SocketException
     */
    public static String getInnetIp() throws SocketException {
        // 本地IP，如果没有配置外网IP则返回它
        String localIP = null;
        // 外网IP
        String netIp = null;
        Enumeration<NetworkInterface> netInterfaces = NetworkInterface.getNetworkInterfaces();
        InetAddress ip;
        // 是否找到外网IP
        boolean finded = Boolean.FALSE;
        while (netInterfaces.hasMoreElements() && !finded) {
            NetworkInterface ni = netInterfaces.nextElement();
            Enumeration<InetAddress> address = ni.getInetAddresses();
            while (address.hasMoreElements()) {
                ip = address.nextElement();
                if (!ip.isSiteLocalAddress() && !ip.isLoopbackAddress() && ip.getHostAddress().indexOf(":") == -1) {
                    // 外网IP
                    netIp = ip.getHostAddress();
                    finded = Boolean.TRUE;
                    break;
                } else if (ip.isSiteLocalAddress() && !ip.isLoopbackAddress() && ip.getHostAddress().indexOf(":") == -1) {
                    // 内网IP
                    localIP = ip.getHostAddress();
                }
            }
        }
        if (StringUtil.isNotBlank(netIp)) {
            return netIp;
        } else {
            return localIP;
        }
    }

    /**
     * 获取本机的外网ip地址
     * @return
     */
    public static String getV4IP() {
        String ip = "";
        String chinaz = "http://" + DateUtil.getYear(DateUtil.now()) + ".ip138.com/ic.asp";

        StringBuffer inputLine = new StringBuffer();
        String read;
        URL url;
        HttpURLConnection urlConnection;
        BufferedReader in = null;
        try {
            url = new URL(chinaz);
            urlConnection = (HttpURLConnection) url.openConnection();
            in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "GBK"));
            while ((read = in.readLine()) != null) {
                inputLine.append(read + "\r\n");
            }
        } catch (MalformedURLException e) {
            log.error("Get IP Failure: {}", ExceptionUtils.getStackTrace(e));
        } catch (IOException e) {
            log.error("Get IP Failure: {}", ExceptionUtils.getStackTrace(e));
        } finally {
            IoUtil.close(in);
        }
        Matcher matcher = pattern.matcher(inputLine.toString());
        if (matcher.find()) {
            String ipStr = matcher.group(0);
            ip = ipStr;
        }
        return ip;
    }

    /**
     * 解析ip地址
     *
     * 设置访问地址为http://ip.taobao.com/service/getIpInfo.php
     * 设置请求参数为ip=[已经获得的ip地址]
     * 设置解码方式为UTF-8
     *
     * @param content 请求的参数 格式为：ip=192.168.1.101
     * @param encoding 服务器端请求编码。如GBK,UTF-8等
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String getAddresses(String content, String encoding) throws UnsupportedEncodingException {
        // 设置访问地址
        String urlStr = "http://ip.taobao.com/service/getIpInfo.php";
        // 从http://whois.pconline.com.cn取得IP所在的省市区信息
        String returnStr = getResult(urlStr, content, encoding);
        if (returnStr != null) {
            JSONObject json = JSON.parseObject(returnStr);
            if ("0".equals(json.getString("code"))) {
                JSONObject data = json.getJSONObject("data");
                //国家
                String country = data.getString("country");
                //地区
                String area = data.getString("area");
                //省份
                String region = data.getString("region");
                //市区
                String city = data.getString("city");
                //地区
                String county = data.getString("city");
                //ISP公司
                String isp = data.getString("isp");
                return new StringBuffer("地址为：" + country + ",")
                        .append(region + ",")
                        .append(city + "市,")
                        .append(county + ",")
                        .append("ISP公司：" + isp)
                        .toString();
            }
        }
        return null;
    }

    /**
     * 访问目标地址并获取返回值
     * @param urlStr 请求的地址
     * @param content 请求的参数 格式为：ip=192.168.1.101
     * @param encoding 服务器端请求编码。如GBK,UTF-8等
     * @return
     */
    private static String getResult(String urlStr, String content, String encoding) {
        URL url;
        HttpURLConnection connection = null;
        try {
            url = new URL(urlStr);
            // 新建连接实例
            connection = (HttpURLConnection) url.openConnection();
            // 设置连接超时时间，单位毫秒
            connection.setConnectTimeout(3000);
            // 设置读取数据超时时间，单位毫秒
            connection.setReadTimeout(3000);
            // 是否打开输出流 true|false
            connection.setDoOutput(Boolean.TRUE);
            // 是否打开输入流true|false
            connection.setDoInput(Boolean.TRUE);
            // 提交方法POST|GET
            connection.setRequestMethod("POST");
            // 是否缓存true|false
            connection.setUseCaches(Boolean.FALSE);
            // 打开连接端口
            connection.connect();
            // 打开输出流往对端服务器写数据
            DataOutputStream out  = new DataOutputStream(connection.getOutputStream());
            // 写数据,也就是提交你的表单 name=xxx&pwd=xxx
            out.writeBytes(content);
            out.flush();
            out.close();
            // 往对端写完数据对端服务器返回数据, 以BufferedReader流来读取
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), encoding));
            StringBuffer buffer = new StringBuffer();
            String line;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            reader.close();
            return buffer.toString();
        } catch (MalformedURLException e) {
            log.error("Get IP Failure: {}", ExceptionUtils.getStackTrace(e));
        } catch (IOException e) {
            log.error("Get IP Failure: {}", ExceptionUtils.getStackTrace(e));
        } finally {
            IOUtils.close(connection);
        }
        return null;
    }
    
    public static void main(String[] args) throws SocketException {
        // 局域网的ip地址
        System.out.println("内网ip:" + AddressUtils.getInnetIp());
        // 用于实际判断地址的ip
        System.out.println("外网ip:" + getV4IP());
        // 解析ip地址
        //System.out.println("IP详情:" + getAddresses("ip=180.175.0.150", "UTF-8"));
    }
}
