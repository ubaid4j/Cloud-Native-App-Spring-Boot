package com.ubaid.ms.gatewayserver.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

@Component
@Primary
@EnableAutoConfiguration
@RequiredArgsConstructor
@Slf4j
public class SwaggerConfig implements SwaggerResourcesProvider {

    private final RouteLocator routeLocator;
    private final DiscoveryClient discoveryClient;

    @Value("${spring.application.name}")
    private String appName;


    @Override
    public List<SwaggerResource> get() {

        List<SwaggerResource> resources = new ArrayList<>();
        log.info("All Services: {}", discoveryClient.getServices());
        discoveryClient.getServices().forEach(serviceId -> {
            resources.add(swaggerResource(serviceId, "/" + serviceId + "/v3/api-docs", "1"));
        });
//        routeLocator.getRoutes().subscribe(route -> {
//            String path = Optional
//                    .ofNullable(route.getPredicate().toString())
//                    .map(predicate -> predicate.substring(predicate.indexOf("[") + 1, predicate.indexOf("]")))
//                    .orElse("");
//            String serviceId = Optional
//                    .ofNullable(route.getId())
//                    .map(id -> id.substring(route.getId().indexOf("_") + 1).toLowerCase())
//                    .orElse("");
//
//            // Exclude gateway app from routes
//            if (!serviceId.equalsIgnoreCase(appName)) {
//                resources.add(swaggerResource(serviceId, path, "1"));
//            }
//        });


        return resources;
    }

    private SwaggerResource swaggerResource(String name, String location, String version) {
        SwaggerResource swaggerResource = new SwaggerResource();
        swaggerResource.setName(name);
        swaggerResource.setLocation(location);
        swaggerResource.setSwaggerVersion(version);
        return swaggerResource;
    }


}
