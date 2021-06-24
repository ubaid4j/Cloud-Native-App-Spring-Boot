package com.ubaid.ms.math.controller;

import com.ubaid.ms.common.dto.ConvertedCurrency;
import com.ubaid.ms.math.config.SwaggerConfig;
import com.ubaid.ms.math.service.CurrencyConversionService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.ubaid.ms.common.util.Constants.*;

@Api(tags = SwaggerConfig.MATH)
@RestController
@RequestMapping("math")
@Slf4j
@RequiredArgsConstructor
public class CurrencyConversionController {

    private final CurrencyConversionService currencyConversionService;

    @ApiOperation(
            value = "multiply first quantity with another one",
            authorizations = @Authorization(value = BEARER),
            response = ConvertedCurrency.class)
    @ApiResponses({
            @ApiResponse(code = HTTP_OK, message = "multiplication successfull"),
            @ApiResponse(code = HTTP_UNAUTHORIZED, message = "You are not authorized to convert currency")
    })
    @PreAuthorize("hasAuthority('SCOPE_currency-conversion')")
    @GetMapping(value = "multiply/currency/{currency}/rate/{conversion-rate}", produces = APPLICATION_JSON)
    public ConvertedCurrency getCurrencyConversion(
            @PathVariable("currency") Double currency,
            @PathVariable("conversion-rate") Double conversionRate) {
        return currencyConversionService.convert(currency, conversionRate);
    }
}
