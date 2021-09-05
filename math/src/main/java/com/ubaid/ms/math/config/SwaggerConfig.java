package com.ubaid.ms.math.config;

import com.google.common.collect.Lists;
import io.swagger.v3.oas.models.OpenAPI;
import javax.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.netflix.eureka.EurekaServiceInstance;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.oas.web.OpenApiTransformationContext;
import springfox.documentation.oas.web.WebMvcOpenApiTransformationFilter;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import io.swagger.v3.oas.models.servers.Server;

import java.util.List;

import static org.springframework.http.HttpHeaders.AUTHORIZATION;
import static com.ubaid.ms.common.util.Constants.*;


@Configuration
@EnableOpenApi
@Slf4j
@Component
@RequiredArgsConstructor
public class SwaggerConfig implements WebMvcOpenApiTransformationFilter {

    public static final String MATH = "Math";

    private final DiscoveryClient discoveryClient;

    @Override
    public OpenAPI transform(OpenApiTransformationContext<HttpServletRequest> context) {
        OpenAPI swagger = context.getSpecification();
        swagger.setServers(getServers());
        return swagger;
    }

    @Override
    public boolean supports(DocumentationType delimiter) {
        return  delimiter.equals(DocumentationType.OAS_30);
    }

    @Bean
    public Docket swaggerSpringfoxDocket() {
        return new Docket(DocumentationType.OAS_30)
                .tags(new Tag(MATH, String.format("REST API for %s operations", MATH)))
                .apiInfo(apiInfo())
                .pathMapping("/api/math")
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
                new SecurityReference(AUTHORIZATION,
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
                .title("Math API")
                .description("Math Operations")
                .contact(new Contact(AUTHOR_NAME, AUTHOR_LINKEDIN_URL, AUTHOR_EMAIL))
                .license(LICENSE)
                .licenseUrl(LICENSE_URL)
                .version(APP_VERSION)
                .build();

    }

    private List<Server> getServers() {
        return discoveryClient
            .getInstances(API_GATEWAY.toUpperCase())
            .stream()
            .map(this::toServer)
            .toList();
    }

    private Server toServer(ServiceInstance instance) {
        String url = instance.getUri().toString();
        Server server = new Server().url(url);
        if (instance instanceof EurekaServiceInstance eurekaServiceInstance) {
            server.setDescription(eurekaServiceInstance.getInstanceInfo().getAppName());
        }
        log.debug("Server: {}", server);
        return server;
    }
}
