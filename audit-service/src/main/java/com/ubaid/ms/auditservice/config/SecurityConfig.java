package com.ubaid.ms.auditservice.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;

/**
 * <pre>
 *     1. Configure
 *      a. Authorize only authenticated requests
 *      b. OAuth 2.0 resource server support
 * </pre>
 */
@Configuration
@EnableWebFluxSecurity
public class SecurityConfig {

    private final static String[] ALLOWED_PATHS = {"/v3/api-docs"};


    @Bean
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {

        http
                .csrf().disable()
                .authorizeExchange()
                .pathMatchers(ALLOWED_PATHS).permitAll()
                .anyExchange()
                .authenticated()
                .and()
                .oauth2ResourceServer()
                .jwt();

        return http.build();
    }

}
