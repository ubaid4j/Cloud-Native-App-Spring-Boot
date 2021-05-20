package com.ubaid.ms.userservice.controller;

import com.ubaid.ms.ccdto.auth.LoginCred;
import com.ubaid.ms.userservice.config.SwaggerConfig;
import com.ubaid.ms.userservice.service.AccessTokenService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.apache.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.cors.CorsConfiguration;
import reactor.core.publisher.Mono;

import javax.ws.rs.core.MediaType;

@Api(tags = SwaggerConfig.USER)
@RestController
@RequestMapping(value = "user-service")
@RequiredArgsConstructor
@CrossOrigin(value = CorsConfiguration.ALL)
public class UserServiceController {

    private final AccessTokenService tokenService;

    @ApiOperation(value = "Fetch access token for the user credentials (username & password)", response = String.class)
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "Access Token fetched successfully"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "Wrong User Credentials")
    })
    @PostMapping(value = "oauth/token", consumes = MediaType.APPLICATION_JSON, produces = MediaType.TEXT_PLAIN)
    public Mono<String> getAccessToken(@RequestBody LoginCred loginCred) {
        String accessToken = tokenService.getAccessToken(loginCred.getUsername(), loginCred.getPassword());
        return Mono.just(accessToken);
    }
}
