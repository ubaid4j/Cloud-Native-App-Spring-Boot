package com.ubaid.ms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableFeignClients(basePackages = {"com.ubaid.ms"})
@EnableDiscoveryClient
@EnableAspectJAutoProxy
public class RestAPI {
    public static void main(String[] args) {
        SpringApplication.run(RestAPI.class, args);
    }
}
