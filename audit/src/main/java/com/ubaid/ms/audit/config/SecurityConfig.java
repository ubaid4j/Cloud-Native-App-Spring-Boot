package com.ubaid.ms.audit.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.server.context.NoOpServerSecurityContextRepository;
import org.springframework.web.client.RestOperations;

import java.time.Duration;

import static com.ubaid.ms.common.util.Constants.API_DOCS_PATH;
import static com.ubaid.ms.common.util.Constants.HEALTH_ENDPOINT;
import static com.ubaid.ms.common.util.Constants.INFO_ENDPOINT;

/**
 * <pre>
 *     1. Configure
 *      a. Authorize only authenticated requests
 *      b. OAuth 2.0 resource server support
 * </pre>
 */
@Configuration
@EnableWebFluxSecurity
@Slf4j
public class SecurityConfig {

    @Value("${spring.security.oauth2.resourceserver.jwt.jwk-set-uri}")
    private String jwkSetUri;

    private final static String[] ALLOWED_PATHS = {API_DOCS_PATH, HEALTH_ENDPOINT, INFO_ENDPOINT};

    @Bean
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {

        http
                .cors().and()
                .csrf().disable()
                .securityContextRepository(NoOpServerSecurityContextRepository.getInstance())
                .authorizeExchange()
                .pathMatchers(ALLOWED_PATHS).permitAll()
                .anyExchange()
                .authenticated().and()
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
        return NimbusJwtDecoder
                .withJwkSetUri(jwkSetUri)
                .restOperations(rest)
                .build();
    }
}
