package com.ubaid.ms.gatewayserver.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

import java.util.List;

@Component
@Primary
@EnableAutoConfiguration
@RequiredArgsConstructor
@Slf4j
public class SwaggerConfig implements SwaggerResourcesProvider {

    private final DiscoveryClient discoveryClient;

    @Override
    public List<SwaggerResource> get() {
        List<String> allServices = discoveryClient.getServices();
        log.debug("All Services: {}", allServices);
        return allServices
                .stream()
                .filter(serviceName -> !serviceName.equalsIgnoreCase("spring-cloud-api-gateway-server"))
                .map(serviceId -> swaggerResource(serviceId, "1"))
                .toList();
    }

    private SwaggerResource swaggerResource(String name, String version) {
        SwaggerResource swaggerResource = new SwaggerResource();
        swaggerResource.setName(name);
        swaggerResource.setLocation("/" + name + "/v3/api-docs");
        swaggerResource.setSwaggerVersion(version);
        return swaggerResource;
    }


}
