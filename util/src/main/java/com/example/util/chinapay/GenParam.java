package com.example.util.chinapay;

import cn.hutool.json.JSONUtil;

import java.lang.reflect.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * controller获取body参数模板
 *
 * @author Wei.Guang
 * @create 2018-08-15 17:34
 **/
public class GenParam<T> {

    public T t;

    public GenParam() {
        //得到泛型父类
        Type genType = getClass().getGenericSuperclass();
            try {
            if (!(genType instanceof ParameterizedType)) {
                t = (T) Object.class.newInstance();
            }
            //一个泛型类可能有多个泛型形参，比如ClassName<T,K> 这里有两个泛型形参T和K，Class Name<T> 这里只有1个泛型形参T
            Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
            Class<T> clazz = (Class<T>) params[0];
                t = clazz.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    /**
     * 转换成json
     * @return
     */
    public String transferToJson() {
        setValue(t);
        return JSONUtil.toJsonPrettyStr(t);
    }

    /**
     * 泛型类作为父类，可以获取子类的所有实际参数的类型
     * @param modelClass
     * @param index
     * @return
     */
    public Class<?> getModelClass(Class modelClass, int index){
        // 得到泛型父类
        Type genType = this.getClass().getGenericSuperclass();
        //一个泛型类可能有多个泛型形参，比如ClassName<T,K> 这里有两个泛型形参T和K，Class Name<T> 这里只有1个泛型形参T
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        if (params.length - 1 < index) {
            modelClass = null;
        } else {
            modelClass = (Class) params[index];
        }

        return modelClass;

    }

    /**
     * 将子类的泛型类实例化-获取实例化对象的方法
     * @param mClass
     * @param mModel
     * @param index
     * @param <M>
     * @return
     */
    public <M> M getModel(Class<M> mClass, M mModel, int index) {
        try {
            mModel = (M) getModelClass(mClass, index).newInstance();
        } catch (Exception e) {
            mModel = null;
        }
        return mModel;
    }

    /**通过反射,获得定义Class时声明的父类的范型参数的类型.
     * 如public BookManager extends GenricManager<Book>
     * @param clazz The class to introspect
     * @return the first generic declaration, or <code>Object.class</code> if cannot be determined
     */
    public static Class getSuperClassGenricType(Class clazz) {
        return getSuperClassGenricType(clazz, 0);
    }

    /**通过反射,获得定义Class时声明的父类的范型参数的类型.
     * 如public BookManager extends GenricManager<Book>
     * @param clazz clazz The class to introspect
     * @param index the Index of the generic ddeclaration,start from 0.
     */
    public static Class getSuperClassGenricType(Class clazz, int index) throws IndexOutOfBoundsException {

        Type genType = clazz.getGenericSuperclass();

        if (!(genType instanceof ParameterizedType)) {
            return Object.class;
        }

        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

        if (index >= params.length || index < 0) {
            return Object.class;
        }
        if (!(params[index] instanceof Class)) {
            return Object.class;
        }
        return (Class) params[index];
    }

    /**
     * 通过反射取对象指定字段(属性)的值
     * @param target 目标对象
     * @param fieldName 字段的名称
     * @return
     */
    public static Object getValue(Object target, String fieldName) {
        Class<?> clazz = target.getClass();
        String[] fs = fieldName.split("\\.");
        try{
            for (int i = 0; i < fs.length - 1; i++) {
                Field f = clazz.getDeclaredField(fs[i]);
                f.setAccessible(true);
                target= f.get(target);
                clazz = target.getClass();
            }
            Field f = clazz.getDeclaredField(fs[fs.length - 1]);
            f.setAccessible(true);
            return f.get(target);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 通过反射给对象的指定字段赋值
     * @param model
     */
    private void setValue(T model) {
        Field[] field = model.getClass().getDeclaredFields(); // 获取实体类的所有属性，返回Field数组
        try {
            for (int j = 0; j < field.length; j++) { // 遍历所有属性
                String name = field[j].getName(); // 获取属性的名字
                name = name.substring(0, 1).toUpperCase() + name.substring(1); // 将属性的首字符大写，方便构造get，set方法
                String type = field[j].getGenericType().toString(); // 获取属性的类型
                if (type.equals("class java.lang.String")) { // 如果type是类类型，则前面包含"class "，后面跟类名
                    Method m = model.getClass().getMethod("get" + name);
                    String value = (String) m.invoke(model); // 调用getter方法获取属性值
                    if (value == null) {
                        m = model.getClass().getMethod("set" + name, String.class);
                        m.invoke(model, "");
                    }
                }
                if (type.equals("class java.lang.Integer")) {
                    Method m = model.getClass().getMethod("get" + name);
                    Integer value = (Integer) m.invoke(model);
                    if (value == null) {
                        m = model.getClass().getMethod("set" + name, Integer.class);
                        m.invoke(model, 0);
                    }
                }
                if (type.equals("class java.lang.Byte")) {
                    Method m = model.getClass().getMethod("get" + name);
                    Byte value = (Byte) m.invoke(model);
                    if (value == null) {
                        m = model.getClass().getMethod("set" + name, Byte.class);
                        m.invoke(model, (byte) 0);
                    }
                }
                if (type.equals("class java.lang.Long")) {
                    Method m = model.getClass().getMethod("get" + name);
                    Long value = (Long) m.invoke(model);
                    if (value == null) {
                        m = model.getClass().getMethod("set" + name, Long.class);
                        m.invoke(model, (long) 0);
                    }
                }
                if (type.equals("class java.lang.Short")) {
                    Method m = model.getClass().getMethod("get" + name);
                    Short value = (Short) m.invoke(model);
                    if (value == null) {
                        m = model.getClass().getMethod("set" + name, Short.class);
                        m.invoke(model, (short) 0);
                    }
                }
                if (type.equals("class java.lang.Boolean")) {
                    Method m = model.getClass().getMethod("get" + name);
                    Boolean value = (Boolean) m.invoke(model);
                    if (value == null) {
                        m = model.getClass().getMethod("set" + name, Boolean.class);
                        m.invoke(model, false);
                    }
                }
                if (type.equals("class java.util.Date")) {
                    Method m = model.getClass().getMethod("get" + name);
                    Date value = (Date) m.invoke(model);
                    if (value == null) {
                        m = model.getClass().getMethod("set" + name, Date.class);
                        m.invoke(model, new Date());
                    }
                }
                if (type.equals("class java.math.BigDecimal")) { // 如果type是类类型，则前面包含"class "，后面跟类名
                    Method m = model.getClass().getMethod("get" + name);
                    BigDecimal value = (BigDecimal) m.invoke(model); // 调用getter方法获取属性值
                    if (value == null) {
                        m = model.getClass().getMethod("set" + name, BigDecimal.class);
                        m.invoke(model, BigDecimal.ZERO);
                    }
                }
            }
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (java.lang.SecurityException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取对象中的所有字段名
     * @param cls
     * @return
     */
    public List<String> getFieldName(Class<?> cls) {
        List<String> list = new ArrayList<>();
        // 获取此类所有声明的字段
        Field[] field = cls.getFields();
        // 循环此字段数组，获取属性的值
        for (int i = 0; i < field.length && field.length > 0; i++) {
            // 值为 true 则指示反射的对象在使用时应该取消 Java 语言访问检查.
            field[i].setAccessible(true);
            // field[i].getName() 获取此字段的名称
            // field[i].get(object) 获取指定对象上此字段的值
            String name = field[i].getName();
            list.add(name);
        }
        return list;
    }
}
