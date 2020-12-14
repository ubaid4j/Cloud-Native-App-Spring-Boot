- Security Configuration of Spring Cloud Gateway
```java
@Configuration
@EnableWebFluxSecurity
@EnableGlobalMethodSecurity(jsr250Enabled = true)
public class SecurityConfig {

    @Bean
    public SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {
        http
                .authorizeExchange()
                .anyExchange()
                .authenticated()
                .and().oauth2ResourceServer().jwt();

        http.csrf().disable();

        return http.build();
    }

    @Bean
    public ReactiveJwtDecoder reactiveJwtDecoder() {
        return ReactiveJwtDecoders.fromOidcIssuerLocation("http://localhost:9898/auth/realms/3cn");
    }

}
```

- Explanation
    1. `@Configuration` Indicates that a class declares one or more `@Bean` methods and may be processed by the Spring container to generate bean definitions and service requests for those beans at runtime.
    2. `@EnableWebFluxSecurity` As Spring Cloud API Gateway is based upon Reactor Project, so enabling `WebFluxSecurity`
    3. `@EnableGlobalMethodSecurity(jsr250Enabled = true)` property allows us to use the `@RoleAllowed` annotation on methods
    4. `SecurityWebFilterChain` bean which configuring security to authenticate all requests and adding support of `OAuth2` Server, (It is behaving both Client and Resource Server)
    5. `ReactiveJwtDecoder` OIDC issuer Location 
    6. Along with this, we have to add a provider (Auth Server) and Clients (Resource Servers) (check the props files)
