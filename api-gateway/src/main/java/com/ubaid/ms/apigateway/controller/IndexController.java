package com.ubaid.ms.apigateway.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

import java.net.URI;

@RestController
@RequestMapping("/api")
public class IndexController {

    @Value("${spring.application.name}")
    private String appName;
    
    @GetMapping(value = "/app/info")
    public Mono<String> index(ServerHttpResponse response) {
        return Mono.just(appName);
    }
}
