package com.ubaid.ms.userservice.controller;

import com.ubaid.ms.ccdto.auth.LoginCred;
import com.ubaid.ms.userservice.config.SwaggerConfig;
import com.ubaid.ms.userservice.service.AccessTokenService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.cors.CorsConfiguration;
import reactor.core.publisher.Mono;

import java.net.HttpURLConnection;

@Api(tags = SwaggerConfig.USER)
@RestController
@RequestMapping(value = "user-service")
@RequiredArgsConstructor
@CrossOrigin(value = CorsConfiguration.ALL)
public class UserServiceController {

    private final AccessTokenService tokenService;

    @ApiOperation(value = "Fetch access token for the user credentials (username & password)",  response = String.class)
    @ApiResponses({
            @ApiResponse(code = HttpURLConnection.HTTP_OK, message = "Access Token fetched successfully"),
            @ApiResponse(code = HttpURLConnection.HTTP_UNAUTHORIZED, message = "Wrong User Credentials")
    })
    @PostMapping(value = "oauth/token", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
    public Mono<String> getAccessToken(@RequestBody LoginCred loginCred) {
        String accessToken = tokenService.getAccessToken(loginCred.getUsername(), loginCred.getPassword());
        return Mono.just(accessToken);
    }
}
