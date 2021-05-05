package com.ubaid.ms.userservice.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
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

    private final static String[] ALLOWED_PATHS = {"/user-service/oauth/token", "/v3/api-docs"};


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
