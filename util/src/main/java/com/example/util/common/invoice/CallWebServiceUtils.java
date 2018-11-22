package com.example.util.common.invoice;

import org.apache.axiom.om.OMElement;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.rpc.client.RPCServiceClient;
import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;
import java.rmi.RemoteException;

/**
 * webservice 调用工具类
 *
 * @author Wei.Guang
 * @create 2018-11-21 14:17
 **/
public class CallWebServiceUtils {

    public static Client getClientCXF(String url) {
        // 这个是用cxf 客户端访问cxf部署的webservice服务
        JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
        Client client = dcf.createClient(url);
        // url为调用webService的wsdl地址
        return client;
    }

    /**
     * CXF
     *
     * @param url
     * @param nameSpace
     * @param methodName
     * @param args
     * @return
     * @throws Exception
     */

    public static Object[] callWebServiceCxf(String url, String nameSpace, String methodName, Object... args) throws Exception {
        // 这个是用cxf 客户端访问cxf部署的webservice服务
        JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
        Client client = dcf.createClient(url);
        // url为调用webService的wsdl地址
        QName name = new QName(nameSpace, methodName);
        // namespace是命名空间，methodName是方法名
        // args为参数值
        Object[] object = client.invoke(name, args);
        return object;
    }

    public static Object[] callWebServiceCxf(Client client, String nameSpace, String methodName, Object... args)
            throws Exception {
        QName name = new QName(nameSpace, methodName);
        // namespace是命名空间，methodName是方法名
        // args为参数值
        Object[] object = client.invoke(name, args);
        return object;
    }

    /**
     * Aixs
     *
     * @param url
     * @param nameSpace
     * @param methodName
     * @param paramName
     * @param args
     * @return
     */
    public static Object callWebServiceAxis(String url, String nameSpace, String methodName, String paramName, Object[] args) {
        Call call;
        try {
            call = (Call) new Service().createCall();
            call.setTargetEndpointAddress(url);
            QName qName = new QName(nameSpace, methodName);
            call.setOperationName(qName);
            // call.setOperation("sayHello");// 调用的方法名
            // 设置参数名:
            // 参数名
            call.addParameter(paramName,
                    // 参数类型:String
                    XMLType.XSD_STRING,
                    // 参数模式：'IN' or 'OUT'
                    ParameterMode.IN);
            // 设置返回值类型：
            // 返回值类型：String
            call.setReturnType(XMLType.XSD_STRING);
            // 远程调用
            return call.invoke(args);
        } catch (ServiceException e) {
            e.printStackTrace();
        } catch (RemoteException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Axis2
     *
     * @param url
     * @param nameSpace
     * @param methodName
     * @param args
     * @return
     * @throws Exception
     */
    public static String callWebServiceAxis2(String url, String nameSpace, String methodName, Object[] args) throws Exception {

        // 使用RPC方式调用WebService
        RPCServiceClient serviceClient = new RPCServiceClient();
        // 指定调用WebService的URL
        EndpointReference targetEPR = new EndpointReference(url);
        Options options = serviceClient.getOptions();
        // 确定目标服务地址
        options.setTo(targetEPR);
        // 确定调用方法
        QName qname = new QName(nameSpace, methodName);
        OMElement element = serviceClient.invokeBlocking(qname, args);
        // 返回结果就是一段由OMElement对象封装的xml字符串。
        String result = element.getFirstElement().getText();
        return result;
    }
}
