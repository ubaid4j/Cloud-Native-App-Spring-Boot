package com.ubaid.ms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.gateway.filter.factory.TokenRelayGatewayFilterFactory;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;

import static com.ubaid.ms.common.Constants.EMPTY_STRING;

/**
 * Re-routes the incoming request to down-stream services according to the URL match pattern.
 * @author ubaid
 */
@EnableDiscoveryClient
@SpringBootApplication
public class SpringCloudApiGatewayServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringCloudApiGatewayServerApplication.class, args);
    }

    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder, TokenRelayGatewayFilterFactory filterFactory) {
        return builder.routes()
                .route(r -> r.path("/country/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://COUNTRY-SERVICE"))
                .route(r -> r.path("/convert/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://API-COMPOSER"))
                .route(r -> r.path("/config/limits")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://API-COMPOSER"))
                .route(r -> r.path("/user-service/oauth/token")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://USER-SERVICE"))
                .route(r -> r.path("/currency-conversion/**")
                               .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://CURRENCY-CONVERSION-SERVICE"))
                .route(r -> r.path("/currency-exchange/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://CURRENCY-EXCHANGE-SERVICE"))
                .route(r -> r.path("/country-service/v3/api-docs")
                                .filters(f -> f.rewritePath("/country-service", EMPTY_STRING))
                            .uri("lb://COUNTRY-SERVICE"))
                .route(r -> r.path("/api-composer/v3/api-docs")
                                .filters(f -> f.rewritePath("/api-composer", EMPTY_STRING))
                            .uri("lb://API-COMPOSER"))
                .route(r -> r.path("/currency-conversion-service/v3/api-docs")
                                .filters(f -> f.rewritePath("/currency-conversion-service", EMPTY_STRING))
                            .uri("lb://CURRENCY-CONVERSION-SERVICE"))
                .route(r -> r.path("/currency-exchange-service/v3/api-docs")
                                .filters(f -> f.rewritePath("/currency-exchange-service", EMPTY_STRING))
                            .uri("lb://CURRENCY-EXCHANGE-SERVICE"))
                .route(r -> r.path("/user-service/v3/api-docs")
                                .filters(f -> f.rewritePath("/user-service", EMPTY_STRING))
                            .uri("lb://USER-SERVICE"))
                .route(r -> r.path("/audit-service/v3/api-docs")
                                .filters(f -> f.rewritePath("/audit-service", EMPTY_STRING))
                            .uri("lb://AUDIT-SERVICE"))
                .route(r -> r.path("/audit-service/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://AUDIT-SERVICE"))
                .build();
    }
}