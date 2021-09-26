package com.ubaid.ms.country.controller;

import com.ubaid.ms.common.dto.CountryCodeDTO;
import com.ubaid.ms.country.service.CountryCodeService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

import static com.ubaid.ms.common.util.Constants.*;
import static com.ubaid.ms.country.config.SwaggerConfig.COUNTRY;

@Api(tags = COUNTRY)
@RestController
@RequestMapping("v1")
@RequiredArgsConstructor
public class CountryController {

    private final CountryCodeService countryCodeService;

    @ApiOperation(
            value = "To get all countries along with currency codes",
            authorizations = @Authorization(value = BEARER),
            response = CountryCodeDTO.class,
            responseContainer = "List"
    )
    @ApiResponses({
            @ApiResponse(code = HTTP_OK, message = "All Countries with currency code fetched successfully"),
            @ApiResponse(code = HTTP_UNAUTHORIZED, message = "You are not authorized to send a request")
    })
    @PreAuthorize("hasAuthority('SCOPE_countries')")
    @GetMapping(value = "code", produces = APPLICATION_JSON)
    public List<CountryCodeDTO> getAllCountries() {
        return countryCodeService.getAll();
    }
}
