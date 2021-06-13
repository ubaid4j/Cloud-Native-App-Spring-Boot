package com.ubaid.ms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import static com.ubaid.ms.common.Constants.APP_ROOT_PACKAGE;

@SpringBootApplication
@EnableFeignClients(basePackages = {APP_ROOT_PACKAGE})
@EnableDiscoveryClient
@EnableAspectJAutoProxy
public class APIComposer {
    public static void main(String[] args) {
        SpringApplication.run(APIComposer.class, args);
    }
}
