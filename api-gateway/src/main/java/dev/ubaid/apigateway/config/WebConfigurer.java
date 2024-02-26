package dev.ubaid.apigateway.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;

@Configuration
public class WebConfigurer {
    
    private static final String PROD_PROFILE = "prod";
    private static final String ROOT_URL_PATTERN = "/**";
    private static final String STATIC_FILES_PATH = "static/browser/";

    @Profile(PROD_PROFILE)
    @Bean
    RouterFunction<?> staticResourceLocator(){
        return RouterFunctions.resources(ROOT_URL_PATTERN, new ClassPathResource(STATIC_FILES_PATH));
    }
}
