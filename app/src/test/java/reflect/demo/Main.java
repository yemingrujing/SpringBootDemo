package reflect.demo;

import java.lang.reflect.Method;

/**
 * 获取Student类的main方法、不要与当前的main方法搞混了
 *
 * @author Wei.Guang
 * @create 2018-08-10 10:42
 **/
public class Main {

    public static void main(String[] args) throws Exception {
        Class clazz = Class.forName("reflect.demo.Student");
        Method methodMain = clazz.getMethod("main", String[].class);

        //第一个参数，对象类型，因为方法是static静态的，所以为null可以，第二个参数是String数组，这里要注意在jdk1.4时是数组，jdk1.5之后是可变参数
        //方式一
        methodMain.invoke(null, (Object) new String[]{"a", "b", "c"});
        //方式二
        // methodMain.invoke(null, new Object[]{new String[]{"a","b","c"}});
    }
}
