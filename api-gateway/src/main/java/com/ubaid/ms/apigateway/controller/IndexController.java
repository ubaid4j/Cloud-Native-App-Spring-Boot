package com.ubaid.ms.apigateway.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

import java.net.URI;

@RestController(value = "/")
public class IndexController {

    @GetMapping(value = "/")
    public Mono<Void> index(ServerHttpResponse response) {
        response.setStatusCode(HttpStatus.PERMANENT_REDIRECT);
        response.getHeaders().setLocation(URI.create("/swagger-ui/index.html"));
        return response.setComplete();
    }
}
