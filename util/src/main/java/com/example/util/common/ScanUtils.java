package com.example.util.common;

import com.egzosn.pay.common.util.str.StringUtils;
import lombok.extern.slf4j.Slf4j;
import org.reflections.Reflections;
import org.reflections.scanners.*;
import org.reflections.util.ClasspathHelper;
import org.reflections.util.ConfigurationBuilder;
import org.reflections.util.FilterBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Properties;
import java.util.Set;
import com.google.common.base.Predicate;

/**
 * Reflections工具封装类
 *
 * @author Wei.Guang
 * @create 2018-08-12 17:08
 **/
@Slf4j
public class ScanUtils {
    //通过","切割包
    private static final String SPLIT_STR = ",";
    private static Properties pro = null;
    private static Reflections reflections = null;

    static {
        InputStream in = ScanUtils.class.getClassLoader().getResourceAsStream("properties/reflections.properties");
        pro = new Properties();
        try {
            pro.load(in);
        } catch (IOException e) {
            e.printStackTrace();
            log.error("装载reflections.properties配置文件失败");
        }
    }

    /**
     * 初始化
     * @return
     */
    public static Reflections init() {
        //定义过滤器集合
        FilterBuilder filterBuilder = new FilterBuilder();
        Collection<URL> urlTotals = new ArrayList<>();
        //初始化过滤器集合
        initPackage(filterBuilder, urlTotals);
        Predicate<String> filter = (Predicate<String>) filterBuilder;

        reflections = new Reflections(new ConfigurationBuilder().filterInputsBy(filter).
                setScanners(new SubTypesScanner().filterResultsBy(filter),
                        new TypeAnnotationsScanner().filterResultsBy(filter),
                        new FieldAnnotationsScanner().filterResultsBy(filter),
                        new MethodAnnotationsScanner().filterResultsBy(filter),
                        new MethodParameterScanner().filterResultsBy(filter)).
                setUrls(urlTotals));
        return reflections;
    }

    /**
     *  初始化配置文件的包 reflection.properties
     * @param filterBuilder
     * @param urlTotals
     */
    private static void initPackage(FilterBuilder filterBuilder, Collection<URL> urlTotals) {
        String includePackage = pro.getProperty("includePackage");
        if (StringUtil.isNotEmpty(includePackage)) {
            for (String packName : includePackage.split(SPLIT_STR)) {
                filterBuilder = filterBuilder.includePackage(packName);
                /*
                通过ClasspathHelper（ClassLoader）类加载去去加载该包路径下的所有资源(URL),
                最终通过URL资源（类、方法，注解，修饰符等等）, 结合Filter可以得到Reflections
                对象。
                 */
                Set<URL> urls = (Set<URL>) ClasspathHelper.forPackage(packName);
                urlTotals.addAll(urls);
            }
        }
        String includeRegex = pro.getProperty("includeReges");
        if (StringUtil.isNotEmpty(includeRegex)) {
            for (String packName : includeRegex.split(SPLIT_STR)) {
                filterBuilder = filterBuilder.include(packName);

                Set<URL> urls = (Set<URL>) ClasspathHelper.forPackage(packName);
                urls.addAll(urls);
            }
        }

        String excludePackage = pro.getProperty("excludePackage");
        if (StringUtils.isNotEmpty(excludePackage)){
            for (String packName : excludePackage.split(SPLIT_STR)) {
                filterBuilder = filterBuilder.excludePackage(packName);

                Set<URL> urls = (Set<URL>) ClasspathHelper.forPackage(packName);
                urlTotals.addAll(urls);
            }
        }

        String excludeRegex = pro.getProperty("excludeRegex");
        if (StringUtils.isNotEmpty(excludeRegex)){
            for (String packName : excludeRegex.split(SPLIT_STR)) {
                filterBuilder = filterBuilder.includePackage(packName);

                Set<URL> urls = (Set<URL>) ClasspathHelper.forPackage(packName);
                urlTotals.addAll(urls);
            }
        }
    }
}
