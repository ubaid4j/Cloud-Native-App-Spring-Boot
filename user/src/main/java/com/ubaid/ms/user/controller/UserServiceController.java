package com.ubaid.ms.user.controller;

import static com.ubaid.ms.common.util.Constants.*;

import com.ubaid.ms.common.dto.auth.LoginCred;
import com.ubaid.ms.user.config.SwaggerConfig;
import com.ubaid.ms.user.service.AccessTokenService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.cors.CorsConfiguration;
import reactor.core.publisher.Mono;

@Api(tags = SwaggerConfig.USER)
@RestController
@RequestMapping("v1")
@RequiredArgsConstructor
@CrossOrigin(value = CorsConfiguration.ALL)
public class UserServiceController {

    private final AccessTokenService tokenService;

    @ApiOperation(value = "Fetch access token for the user credentials (username & password)",  response = String.class)
    @ApiResponses({
            @ApiResponse(code = HTTP_OK, message = "Access Token fetched successfully"),
            @ApiResponse(code = HTTP_UNAUTHORIZED, message = "Wrong User Credentials")
    })
    @PostMapping(value = "oauth/token", consumes = APPLICATION_JSON, produces = TEXT_PLAIN)
    public Mono<String> getAccessToken(@RequestBody LoginCred loginCred) {
        String accessToken = tokenService.getAccessToken(loginCred.getUsername(), loginCred.getPassword());
        return Mono.just(accessToken);
    }
}
