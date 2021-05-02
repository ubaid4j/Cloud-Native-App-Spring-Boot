package com.ubaid.ms.gatewayserver.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.server.util.matcher.NegatedServerWebExchangeMatcher;
import org.springframework.security.web.server.util.matcher.ServerWebExchangeMatchers;

/**
 * <pre>
 * 1. Configure
 *      a. Authorize only authenticated requests except {@link SecurityConfig#UNPROTECTED_PATHS}
 *      b. OAuth 2.0 Resource Server support
 * 2. Disable CSRF on {@link SecurityConfig#DOWN_STREAM_SERVICES_PATHS} and {@link SecurityConfig#SWAGGER_URLS}
 * </pre>
 *
 * @author ubaid
 */
@Configuration
@EnableWebFluxSecurity
@EnableGlobalMethodSecurity(jsr250Enabled = true)
public class SecurityConfig {

    private final static String[] DOWN_STREAM_SERVICES_PATHS = {"/token/**", "/convert/**", "/currency-conversion/**", "/currency-exchange/**", "/country/code/**", "/config/limits/**"};
    private final static String[] UNPROTECTED_PATHS = {"/token/**"};
    private final String[] SWAGGER_URLS = {"/v3/api-docs", "/country-service/v3/api-docs", "/api-composer/v3/api-docs", "/currency-conversion-service/v3/api-docs", "/currency-exchange-service/v3/api-docs", "spring-cloud-api-gateway-server/v3/api-docs",
            "/configuration/ui", "/swagger-resources/**",
            "/configuration/security", "/swagger-ui/index.html",
            "/webjars/**", "/swagger-ui/**"};



    @Bean
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {

        http
                .csrf()
                    .requireCsrfProtectionMatcher(getNegatedMatcherForDownStreamServices())
                    .requireCsrfProtectionMatcher(getNegatedMatcherForSwagger())
                .and()
                .authorizeExchange()
                .pathMatchers(UNPROTECTED_PATHS).permitAll()
                .pathMatchers(SWAGGER_URLS).permitAll()
                .pathMatchers(HttpMethod.OPTIONS).permitAll()
                .anyExchange()
                .authenticated()
                .and()
                .oauth2ResourceServer()
                .jwt();

        return http.build();
    }

    public NegatedServerWebExchangeMatcher getNegatedMatcherForDownStreamServices() {
        return new NegatedServerWebExchangeMatcher(exchange -> ServerWebExchangeMatchers.pathMatchers(DOWN_STREAM_SERVICES_PATHS).matches(exchange));
    }

    public NegatedServerWebExchangeMatcher getNegatedMatcherForSwagger() {
        return new NegatedServerWebExchangeMatcher(exchange -> ServerWebExchangeMatchers.pathMatchers(SWAGGER_URLS).matches(exchange));
    }
}
