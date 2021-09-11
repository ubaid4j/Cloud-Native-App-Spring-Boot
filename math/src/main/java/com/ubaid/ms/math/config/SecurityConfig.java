package com.ubaid.ms.math.config;

import com.ubaid.ms.math.config.validator.AudienceValidator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.oauth2.server.resource.OAuth2ResourceServerConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.core.DelegatingOAuth2TokenValidator;
import org.springframework.security.oauth2.core.OAuth2TokenValidator;
import org.springframework.security.oauth2.jwt.*;
import org.springframework.web.client.RestOperations;

import java.time.Duration;

import static com.ubaid.ms.common.util.Constants.API_DOCS_PATH;
import static com.ubaid.ms.common.util.Constants.HEALTH_ENDPOINT;
import static com.ubaid.ms.common.util.Constants.INFO_ENDPOINT;

/**
 * <pre>
 * 1. Configure
 *      a. Authorize only authenticated requests
 *      b. OAuth 2.0 Resource Server support
 * 2. Validate <code>aud</code> with the help of {@link AudienceValidator}
 *</pre>
 * @author ubaid
 */
@Configuration
@EnableWebSecurity
@Slf4j
@EnableGlobalMethodSecurity(jsr250Enabled = true, prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final static String[] ALLOWED_PATHS = {API_DOCS_PATH, HEALTH_ENDPOINT, INFO_ENDPOINT};

    @Value("${spring.security.oauth2.resourceserver.jwt.issuer-uri}")
    private String issuerUri;

    @Value("${spring.security.oauth2.resourceserver.jwt.jwk-set-uri}")
    private String jwkSetUri;


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .cors().and()
                .csrf().ignoringAntMatchers(API_DOCS_PATH).and()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
                .authorizeRequests(authorize ->
                    authorize
                            .antMatchers(ALLOWED_PATHS).permitAll()
                            .anyRequest()
                            .authenticated())
                .oauth2ResourceServer(OAuth2ResourceServerConfigurer::jwt);
    }

    @Bean
    JwtDecoder jwtDecoder(RestTemplateBuilder builder) {
        RestOperations rest = builder
                .setConnectTimeout(Duration.ofMinutes(3))
                .setReadTimeout(Duration.ofMinutes(3))
                .build();

        NimbusJwtDecoder jwtDecoder = NimbusJwtDecoder
                .withJwkSetUri(jwkSetUri)
                .restOperations(rest)
                .build();

        OAuth2TokenValidator<Jwt> withAudience = new DelegatingOAuth2TokenValidator<>(
                JwtValidators.createDefaultWithIssuer(issuerUri),
                new AudienceValidator()
        );
        jwtDecoder.setJwtValidator(withAudience);
        log.info("Setting Connect Time out and Read Time out to 180 seconds for Rest Operations of JWT Decoder");
        return jwtDecoder;
    }

}