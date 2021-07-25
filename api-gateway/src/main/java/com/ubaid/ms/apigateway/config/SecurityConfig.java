package com.ubaid.ms.apigateway.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.server.util.matcher.NegatedServerWebExchangeMatcher;
import org.springframework.security.web.server.util.matcher.ServerWebExchangeMatchers;
import org.springframework.web.client.RestOperations;

import java.time.Duration;

/**
 * <pre>
 * 1. Configure
 *      a. Authorize only authenticated requests except {@link SecurityConfig#OAUTH_TOKEN_PATHS}
 *      b. OAuth 2.0 Resource Server support
 * 2. Disable CSRF on {@link SecurityConfig#DOWN_STREAM_SERVICES_PATHS} and {@link SecurityConfig#SWAGGER_URLS}
 * </pre>
 *
 * @author ubaid
 */
@Configuration
@EnableWebFluxSecurity
@EnableGlobalMethodSecurity(jsr250Enabled = true)
@Slf4j
public class SecurityConfig {

    @Value("${spring.security.oauth2.resourceserver.jwt.jwk-set-uri}")
    private String jwkSetUri;

    private final static String[] INDEX = {"/"};
    private final static String[] DOWN_STREAM_SERVICES_PATHS = {"/user/oauth/token", "/math/**", "/currency-conversion/**", "/currency-exchange/**", "/country/**", "/audit/**"};
    private final static String[] OAUTH_TOKEN_PATHS = {"/user/oauth/token"};
    private final static String[] ACTUATOR_PATHS = {"/actuator/health"};
    private final static String[] SWAGGER_URLS = {"/user/v3/api-docs", "/audit/v3/api-docs",
            "/country/v3/api-docs", "/currency-conversion/v3/api-docs", "/math/v3/api-docs",
            "/currency-exchange/v3/api-docs",
            "/configuration/ui", "/swagger-resources/**",
            "/configuration/security", "/swagger-ui/index.html",
            "/webjars/**", "/swagger-ui/**"};
    private final static String[] CSRF_DISABLED_PATHS = new String[DOWN_STREAM_SERVICES_PATHS.length + SWAGGER_URLS.length + ACTUATOR_PATHS.length + INDEX.length];

    static {
        int counter = 0;
        for (String csrfDisabledPath : DOWN_STREAM_SERVICES_PATHS) {
            CSRF_DISABLED_PATHS[counter++] = csrfDisabledPath;
        }
        for (String csrfDisabledPath : SWAGGER_URLS) {
            CSRF_DISABLED_PATHS[counter++] = csrfDisabledPath;
        }
        for (String actuatorPath : ACTUATOR_PATHS) {
            CSRF_DISABLED_PATHS[counter++] = actuatorPath;
        }
        for (String index : INDEX) {
            CSRF_DISABLED_PATHS[counter++] = index;
        }
    }



    @Bean
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {

        http
                .csrf()
                    .requireCsrfProtectionMatcher(getNegatedMatcherForDisabledCSRF())
                .and()
                .authorizeExchange()
                .pathMatchers(OAUTH_TOKEN_PATHS).permitAll()
                .pathMatchers(SWAGGER_URLS).permitAll()
                .pathMatchers(ACTUATOR_PATHS).permitAll()
                .pathMatchers(HttpMethod.GET, INDEX).permitAll()
                .pathMatchers(HttpMethod.OPTIONS).permitAll()
                .anyExchange()
                .authenticated()
                .and()
                .oauth2ResourceServer()
                .jwt();

        return http.build();
    }

    public NegatedServerWebExchangeMatcher getNegatedMatcherForDisabledCSRF() {
        return new NegatedServerWebExchangeMatcher(exchange -> ServerWebExchangeMatchers.pathMatchers(CSRF_DISABLED_PATHS).matches(exchange));
    }

    @Bean
    public JwtDecoder jwtDecoder(RestTemplateBuilder builder) {
        RestOperations rest = builder
                .setConnectTimeout(Duration.ofMinutes(3))
                .setReadTimeout(Duration.ofMinutes(3))
                .build();
        log.info("Setting Connect Time out and Read Time out to 180 seconds for Rest Operations of JWT Decoder");
        return NimbusJwtDecoder.withJwkSetUri(jwkSetUri).restOperations(rest).build();
    }
}
