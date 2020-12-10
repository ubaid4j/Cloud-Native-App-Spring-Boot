package com.ubaid.ms.restapi.feignProxy;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;


@FeignClient("spring-cloud-api-gateway-server")
public interface TestServiceProxy {

    @GetMapping(value = "public")
    String helloPublic();

    @GetMapping(value = "private")
    String helloPrivate(@RequestHeader(value = "Authorization") String authHeader);
}
