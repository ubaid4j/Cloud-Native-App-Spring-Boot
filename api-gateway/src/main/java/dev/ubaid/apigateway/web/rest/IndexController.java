package dev.ubaid.apigateway.web.rest;

import org.springframework.cloud.gateway.route.Route;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController(value = "/")
public class IndexController {

    private final RouteLocator routeLocator;

    public IndexController(RouteLocator routeLocator) {
        this.routeLocator = routeLocator;
    }

    @GetMapping(value = "/info")
    public Mono<String> index() {
        return Mono.just("Hello World");
    }

    @GetMapping("/routes")
    public ResponseEntity<Flux<Route>> activeRoutes() {
        return ResponseEntity.ok(routeLocator.getRoutes());
    }

}
