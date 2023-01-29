package com.ubaid.ms.apigateway.config;

import static com.ubaid.ms.common.util.Constants.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
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
public class SwaggerResourceProviderConfig implements SwaggerResourcesProvider {

    private final DiscoveryClient discoveryClient;

    @Override
    public List<SwaggerResource> get() {
        List<String> allServices = discoveryClient.getServices();
        log.debug("All Services: {}", allServices);
        return allServices
            .stream()
            .map(this::swaggerResource)
            .toList();
    }

    private SwaggerResource swaggerResource(String serviceName) {
        SwaggerResource swaggerResource = new SwaggerResource();
        swaggerResource.setName(serviceName);
        serviceName = StringUtils.equalsIgnoreCase(serviceName, API_GATEWAY) ? EMPTY_STRING : "/" + serviceName;
        swaggerResource.setLocation(serviceName + API_DOCS_PATH);
        swaggerResource.setSwaggerVersion(APP_VERSION);
        return swaggerResource;
    }
}
