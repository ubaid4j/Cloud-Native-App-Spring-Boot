package dev.ubaid.apigateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;

@Configuration
public class WebConfigurer {

    @Profile("prod")
    @Bean
    RouterFunction<?> staticResourceLocator(){
        return RouterFunctions.resources("/**", new ClassPathResource("static/browser/"));
    }
}
