package reflect.demo;

import java.lang.reflect.Constructor;

/**
 * 通过Class对象可以获取某个类中的：构造方法、成员变量、成员方法；并访问成员
 *
 * @author Wei.Guang
 * @create 2018-08-10 10:09
 **/
public class Constructors {

    public static void main(String[] args) throws Exception {
        Class clazz = Class.forName("reflect.demo.Student");

        System.out.println("**********************所有公有构造方法*********************************");
        Constructor[] conArry = clazz.getConstructors();
        for (Constructor c : conArry) {
            System.out.println(c);
        }
        
        System.out.println("************所有的构造方法(包括：私有、受保护、默认、公有)***************");
        Constructor con = clazz.getConstructor(null);
        System.out.println("con = " + con);
        // 调用构造方法
        Object obj = con.newInstance();
        System.out.println(obj);
        
        System.out.println("******************获取私有构造方法，并调用*******************************");
        con = clazz.getDeclaredConstructor(char.class);
        System.out.println(con);
        // 调用构造方法
        con.setAccessible(true);
        obj = con.newInstance('男'); //暴力访问(忽略掉访问修饰符)
    }
}
