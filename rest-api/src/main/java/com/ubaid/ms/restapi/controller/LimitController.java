package com.ubaid.ms.restapi.controller;


import com.ubaid.ms.restapi.config.Config;
import com.ubaid.ms.restapi.feignProxy.TestServiceProxy;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.keycloak.KeycloakPrincipal;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.cors.CorsConfiguration;

import javax.annotation.security.RolesAllowed;

@RestController
@RequestMapping(value = "/api/config")
@Slf4j
@CrossOrigin(value = CorsConfiguration.ALL)
@RequiredArgsConstructor
public class LimitController {

    private final Config config;
    private final TestServiceProxy testServiceProxy;

    @GetMapping("/limits")
    @RolesAllowed("user")
    public Config getCurrencyConversion() {
        log.debug("Config: {}", config);
        return config;
    }

    @GetMapping("/public")
    public String helloPublic() {
        log.info("Public Request");
        return testServiceProxy.helloPublic();
    }

    @GetMapping("/private")
    @RolesAllowed("user")
    public String helloPrivate() {
        log.info("Private Request");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        KeycloakPrincipal<?> principal = (KeycloakPrincipal<?>) authentication.getPrincipal();
        String token = principal.getKeycloakSecurityContext().getTokenString();
        log.info("------------------Token----------------------{}", token);
        return testServiceProxy.helloPrivate("Bearer " + token);
    }

}
