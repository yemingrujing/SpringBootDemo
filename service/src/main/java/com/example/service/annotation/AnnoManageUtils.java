package com.example.service.annotation;

import org.reflections.Reflections;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 通过反射获取添加指定注解的类
 *
 * @author Wei.Guang
 * @create 2018-08-12 15:52
 **/
public class AnnoManageUtils {
    public static Map<Integer, String> map = new ConcurrentHashMap<>();

    static {
        // 反射工具包，指明扫描路径
        Reflections reflections = new Reflections("com.example.service.annotation.Handler");
        // 获取带Handler注解的类
        Set<Class<?>> classList = reflections.getTypesAnnotatedWith(Handler.class);
        for (Class clazz : classList) {
            Handler t = (Handler) clazz.getAnnotation(Handler.class);
            String[] valueList = t.value();
            // 获取注解的值并循环
            for (String value : valueList) {
                // 注解值为key，类名为value
                map.put(Integer.valueOf(value), clazz.getSimpleName());
            }
        }
    }

    /**
     * 通过eventTypeId，也就是注解的值获取相应处理Handler的类名
     * @param eventTypeId
     * @return
     */
    public static String getBeanNameByEventType(Integer eventTypeId) {
        return map.get(eventTypeId);
    }
}
