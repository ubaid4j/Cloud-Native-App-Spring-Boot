package com.ubaid.ms.restapi.controller;

import com.ubaid.ms.ccdto.auth.LoginCred;
import com.ubaid.ms.restapi.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping(value = "login")
    public Map<String, ?> auth(@RequestBody LoginCred loginCred) {
        return authService.login(loginCred.getUsername(), loginCred.getPassword());
    }
}
