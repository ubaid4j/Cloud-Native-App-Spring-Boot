package com.ubaid.ms;

import com.ubaid.ms.gatewayserver.filter.PreOAuth2SSOGatewayFilter;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.gateway.filter.factory.TokenRelayGatewayFilterFactory;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.GatewayFilterSpec;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.WebSession;
import reactor.core.publisher.Mono;

@EnableDiscoveryClient
@SpringBootApplication
@RestController
@RequiredArgsConstructor
public class SpringCloudApiGatewayServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringCloudApiGatewayServerApplication.class, args);
    }

    private final PreOAuth2SSOGatewayFilter filterFactory;

    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder) {
        return builder.routes()
                .route(r -> r.path("/country/**")
                        .filters(f ->  f.filter(filterFactory.apply(new PreOAuth2SSOGatewayFilter.Config())))
                        .uri("lb://COUNTRY-SERVICE"))
                .route(r -> r.path("/currency-conversion/**")
                        .uri("lb://CURRENCY-CONVERSION-SERVICE"))
                .route(r -> r.path("/currency-exchange/**")
                        .uri("lb://CURRENCY-EXCHANGE-SERVICE"))
                .build();
    }

    // TODO: 12/9/20 Authorize api gateway using token exchange
    
    @GetMapping(value = "/token")
    public Mono<String> getHome(@RegisteredOAuth2AuthorizedClient OAuth2AuthorizedClient authorizedClient) {
        return Mono.just(authorizedClient.getAccessToken().getTokenValue());
    }

    @GetMapping("/")
    public Mono<String> index(WebSession session) {
        return Mono.just(session.getId());
    }

}