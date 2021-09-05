package com.ubaid.ms.audit.config;

import com.google.common.collect.Lists;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.servers.Server;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.netflix.eureka.EurekaServiceInstance;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.oas.web.OpenApiTransformationContext;
import springfox.documentation.oas.web.WebFluxOpenApiTransformationFilter;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import io.swagger.v3.oas.models.servers.Server;

import java.security.Principal;
import java.util.List;

import static com.ubaid.ms.common.util.Constants.*;

@Configuration
@EnableOpenApi
@Slf4j
@Component
@RequiredArgsConstructor
public class SwaggerConfig implements WebFluxOpenApiTransformationFilter {

    public static final String AUDIT = "Audit";

    private final DiscoveryClient discoveryClient;

    @Override
    public OpenAPI transform(OpenApiTransformationContext<ServerHttpRequest> context) {
        OpenAPI swagger = context.getSpecification();
        swagger.setServers(getServers());
        return swagger;
    }

    @Override
    public boolean supports(DocumentationType delimiter) {
        return delimiter.equals(DocumentationType.OAS_30);
    }

    @Bean
    public Docket swaggerSpringfoxDocket() {
        return new Docket(DocumentationType.OAS_30)
                .tags(new Tag(AUDIT, String.format("REST API for %s", AUDIT)))
                .ignoredParameterTypes(Principal.class)
                .apiInfo(apiInfo())
                .pathMapping("/api/audit")
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

    private List<Server> getServers() {
        return discoveryClient
            .getInstances(API_GATEWAY.toUpperCase())
            .stream()
            .map(this::toServer)
            .toList();
    }

    private Server toServer(ServiceInstance instance) {
        String url = instance.getUri().toString();
        io.swagger.v3.oas.models.servers.Server server = new Server().url(url);
        if (instance instanceof EurekaServiceInstance eurekaServiceInstance) {
            server.setDescription(eurekaServiceInstance.getInstanceInfo().getAppName());
        }
        log.debug("Server: {}", server);
        return server;
    }
}
