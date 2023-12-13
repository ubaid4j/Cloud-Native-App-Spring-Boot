package dev.ubaid.apigateway.web.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController(value = "/")
public class IndexController {

    @GetMapping(value = "/info")
    public Mono<String> index() {
        return Mono.just("Hello World");
    }
}
