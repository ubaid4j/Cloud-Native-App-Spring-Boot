package com.ubaid.ms.gatewayserver.filter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.security.core.context.ReactiveSecurityContextHolder;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Component;

import java.util.Objects;

@Component
@Slf4j
public class PreOAuth2SSOGatewayFilter extends AbstractGatewayFilterFactory<PreOAuth2SSOGatewayFilter.Config> {

    public PreOAuth2SSOGatewayFilter() {
        super(Config.class);
    }

    @Override
    public GatewayFilter apply(Config config) {
        System.out.println("--------------------------Why this is not printing--------------------------");
        return (exchange, chain) -> {

            try {
                log.info("Req: {}", new ObjectMapper().writeValueAsString(exchange.getRequest()));
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }

            return ReactiveSecurityContextHolder.getContext()
                    .filter(Objects::nonNull)
                    .map(SecurityContext::getAuthentication)
                    .filter(authentication -> authentication instanceof OAuth2AuthenticationToken)
                    .map(authentication -> (OAuth2AuthenticationToken) authentication)
                    .map(OAuth2AuthenticationToken::getPrincipal)
                    .map(bearerToken -> {
                        ServerHttpRequest.Builder builder = exchange.getRequest().mutate();
                        builder.header(HttpHeaders.AUTHORIZATION, "Bearer " + bearerToken);
                        ServerHttpRequest request = builder.build();
                        return exchange.mutate().request(request).build();
                    })
                    .defaultIfEmpty(exchange)
                    .flatMap(chain::filter);
        };
    }

    public static class Config {
    }
}
