package com.ubaid.ms;

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
                .route(r -> r.path("/country/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://COUNTRY"))
                .route(r -> r.path("/convert/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://CURRENCY-CONVERSION"))
                .route(r -> r.path("/config/limits")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://CURRENCY-CONVERSION"))
                .route(r -> r.path("/user-service/oauth/token")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://USER"))
                .route(r -> r.path("/currency-conversion/**")
                               .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://MATH"))
                .route(r -> r.path("/currency-exchange/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://CURRENCY-EXCHANGE"))
                .route(r -> r.path("/country/v3/api-docs")
                                .filters(f -> f.rewritePath("/country", EMPTY_STRING))
                            .uri("lb://COUNTRY"))
                .route(r -> r.path("/currency-conversion/v3/api-docs")
                                .filters(f -> f.rewritePath("/currency-conversion", EMPTY_STRING))
                            .uri("lb://CURRENCY-CONVERSION"))
                .route(r -> r.path("/currency-conversion/v3/api-docs")
                                .filters(f -> f.rewritePath("/currency-conversion", EMPTY_STRING))
                            .uri("lb://CURRENCY-CONVERSION"))
                .route(r -> r.path("/currency-exchange/v3/api-docs")
                                .filters(f -> f.rewritePath("/currency-exchange", EMPTY_STRING))
                            .uri("lb://CURRENCY-EXCHANGE"))
                .route(r -> r.path("/user/v3/api-docs")
                                .filters(f -> f.rewritePath("/user", EMPTY_STRING))
                            .uri("lb://USER"))
                .route(r -> r.path("/audit/v3/api-docs")
                                .filters(f -> f.rewritePath("/audit", EMPTY_STRING))
                            .uri("lb://AUDIT"))
                .route(r -> r.path("/audit/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://AUDIT"))
                .build();
    }
}