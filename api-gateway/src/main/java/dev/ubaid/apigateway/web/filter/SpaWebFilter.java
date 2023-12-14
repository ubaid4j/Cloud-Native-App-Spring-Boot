package dev.ubaid.apigateway.web.filter;

import org.springframework.context.annotation.Profile;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import org.springframework.web.server.WebFilter;
import org.springframework.web.server.WebFilterChain;
import reactor.core.publisher.Mono;

@Profile("prod")
@Component
public class SpaWebFilter implements WebFilter {

    /**
     * Forwards any unmapped paths (except those containing a period) to the client {@code index.html}.
     */
    @Override
    public Mono<Void> filter(@NonNull ServerWebExchange exchange, @NonNull WebFilterChain chain) {
        String path = exchange.getRequest().getURI().getPath();
        if (!path.startsWith("/services") && !path.contains(".")) {
            return chain.filter(exchange.mutate().request(exchange.getRequest().mutate().path("/browser/index.html").build()).build());
        }
        return chain.filter(exchange);
    }
}
