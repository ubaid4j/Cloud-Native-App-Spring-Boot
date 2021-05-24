package com.ubaid.ms.currencyconversionservice.controller;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.currencyconversionservice.config.SwaggerConfig;
import com.ubaid.ms.currencyconversionservice.service.CurrencyConversionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.security.RolesAllowed;

@Api(tags = SwaggerConfig.CONVERSION)
@RestController
@RequestMapping("currency-conversion")
@Slf4j
@RequiredArgsConstructor
public class CurrencyConversionController {

    private final CurrencyConversionService currencyConversionService;

    @ApiOperation(value = "Convert given currency to another currency using given conversion rate", response = ConvertedCurrency.class)
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "Currency converted successfully"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "You are not authorized to convert currency")
    })
    @PreAuthorize("hasAuthority('SCOPE_currency-conversion')")
    @GetMapping(value = "/currency/{currency}/rate/{conversion-rate}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ConvertedCurrency getCurrencyConversion(
            @PathVariable("currency") Double currency,
            @PathVariable("conversion-rate") Double conversionRate) {
        return currencyConversionService.convert(currency, conversionRate);
    }
}
