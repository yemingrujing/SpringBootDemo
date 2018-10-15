package com.example.eurekaClient.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.serviceregistry.Registration;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Wei.Guang
 * @create 2018-10-15 16:47
 **/
@RestController
public class HelloController {

    private final Logger logger = LogManager.getLogger();

    @Autowired
    private Registration registration;

    @Autowired
    private DiscoveryClient client;

    /**
     * 测试
     * @return
     */
    @GetMapping(value = "/hello")
    public String index() {
        ServiceInstance instance = serviceInstance();
        logger.info(
                "/hello, host:" + instance.getHost() + ", service_id:" + instance.getServiceId());
        return "Hello World!";
    }

    public ServiceInstance serviceInstance() {
        List<ServiceInstance> list = client.getInstances(registration.getServiceId());
        if (!CollectionUtils.isEmpty(list)) {
            for (ServiceInstance item : list) {
                if (item.getPort() == 8082) {
                    return item;
                }
            }
        }
        return null;
    }
}
