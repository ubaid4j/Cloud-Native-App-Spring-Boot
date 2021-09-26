package com.ubaid.ms.apigateway.config;

import static com.ubaid.ms.common.util.Constants.ACCESS_TOKEN_PATHS;
import static com.ubaid.ms.common.util.Constants.HEALTH_ENDPOINT;
import static com.ubaid.ms.common.util.Constants.INFO_ENDPOINT;
import static com.ubaid.ms.common.util.Constants.MICROSERVICES_API_DOCS_PATHS;
import static com.ubaid.ms.common.util.Constants.SWAGGER_PATHS;

import java.time.Duration;
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
import org.springframework.web.client.RestOperations;

/**
 * <pre>
 * 1. Configure
 *      a. Authorize only authenticated requests except SWAGGER and Allowed Path
 *      b. OAuth 2.0 Resource Server support
 * </pre>
 *
 * @author ubaid
 */
@Configuration
@EnableWebFluxSecurity
@EnableGlobalMethodSecurity(jsr250Enabled = true)
@Slf4j
public class SecurityConfig {

    public static final String[] ALLOWED_PATH = {"/", HEALTH_ENDPOINT, INFO_ENDPOINT};

    @Value("${spring.security.oauth2.resourceserver.jwt.jwk-set-uri}")
    private String jwkSetUri;

    @Bean
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {

        http
                .csrf()
                .disable()
                .authorizeExchange()
                .pathMatchers(HttpMethod.GET, ALLOWED_PATH).permitAll()
                .pathMatchers(HttpMethod.GET, SWAGGER_PATHS).permitAll()
                .pathMatchers(HttpMethod.GET, MICROSERVICES_API_DOCS_PATHS).permitAll()
                .pathMatchers(HttpMethod.POST, ACCESS_TOKEN_PATHS).permitAll()
                .pathMatchers(HttpMethod.OPTIONS).permitAll()
                .anyExchange()
                .authenticated()
                .and()
                .oauth2ResourceServer()
                .jwt();

        return http.build();
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
