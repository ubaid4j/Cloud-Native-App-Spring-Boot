package com.ubaid.ms.userservice.controller;

import com.ubaid.ms.ccdto.auth.LoginCred;
import com.ubaid.ms.userservice.service.AccessTokenService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.cors.CorsConfiguration;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping(value = "user-service")
@RequiredArgsConstructor
@CrossOrigin(value = CorsConfiguration.ALL)
public class UserServiceController {

    private final AccessTokenService tokenService;


    @PostMapping("oauth/token")
    public Mono<String> getAccessToken(@RequestBody LoginCred loginCred) {
        String accessToken = tokenService.getAccessToken(loginCred.getUsername(), loginCred.getPassword());
        return Mono.just(accessToken);
    }
}
