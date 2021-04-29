package com.ubaid.ms.apicomposer.controller;

import com.ubaid.ms.ccdto.auth.LoginCred;
import com.ubaid.ms.apicomposer.service.AccessTokenService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.cors.CorsConfiguration;

import java.util.Map;

@RestController
@RequestMapping
@RequiredArgsConstructor
@CrossOrigin(value = CorsConfiguration.ALL)
public class TokenController {

    private final AccessTokenService accessTokenService;

    @PostMapping(value = "token")
    public Map<String, ?> login(@RequestBody LoginCred loginCred) {
        return accessTokenService.getAccessToken(loginCred.getUsername(), loginCred.getPassword());
    }
}
