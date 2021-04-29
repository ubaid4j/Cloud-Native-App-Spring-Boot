package com.ubaid.ms.gatewayserver.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.security.web.server.util.matcher.NegatedServerWebExchangeMatcher;
import org.springframework.security.web.server.util.matcher.ServerWebExchangeMatcher;
import org.springframework.security.web.server.util.matcher.ServerWebExchangeMatchers;

/**
 * <pre>
 * 1. Configure
 *      a. Authorize only authenticated requests except {@link SecurityConfig#UNPROTECTED_PATHS}
 *      b. OAuth 2.0 Resource Server support
 * 2. Disable CSRF on {@link SecurityConfig#CSRF_DISABLED_PATHS}
 * </pre>
 *
 * @author ubaid
 */
@Configuration
@EnableWebFluxSecurity
@EnableGlobalMethodSecurity(jsr250Enabled = true)
public class SecurityConfig {

    private final static String[] CSRF_DISABLED_PATHS = {"/token/**", "/convert/**", "/currency-conversion/**", "/currency-exchange/**", "/country/code/**", "/config/limits/**"};
    private final static String[] UNPROTECTED_PATHS = {"/token/**"};

    @Bean
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {

        http
                .csrf()
                    .requireCsrfProtectionMatcher(getURLsForDisabledCRSF())
                .and()
                .authorizeExchange()
                .pathMatchers(UNPROTECTED_PATHS).permitAll()
                .pathMatchers(HttpMethod.OPTIONS).permitAll()
                .anyExchange()
                .authenticated()
                .and()
                .oauth2ResourceServer()
                .jwt();

        return http.build();
    }

    public NegatedServerWebExchangeMatcher getURLsForDisabledCRSF() {
        return new NegatedServerWebExchangeMatcher(exchange -> ServerWebExchangeMatchers.pathMatchers(CSRF_DISABLED_PATHS).matches(exchange));
    }
}
