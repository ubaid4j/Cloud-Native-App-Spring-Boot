package com.ubaid.ms;

import com.google.common.collect.Lists;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.gateway.filter.factory.TokenRelayGatewayFilterFactory;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

/**
 * Re-routes the incoming request to down-stream services according to the URL match pattern.
 * @author ubaid
 */
@EnableDiscoveryClient
@SpringBootApplication
@EnableOpenApi
public class SpringCloudApiGatewayServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringCloudApiGatewayServerApplication.class, args);
    }

    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder, TokenRelayGatewayFilterFactory filterFactory) {
        return builder.routes()
                .route(r -> r.path("/country/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://COUNTRY-SERVICE"))
                .route(r -> r.path("/convert/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://API-COMPOSER"))
                .route(r -> r.path("/config/limits")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://API-COMPOSER"))
                .route(r -> r.path("/token/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://API-COMPOSER"))
                .route(r -> r.path("/currency-conversion/**")
                               .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://CURRENCY-CONVERSION-SERVICE"))
                .route(r -> r.path("/currency-exchange/**")
                                .filters(f -> f.filter(filterFactory.apply()))
                            .uri("lb://CURRENCY-EXCHANGE-SERVICE"))
                .route(r -> r.path("/country-service/v3/api-docs")
                                .filters(f -> f.rewritePath("/country-service", ""))
                            .uri("lb://COUNTRY-SERVICE"))
                .route(r -> r.path("/api-composer/v3/api-docs")
                                .filters(f -> f.rewritePath("/api-composer", ""))
                            .uri("lb://API-COMPOSER"))
                .route(r -> r.path("/currency-conversion-service/v3/api-docs")
                                .filters(f -> f.rewritePath("/currency-conversion-service", ""))
                            .uri("lb://CURRENCY-CONVERSION-SERVICE"))
                .route(r -> r.path("/currency-exchange-service/v3/api-docs")
                                .filters(f -> f.rewritePath("/currency-exchange-service", ""))
                            .uri("lb://CURRENCY-EXCHANGE-SERVICE"))
                .build();
    }


    public static final String AUTHORIZATION_HEADER = "Authorization";

    @Bean
    public Docket swaggerSpringfoxDocket() {
        return new Docket(DocumentationType.OAS_30)
                .apiInfo(apiInfo())
                .securitySchemes(Lists.newArrayList(apiKey()))
                .useDefaultResponseMessages(false)
                .select()
                .build();
    }


    private ApiKey apiKey() {
        return new ApiKey(AUTHORIZATION_HEADER, AUTHORIZATION_HEADER, "header");
    }

    /**
     *
     * @return ApiInfo
     */
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder().title("Authentication API").description("")
                .contact(new Contact("Ubaid ur Rehman", "https://www.linkedin.com/in/ubaid-ur-rehman-5a0118119/", "urehman.bese16seecs@seecs.edu.pk"))
                .license("Open Source")
                .licenseUrl("https://www.apache.org/licenses/LICENSE-2.0")
                .version("1.0.0")
                .build();

    }
}