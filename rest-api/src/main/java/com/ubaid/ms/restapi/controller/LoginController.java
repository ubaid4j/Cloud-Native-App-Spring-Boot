package com.ubaid.ms.restapi.controller;

import com.ubaid.ms.ccdto.auth.LoginCred;
import com.ubaid.ms.restapi.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;

    @PostMapping(value = "login")
    public Map<String, ?> login(@RequestBody LoginCred loginCred) {
        return loginService.login(loginCred.getUsername(), loginCred.getPassword());
    }
}
