package com.ubaid.ms.audit.config;

import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.security.Principal;
import java.util.List;

import static com.ubaid.ms.common.util.Constants.*;

@Configuration
@EnableOpenApi
@Slf4j
@Component
@RequiredArgsConstructor
public class SwaggerConfig {

    public static final String AUDIT = "Audit";

    @Bean
    public Docket swaggerSpringfoxDocket() {
        return new Docket(DocumentationType.OAS_30)
                .tags(new Tag(AUDIT, String.format("REST API for %s", AUDIT)))
                .ignoredParameterTypes(Principal.class)
                .apiInfo(apiInfo())
                .pathMapping("/audit")
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
        return new ApiInfoBuilder()
                .title("Audit Logs API")
                .description("CRUD Operations on Audit Logs")
                .contact(new Contact(AUTHOR_NAME, AUTHOR_LINKEDIN_URL, AUTHOR_EMAIL))
                .license(LICENSE)
                .licenseUrl(LICENSE_URL)
                .version(APP_VERSION)
                .build();
    }
}
