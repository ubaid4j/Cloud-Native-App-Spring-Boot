package com.ubaid.ms.countryservice.controller;

import com.ubaid.ms.ccdto.CountryCodeDTO;
import com.ubaid.ms.countryservice.config.SwaggerConfig;
import com.ubaid.ms.countryservice.service.CountryCodeService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;

import org.apache.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@Api(tags = SwaggerConfig.COUNTRY)
@RestController
@RequestMapping("country")
@RequiredArgsConstructor
public class CountryController {

    private final CountryCodeService countryCodeService;

    @ApiOperation(value = "To get all countries along with currency codes", authorizations = @Authorization(value = "Bearer"), response = CountryCodeDTO.class, responseContainer = "List")
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "All Countries with currency code fetched successfully"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "You are not authorized to send a request")
    })
    @PreAuthorize("hasAuthority('SCOPE_countries')")
    @GetMapping(value = "code", produces = "application/json")
    public List<CountryCodeDTO> getAllCountries() {
        return countryCodeService.getAll();
    }
}
