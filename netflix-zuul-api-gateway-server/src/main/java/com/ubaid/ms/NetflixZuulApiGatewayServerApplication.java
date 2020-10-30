package com.ubaid.ms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;

@EnableDiscoveryClient
@SpringBootApplication
public class NetflixZuulApiGatewayServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(NetflixZuulApiGatewayServerApplication.class, args);
    }

    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder) {
        return builder.routes()

                .route(r -> r.path("/country/**")
                        .uri("lb://COUNTRY-SERVICE")
                        .id("country-service"))

                .route(r -> r.path("/currency-conversion/**")
                        .uri("lb://CURRENCY-CONVERSION-SERVICE")
                        .id("currency-conversion-service"))

                .route(r -> r.path("/currency-exchange/**")
                        .uri("lb://CURRENCY-EXCHANGE-SERVICE")
                        .id("currency-exchange-service"))

                .build();
    }
}