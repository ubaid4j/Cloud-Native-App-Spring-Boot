package com.ubaid.ms.currencyconversionservice.controller;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.currencyconversionservice.config.SwaggerConfig;
import com.ubaid.ms.currencyconversionservice.service.CurrencyConversionService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.HttpURLConnection;

@Api(tags = SwaggerConfig.CONVERSION)
@RestController
@RequestMapping("currency-conversion")
@Slf4j
@RequiredArgsConstructor
public class CurrencyConversionController {

    private final CurrencyConversionService currencyConversionService;

    @ApiOperation(value = "Convert given currency to another currency using given conversion rate", authorizations = @Authorization(value = "Bearer"), response = ConvertedCurrency.class)
    @ApiResponses({
            @ApiResponse(code = HttpURLConnection.HTTP_OK, message = "Currency converted successfully"),
            @ApiResponse(code = HttpURLConnection.HTTP_UNAUTHORIZED, message = "You are not authorized to convert currency")
    })
    @PreAuthorize("hasAuthority('SCOPE_currency-conversion')")
    @GetMapping(value = "/currency/{currency}/rate/{conversion-rate}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ConvertedCurrency getCurrencyConversion(
            @PathVariable("currency") Double currency,
            @PathVariable("conversion-rate") Double conversionRate) {
        return currencyConversionService.convert(currency, conversionRate);
    }
}
