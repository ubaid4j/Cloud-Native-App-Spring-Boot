package com.ubaid.ms;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.cloud.gateway.filter.factory.GatewayFilterFactory;
import org.springframework.cloud.gateway.filter.factory.TokenRelayGatewayFilterFactory;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.web.reactive.function.client.ServletBearerExchangeFilterFunction;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

@EnableDiscoveryClient
@SpringBootApplication
@RestController
@RequiredArgsConstructor
@Slf4j
public class SpringCloudApiGatewayServerApplication {


    ServletBearerExchangeFilterFunction bearer = new ServletBearerExchangeFilterFunction();

    public static void main(String[] args) {
        SpringApplication.run(SpringCloudApiGatewayServerApplication.class, args);
    }

    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder, TokenRelayGatewayFilterFactory filterFactory) {
        return builder.routes()
                .route(r -> r.path("/country/**")
                        .filters(f -> f.filter(filterFactory.apply())
                                .filter(new LoggingFilter().apply(new LoggingFilter.Config()))
                        )
                        .uri("lb://COUNTRY-SERVICE"))
                .route(r -> r.path("/currency-conversion/**")
                        .uri("lb://CURRENCY-CONVERSION-SERVICE"))
                .route(r -> r.path("/currency-exchange/**")
                        .uri("lb://CURRENCY-EXCHANGE-SERVICE"))
                .build();
    }

    @Bean
    WebClient webClient() {
        ServletBearerExchangeFilterFunction bearer = new ServletBearerExchangeFilterFunction();
        return WebClient.builder()
                .filter(bearer).build();
    }

    // TODO: 12/9/20 Authorize api gateway using token exchange

    @GetMapping(value = "/token")
    public String getHome(@RegisteredOAuth2AuthorizedClient OAuth2AuthorizedClient authorizedClient) {
        return "Authorization Successful";
    }

    @GetMapping("/public")
    public String index() {
        return "All shiny you got your PUBLIC data!";
    }

    @GetMapping("/private")
    public String getPrivate(@AuthenticationPrincipal Jwt jwt) {
        log.info(jwt.getTokenValue());    //in here jwt present as should be
        return jwt.toString();
    }

    @GetMapping("/index")
    Mono<UserDetails> getMyProfile(@AuthenticationPrincipal Mono<UserDetails> details) {
        return details;
    }

}

@Slf4j
class LoggingFilter implements GatewayFilterFactory<LoggingFilter.Config> {

    @Override
    public GatewayFilter apply(Config config) {
        return (exchange, chain) -> {
            log.info("------------------------------Logging-----------------------------------");
            return chain.filter(exchange);
        };
    }

    static class Config {}
}