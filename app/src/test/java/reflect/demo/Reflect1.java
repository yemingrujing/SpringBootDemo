package reflect.demo;

/**
 * 获取Class对象的三种方式
 *
 * @author Wei.Guang
 * @create 2018-08-10 10:04
 **/
public class Reflect1 {

    public static void main(String[] args) throws ClassNotFoundException {
        //第一种方式获取Class对象
        Student stu1 = new Student();
        Class stuClass = stu1.getClass();
        System.out.println(stuClass.getName());

        Class stuClass2 = Student.class;
        System.out.println(stuClass == stuClass2);

        //第三种方式获取Class对象
        Class stuClass3 = Class.forName("reflect.demo.Student");
        System.out.println(stuClass2 == stuClass3);
    }
}
