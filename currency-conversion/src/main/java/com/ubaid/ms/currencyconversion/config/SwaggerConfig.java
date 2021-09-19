package com.ubaid.ms.currencyconversion.config;

import static com.ubaid.ms.common.util.Constants.ACCESS_EVERYTHING;
import static com.ubaid.ms.common.util.Constants.APP_VERSION;
import static com.ubaid.ms.common.util.Constants.AUTHORIZATION;
import static com.ubaid.ms.common.util.Constants.AUTHOR_EMAIL;
import static com.ubaid.ms.common.util.Constants.AUTHOR_LINKEDIN_URL;
import static com.ubaid.ms.common.util.Constants.AUTHOR_NAME;
import static com.ubaid.ms.common.util.Constants.BEARER_TOKEN;
import static com.ubaid.ms.common.util.Constants.GLOBAL;
import static com.ubaid.ms.common.util.Constants.HEADER;
import static com.ubaid.ms.common.util.Constants.LICENSE;
import static com.ubaid.ms.common.util.Constants.LICENSE_URL;

import com.google.common.collect.Lists;
import java.security.Principal;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.AuthorizationScope;
import springfox.documentation.service.Contact;
import springfox.documentation.service.SecurityReference;
import springfox.documentation.service.Tag;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
@EnableOpenApi
@Slf4j
@Component
@RequiredArgsConstructor
public class SwaggerConfig {

    public static final String CURRENCY_CONVERSION = "Currency Conversion";

    @Bean
    public Docket swaggerSpringfoxDocket() {
        return new Docket(DocumentationType.OAS_30)
                .tags(new Tag(CURRENCY_CONVERSION, String.format("REST API for %s", CURRENCY_CONVERSION)))
                .ignoredParameterTypes(Principal.class)
                .apiInfo(apiInfo())
                .pathMapping("/api/currency-conversion")
                .securityContexts(Lists.newArrayList(securityContext()))
                .securitySchemes(Lists.newArrayList(bearerToken()))
                .useDefaultResponseMessages(false)
                .select()
                .apis(RequestHandlerSelectors.withClassAnnotation(RestController.class))
                .build();
    }


    private ApiKey bearerToken() {
        return new ApiKey(AUTHORIZATION, BEARER_TOKEN, HEADER);
    }

    private SecurityContext securityContext() {
        return SecurityContext.builder()
                .securityReferences(defaultAuth())
                .build();
    }

    List<SecurityReference> defaultAuth() {
        return Lists.newArrayList(
                new SecurityReference(
                        AUTHORIZATION,
                        new AuthorizationScope[]{new AuthorizationScope(GLOBAL, ACCESS_EVERYTHING)}
                )
        );
    }

    /**
     *
     * @return ApiInfo
     */
    private ApiInfo apiInfo() {
        return new
                ApiInfoBuilder()
                .title("Currency Conversion")
                .description("This API abstract the currency-exchange service and math service and provide one end point for end user to convert currency from one country to another country")
                .contact(new Contact(AUTHOR_NAME, AUTHOR_LINKEDIN_URL, AUTHOR_EMAIL))
                .license(LICENSE)
                .licenseUrl(LICENSE_URL)
                .version(APP_VERSION)
                .build();

    }
}
