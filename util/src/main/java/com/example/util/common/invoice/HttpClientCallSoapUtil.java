package com.example.util.common.invoice;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 基于HttpClient的Soap的工具类
 * 1. 创建HttpClient对象。
 * 2. 创建请求方法的实例，并指定请求URL。如果需要发送GET请求，创建HttpGet对象；如果需要发送POST请求，创建HttpPost对象。
 * 3. 如果需要发送请求参数，可调用HttpGet、HttpPost共同的setParams(HetpParams params)方法来添加请求参数；
 *       对于HttpPost对象而言，也可调用setEntity(HttpEntity entity)方法来设置请求参数。
 * 4. 调用HttpClient对象的execute(HttpUriRequest request)发送请求，该方法返回一个HttpResponse。
 * 5. 调用HttpResponse的getAllHeaders()、getHeaders(String name)等方法可获取服务器的响应头；调用HttpResponse的getEntity()方法
 *   可获取HttpEntity对象，该对象包装了服务器的响应内容.
 * 程序可通过该对象获取服务器的响应内容。
 * 6. 释放连接。无论执行方法是否成功，都必须释放连接
 * @author Wei.Guang
 * @create 2018-11-21 14:14
 **/
@Slf4j
public class HttpClientCallSoapUtil {

    /**
     * 请求超时时间
     */
    private static final int socketTimeout = 30000;

    /**
     * 传输超时时间
     */
    private static final int connectTimeout = 30000;

    /**
     * 请求成功代码
     */
    private static final int successCode = 200;

    /**
     * 使用SOAP发送消息
     *
     * @param postUrl 请求地址
     * @param soapXml 发送包的字符串
     * @return 响应结果
     */
    public static String doPostSoap(String postUrl, String soapXml) {
        //响应结果字符串
        String respStr = "";
        try {
            HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
            CloseableHttpClient closeableHttpClient = httpClientBuilder.build();
            HttpPost httpPost = new HttpPost(postUrl);
            //  设置请求和传输超时时间
            RequestConfig requestConfig = RequestConfig.custom()
                    .setSocketTimeout(socketTimeout)
                    .setConnectTimeout(connectTimeout).build();
            httpPost.setConfig(requestConfig);
            httpPost.setHeader("Content-Type", "text/xml;charset=UTF-8");
            StringEntity data = new StringEntity(soapXml,
                    Charset.forName("UTF-8"));
            httpPost.setEntity(data);
            CloseableHttpResponse response = closeableHttpClient
                    .execute(httpPost);
            HttpEntity httpEntity = response.getEntity();
            if (httpEntity != null) {
                // 打印响应内容
                respStr = EntityUtils.toString(httpEntity, "UTF-8");
            }
            // 释放资源
            closeableHttpClient.close();
        } catch (Exception e) {
            log.error("Request Send Failure: {}", e.getMessage());
        }
        return respStr;
    }

    /**
     * 同步发送方式
     * @param url 请求地址
     * @param headers 请求头
     * @param param 请求参数
     * @return
     */
    public static String sendSyncSingleHttp(String url, Map<String, String> headers, String param) {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        RequestConfig defaultRequestConfig = RequestConfig.custom().build();
        RequestConfig requestConfig = RequestConfig.copy(defaultRequestConfig).setSocketTimeout(socketTimeout)
                .setConnectTimeout(connectTimeout).build();
        List<NameValuePair> nameValuePairs = new ArrayList<>();
        CloseableHttpResponse response = null;
        try {
            HttpPost httpPost = setConnectionParam(url, headers);
            param = URLEncoder.encode(param, "UTF-8");
            if ("1".equals(InvoiceConfig.getConfig().getZipcode())) {
                // 压缩
                param = SecurityUtil.compress(param);
            }
            nameValuePairs.add(new BasicNameValuePair("param", param));
            UrlEncodedFormEntity urlEncodedFormEntity = new UrlEncodedFormEntity(nameValuePairs);
            httpPost.setEntity(urlEncodedFormEntity);
            httpPost.setConfig(requestConfig);
            response = httpClient.execute(httpPost);
            return printResult(response);
        } catch (Exception e) {
            log.error("Request Send Error: {}", ExceptionUtils.getStackTrace(e));
        } finally {
            try {
                if (response != null) {
                    response.close();
                }
                if (httpClient != null) {
                    httpClient.close();
                }
            } catch (IOException e) {
                log.error("Request Send Error: {}", ExceptionUtils.getStackTrace(e));
            }
        }
        return null;
    }

    private static String printResult(CloseableHttpResponse response) {
        String str = "";
        InputStream inputStream = null;
        if (response.getStatusLine().getStatusCode() == successCode) {
            try {
                inputStream = response.getEntity().getContent();
                str = URLDecoder.decode(inputStreamToString(inputStream), "UTF-8");
            } catch (IOException e) {
                log.error("Request Send Error: {}", ExceptionUtils.getStackTrace(e));
            } finally {
                try {
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    response.close();
                } catch (IOException e) {
                    log.error("Request Send Error: {}", ExceptionUtils.getStackTrace(e));
                }
            }
        } else {
            try {
                log.info(response.getStatusLine().getStatusCode() + ":" + response.getEntity().getContent());
            } catch (IOException e) {
                log.error("Request Send Error: {}", ExceptionUtils.getStackTrace(e));
            }
        }
        return str;
    }

    /**
     * 构建post请求
     * @param url
     * @param headers
     * @return
     */
    private static HttpPost setConnectionParam(String url, Map<String, String> headers) {
        HttpPost httpPost = new HttpPost(url);
        for (Map.Entry<String, String> entry : headers.entrySet()) {
            httpPost.setHeader(entry.getKey(), entry.getValue());
        }
        return httpPost;
    }

    /**
     * 获取流
     * @return
     * @throws IOException
     */
    public static String inputStreamToString(InputStream input) throws IOException {
        BufferedReader br = null;
        String data = "";
        StringBuffer sb = new StringBuffer();
        br = new BufferedReader(new InputStreamReader(input));
        while ((data = br.readLine()) != null) {
            sb.append(data);
        }
        return sb.toString();
    }
}
