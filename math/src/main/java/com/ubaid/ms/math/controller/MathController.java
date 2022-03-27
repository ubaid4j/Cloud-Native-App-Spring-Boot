package com.ubaid.ms.math.controller;

import static com.ubaid.ms.common.util.Constants.APPLICATION_JSON;
import static com.ubaid.ms.common.util.Constants.BEARER;
import static com.ubaid.ms.common.util.Constants.HTTP_OK;
import static com.ubaid.ms.common.util.Constants.HTTP_UNAUTHORIZED;

import com.ubaid.ms.common.dto.ValueDTO;
import com.ubaid.ms.math.config.SwaggerConfig;
import com.ubaid.ms.math.service.MathService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import io.swagger.annotations.Authorization;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = SwaggerConfig.MATH)
@RestController
@RequestMapping("v1")
@Slf4j
@RequiredArgsConstructor
public class MathController {

    private final MathService mathService;

    @ApiOperation(
            value = "multiply val1 with val2",
            authorizations = @Authorization(value = BEARER),
            response = ValueDTO.class)
    @ApiResponses({
            @ApiResponse(code = HTTP_OK, message = "multiplication successfully"),
            @ApiResponse(code = HTTP_UNAUTHORIZED, message = "You are not authorized perform multiplication")
    })
    @PreAuthorize("hasAuthority('SCOPE_math')")
    @GetMapping(value = "multiply/{val1}/{val2}", produces = APPLICATION_JSON)
    public ValueDTO multiply(
            @PathVariable("val1") Double val1,
            @PathVariable("val2") Double val2) {
        return mathService.multiply(val1, val2);
    }
}
