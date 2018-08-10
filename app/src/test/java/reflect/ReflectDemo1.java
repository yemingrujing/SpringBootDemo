package reflect;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * @author Wei.Guang
 * @create 2018-08-10 9:41
 **/
public class ReflectDemo1 {
    
    public static void main(String[] args) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        ArrayList<Integer> list = new ArrayList<Integer>();
        list.add(123);
        list.add(456);
        list.add(789);

        Class clazz = list.getClass();
        System.out.println(clazz);

        Method m = clazz.getMethod("add", Object.class);
        System.out.println(m);

        m.invoke(list, "adc");
        m.invoke(list, "sss");
        m.invoke(list, "qqq");
        
        System.out.println(list);

        Iterator it = list.iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }
}
