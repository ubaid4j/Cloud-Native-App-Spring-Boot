package com.ubaid.ms.userservice.controller;

import com.ubaid.ms.ccdto.auth.LoginCred;
import com.ubaid.ms.userservice.config.SwaggerConfig;
import com.ubaid.ms.userservice.service.AccessTokenService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.cors.CorsConfiguration;
import reactor.core.publisher.Mono;

import static java.net.HttpURLConnection.HTTP_OK;
import static java.net.HttpURLConnection.HTTP_UNAUTHORIZED;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.http.MediaType.TEXT_PLAIN_VALUE;

@Api(tags = SwaggerConfig.USER)
@RestController
@RequestMapping(value = "user-service")
@RequiredArgsConstructor
@CrossOrigin(value = CorsConfiguration.ALL)
public class UserServiceController {

    private final AccessTokenService tokenService;

    @ApiOperation(value = "Fetch access token for the user credentials (username & password)",  response = String.class)
    @ApiResponses({
            @ApiResponse(code = HTTP_OK, message = "Access Token fetched successfully"),
            @ApiResponse(code = HTTP_UNAUTHORIZED, message = "Wrong User Credentials")
    })
    @PostMapping(value = "oauth/token", consumes = APPLICATION_JSON_VALUE, produces = TEXT_PLAIN_VALUE)
    public Mono<String> getAccessToken(@RequestBody LoginCred loginCred) {
        String accessToken = tokenService.getAccessToken(loginCred.getUsername(), loginCred.getPassword());
        return Mono.just(accessToken);
    }
}
