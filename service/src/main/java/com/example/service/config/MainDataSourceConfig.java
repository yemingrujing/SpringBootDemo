package com.example.service.config;

import org.apache.ibatis.io.VFS;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * 主数据源配置
 *
 * @author Wei.Guang
 * @create 2018-08-03 14:08
 **/
@Configuration
@MapperScan(basePackages = "com.example.mapper", sqlSessionTemplateRef = "mainSqlSessionTemplate")
public class MainDataSourceConfig {

    @Bean(name = "mainDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.test1")
    @Primary
    public DataSource mainDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean(name = "mainSqlSessionFactory")
    @Primary
    public SqlSessionFactory mainSqlSessionFactory(@Qualifier("mainDataSource") DataSource dataSource) throws Exception {
        //DefaultVFS在获取jar上存在问题，使用springboot只能修改
        VFS.addImplClass(SpringBootVFS.class);
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath*:mapper/**/*.xml"));
        //实体类可以在mapper.xml中使用别名
        bean.setTypeAliasesPackage("com.example.base.login,com.example.base.order");
        return bean.getObject();
    }

    @Bean(name = "mainTransactionManagetr")
    @Primary
    public DataSourceTransactionManager mainTransactionManager(@Qualifier("mainDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean(name = "mainSqlSessionTemplate")
    @Primary
    public SqlSessionTemplate mainSqlSessionTemplate(@Qualifier("mainSqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
