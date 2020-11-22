package com.ubaid.ms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;

@EnableDiscoveryClient
@SpringBootApplication
public class SpringCloudApiGatewayServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringCloudApiGatewayServerApplication.class, args);
    }

    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder) {
        return builder.routes()

                .route(r -> r.path("/country/**")
                        .uri("lb://COUNTRY-SERVICE"))

                .route(r -> r.path("/currency-conversion/**")
                        .uri("lb://CURRENCY-CONVERSION-SERVICE"))

                .route(r -> r.path("/currency-exchange/**")
                        .uri("lb://CURRENCY-EXCHANGE-SERVICE"))

                .build();
    }
}