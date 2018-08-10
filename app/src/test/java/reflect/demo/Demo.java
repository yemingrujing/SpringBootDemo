package reflect.demo;

import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

/**
 * 我们利用反射和配置文件，可以使：应用程序更新时，对源码无需进行任何修改
 * 我们只需要将新类发送给客户端，并修改配置文件即可
 *
 * @author Wei.Guang
 * @create 2018-08-10 10:49
 **/
public class Demo {

    public static void main(String[] args) throws Exception {
        Class stuClass = Class.forName(getValue("className"));
        Method m = stuClass.getMethod(getValue("methodName"));
        m.invoke(stuClass.getConstructor().newInstance());
    }

    public static String getValue(String key) throws IOException {
        // 获取配置文件的对象
        Properties pro = new Properties();
        // 获取输入流
        FileReader in = new FileReader("E:\\yifei\\project\\demo\\app\\src\\test\\java\\reflect\\demo\\pro.txt");
        // 将流加载到配置文件对象中
        pro.load(in);
        in.close();
        return pro.getProperty(key);
    }
}
