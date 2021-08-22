package com.ubaid.ms.apigateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.gateway.filter.factory.TokenRelayGatewayFilterFactory;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;

import static com.ubaid.ms.common.util.Constants.EMPTY_STRING;

/**
 * Re-routes the incoming request to down-stream services according to the URL match pattern.
 * @author ubaid
 */
@EnableDiscoveryClient
@SpringBootApplication
public class ApiGateway {

    public static void main(String[] args) {
        SpringApplication.run(ApiGateway.class, args);
    }

    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder, TokenRelayGatewayFilterFactory filterFactory) {
        return builder.routes()
                .route(r -> r.path("/api/country/**")
                                .filters(f -> f.filter(filterFactory.apply())
                                               .rewritePath("/api/country", EMPTY_STRING))
                            .uri("lb://COUNTRY"))

                .route(r -> r.path("/api/currency-conversion/**")
                                .filters(f -> f.filter(filterFactory.apply())
                                               .rewritePath("/api/currency-conversion", EMPTY_STRING))
                            .uri("lb://CURRENCY-CONVERSION"))

                .route(r -> r.path("/api/user/**")
                                .filters(f -> f.filter(filterFactory.apply())
                                              .rewritePath("/api/user", EMPTY_STRING))
                            .uri("lb://USER"))
                .route(r -> r.path("/api/math/**")
                               .filters(f -> f.filter(filterFactory.apply())
                                              .rewritePath("/api/math", EMPTY_STRING))
                            .uri("lb://MATH"))

                .route(r -> r.path("/api/currency-exchange/**")
                                .filters(f -> f.filter(filterFactory.apply())
                                               .rewritePath("/api/currency-exchange", EMPTY_STRING))
                            .uri("lb://CURRENCY-EXCHANGE"))

                .route(r -> r.path("/api/audit/**")
                                .filters(f -> f.filter(filterFactory.apply())
                                               .rewritePath("/api/audit", EMPTY_STRING))
                            .uri("lb://AUDIT"))
                .build();
    }
}