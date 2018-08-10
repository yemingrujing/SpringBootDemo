package reflect.demo;

import java.lang.reflect.Field;

/**
 * 获取成员变量并调用
 *
 * @author Wei.Guang
 * @create 2018-08-10 10:21
 **/
public class Fields {
    
    public static void main(String[] args) throws Exception {
        Class stuClass = Class.forName("reflect.demo.Student");
        System.out.println("********************获取所有公有的字段********************");
        Field[] fieldArry = stuClass.getFields();
        for (Field f : fieldArry) {
            System.out.println(f);
        }

        System.out.println("********************获取所有的字段(包括私有、受保护、默认的)********************");
        fieldArry = stuClass.getDeclaredFields();
        for (Field f : fieldArry) {
            System.out.println(f);
        }

        System.out.println("***********************************获取公有字段并调用***********************************");
        Field f = stuClass.getField("name");
        System.out.println(f);
        //获取一个对象
        Object obj = stuClass.getConstructor().newInstance();
        //为字段设置值
        f.set(obj, "刘德华");
        //验证
        Student stu = (Student) obj;
        System.out.println("验证姓名：" + stu.name);
        
        System.out.println("********************************获取私有字段并调用********************************");
        f = stuClass.getDeclaredField("phoneNum");
        System.out.println(f);
        f.setAccessible(true);
        f.set(obj, "18888889999");
        System.out.println("验证电话：" + stu);
    }
}
