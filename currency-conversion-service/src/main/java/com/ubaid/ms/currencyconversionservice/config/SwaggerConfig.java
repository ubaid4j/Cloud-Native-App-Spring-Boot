package com.ubaid.ms.currencyconversionservice.config;

import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.util.List;


@Configuration
@EnableOpenApi
@Slf4j
public class SwaggerConfig {

    public static final String AUTHORIZATION = "Authorization";

    @Bean
    public Docket swaggerSpringfoxDocket() {
        return new Docket(DocumentationType.OAS_30)
                .apiInfo(apiInfo())
                .securityContexts(Lists.newArrayList(securityContext()))
                .securitySchemes(Lists.newArrayList(bearerToken()))
                .useDefaultResponseMessages(false)
                .select()
                .build();
    }


    private ApiKey bearerToken() {
        return new ApiKey(AUTHORIZATION, "Bearer Token", "header");
    }

    private SecurityContext securityContext() {
        return SecurityContext.builder()
                .securityReferences(defaultAuth())
                .build();
    }

    List<SecurityReference> defaultAuth() {
        AuthorizationScope authorizationScope
                = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        return Lists.newArrayList(
                new SecurityReference(AUTHORIZATION, authorizationScopes));
    }

    /**
     *
     * @return ApiInfo
     */
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder().title("Currency Conversion API").description("Convert one currency to another using exchange rate")
                .contact(new Contact("Ubaid ur Rehman", "https://www.linkedin.com/in/ubaid-ur-rehman-5a0118119/", "urehman.bese16seecs@seecs.edu.pk"))
                .license("Open Source")
                .licenseUrl("https://github.com/UbaidurRehman1/Cloud-Native-App-Spring-Boot/blob/master/LICENSE")
                .version("1.0.0")
                .build();

    }
}
