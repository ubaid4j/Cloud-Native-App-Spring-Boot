package com.ubaid.ms.apicomposer.config;

import com.google.common.collect.Lists;
import com.ubaid.ms.apicomposer.controller.CurrencyConversionController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

import java.security.Principal;
import java.util.*;


@Configuration
@EnableOpenApi
@Slf4j
@ComponentScan(basePackageClasses = {
        CurrencyConversionController.class
})
public class SwaggerConfig {

    public static final String AUTHORIZATION = "Authorization";
    public static final String CURRENCY_CONVERSION = "Currency Conversion";

    @Bean
    public Docket swaggerSpringfoxDocket() {
        return new Docket(DocumentationType.OAS_30)
                .tags(new Tag(CURRENCY_CONVERSION, String.format("REST API for %s", CURRENCY_CONVERSION)))
                .ignoredParameterTypes(Principal.class)
                .apiInfo(apiInfo())
                .securityContexts(Lists.newArrayList(securityContext()))
                .securitySchemes(Lists.newArrayList(bearerToken()))
                .useDefaultResponseMessages(false)
                .select()
                .apis(RequestHandlerSelectors.withClassAnnotation(RestController.class))
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
        return new ApiInfoBuilder().title("API Composer").description("This API abstract the currency-exchange-service and currency-conversion-service and provide one end point for end user to convert currency from one country to another country")
                .contact(new Contact("Ubaid ur Rehman", "https://www.linkedin.com/in/ubaid-ur-rehman-5a0118119/", "urehman.bese16seecs@seecs.edu.pk"))
                .license("MIT")
                .licenseUrl("https://github.com/UbaidurRehman1/Cloud-Native-App-Spring-Boot/blob/master/LICENSE")
                .version("1.0.0")
                .build();

    }
}
