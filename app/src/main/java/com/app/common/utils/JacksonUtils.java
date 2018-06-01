package com.app.common.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Json工具类
 *
 * @author Wei.Guang
 * @create 2018-06-01 11:36
 **/
public class JacksonUtils  {
    private final static ObjectMapper objectMapper = new ObjectMapper();

    private JacksonUtils (){

    }

    public static ObjectMapper getInstance(){
        return objectMapper;
    }

    /**
     * javaBean 列表数组转换为json字符串
     * @param obj
     * @return
     * @throws Exception
     */
    public static String obj2json(Object obj) throws Exception{
        return objectMapper.writeValueAsString(obj);
    }

    /**
     * javaBean 列表数组转换为json字符串，忽略空值
     * @param obj
     * @return
     * @throws Exception
     */
    public static String obj2jsonIgnoreNull(Object obj) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        return mapper.writeValueAsString(obj);
    }

    /**
     * json转JavaBean
     * @param jsonString
     * @param clazz
     * @param <T>
     * @return
     * @throws IOException
     */
    public static <T> T json2pojo(String  jsonString, Class<T> clazz) throws IOException {
        objectMapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY,true);
        return objectMapper.readValue(jsonString,clazz);
    }

    /**
     * json字符串转换为map
     * @param jsonString
     * @param <T>
     * @return
     * @throws IOException
     */
    public static <T> Map<String,Object> json2map(String jsonString) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        return mapper.readValue(jsonString,Map.class);
    }

    /**
     * json字符串转换为map
      * @param jsonString
     * @param clazz
     * @param <T>
     * @return
     * @throws IOException
     */
    public static <T> Map<String,T> json2map(String jsonString,Class<T> clazz) throws IOException {
        Map<String,Map<String,Object>> map = objectMapper.readValue(jsonString,new TypeReference<Map<String,T>>(){});
        Map<String,T> result = new HashMap<String,T>();
        for(Map.Entry<String,Map<String,Object>> entry : map.entrySet()){
            result.put(entry.getKey(),map2pojo(entry.getValue(),clazz));
        }
        return result;
    }

    /**
     * 深度转换json成map
     * @param json
     * @return
     */
    public static Map<String,Object> json2mapDeeply(String json) throws IOException {
        return json2MapRecursion(json, objectMapper);
    }

    /**
     * 与JavaBean json数组字符串转换为列表
     * @param jsonArrayStr
     * @param clazz
     * @param <T>
     * @return
     * @throws IOException
     */
    public static<T> List<T> json2list(String jsonArrayStr, Class<T> clazz) throws IOException {
        JavaType javaType = getCollectionType(ArrayList.class,clazz);
        List<T> list = (List<T>) objectMapper.readValue(jsonArrayStr,javaType);
        return list;
    }

    /**
     * 获取泛型的Collection Type
     * @param collectionClass 泛型的Collection
     * @param elementClasses 元素类
     * @return JavaType java类型
     */
    public static JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses){
        return objectMapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
    }

    /**
     * map转json
     * @param map
     * @return
     */
    public static String mapToJson(Map map){
        try {
            return objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * map转javaBean
     * @param map
     * @param clazz
     * @param <T>
     * @return
     */
    public static <T> T map2pojo(Map map, Class<T> clazz){
        return objectMapper.convertValue(map,clazz);
    }

    /**
     * map转json
     * @param map
     * @return
     */
    public static String map2pojo(Map map){
        try {
            return objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 把json解析成list,如果list内部的元素存在jsonString，继续解析
     * @param json
     * @param mapper
     * @return
     * @throws IOException
     */
    private static List<Object> json2ListRecursion(String json, ObjectMapper mapper) throws IOException {
        if(json == null){
            return null;
        }

        List<Object> list = mapper.readValue(json, List.class);

        for(Object obj : list){
            if(obj != null && obj instanceof String){
                String str = (String) obj;
                if(str.startsWith("[")){
                    obj = json2ListRecursion(str, mapper);
                } else if (obj.toString().startsWith("{")){
                    obj = json2MapRecursion(str, mapper);
                }
            }
        }

        return list;
    }

    /**
     * 把json解析成map，如果map内部的value存在jsonString，继续解析
     * @param json
     * @param mapper
     * @return
     * @throws IOException
     */
    private static Map<String,Object> json2MapRecursion(String json,ObjectMapper mapper) throws IOException {
        if(json == null){
            return null;
        }

        Map<String, Object> map = mapper.readValue(json, Map.class);

        for(Map.Entry<String, Object> entry : map.entrySet()){
            Object obj = entry.getValue();
            if(obj != null && obj instanceof String){
                String str = (String) obj;
                if(str.startsWith("[")){
                    List<?> list = json2ListRecursion(str, mapper);
                    map.put(entry.getKey(), list);
                } else if (str.startsWith("{")){
                    Map<String,Object> mapRecursion = json2MapRecursion(str, mapper);
                    map.put(entry.getKey(),mapRecursion);
                }
            }
        }

        return map;
    }
}
