package com.eurekaClient;

import io.swagger.annotations.Api;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 自动生成API文档配置.
 */
@EnableSwagger2
@Configuration
public class SwaggerConfiguration {

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("服务提供者 API") // 设置文档的标题
                .description("提供用户信息查询") // 设置文档的描述->1.Overview
                .termsOfServiceUrl("") // 设置文档的License信息->1.3 License information
                .version("www.abc.com") // 设置文档的版本信息-> 1.1 Version information
                .contact(new Contact("SpringBootDemo", "http://www.abc.com", "yemingrujing@aliyun.com")) // 设置文档的联系方式->1.2 Contact information
                .build();
    }

    /**
     * 定义api配置.
     * @return
     */
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.withClassAnnotation(Api.class)) // api接口包扫描路径
                .paths(PathSelectors.any()) // 可以根据url路径设置哪些请求加入文档，忽略哪些请求
                .build()
                .apiInfo(apiInfo());
    }
}
