package com.ubaid.ms.currencyconversion.controller;

import com.ubaid.ms.common.dto.CurrencyInfoDTO;
import com.ubaid.ms.common.dto.CurrencyInfoDTOBuilder;
import com.ubaid.ms.common.dto.ExchangeValueDTO;
import com.ubaid.ms.currencyconversion.config.SwaggerConfig;
import com.ubaid.ms.currencyconversion.service.CurrencyConversionService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.net.HttpURLConnection;

@Api(tags = SwaggerConfig.CURRENCY_CONVERSION)
@RestController
@RequestMapping("v1")
@Slf4j
@RequiredArgsConstructor
public class CurrencyConversionController {

    private final CurrencyConversionService currencyConversionService;

    @ApiOperation(value = "Convert Currency from a given country to target country", authorizations = @Authorization(value = "Bearer"), response = ExchangeValueDTO.class)
    @ApiResponses({
            @ApiResponse(code = HttpURLConnection.HTTP_OK, message = "Currency is converted to target country currency"),
            @ApiResponse(code = HttpURLConnection.HTTP_UNAUTHORIZED, message = "You are not authorized to send a request")
    })
    @GetMapping(value = "/{from}/to/{to}/q/{quantity}", produces = MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasAuthority('SCOPE_currency-conversion')")
    public ExchangeValueDTO getCurrencyConversion(
            @PathVariable("from") String from,
            @PathVariable("to") String to,
            @PathVariable("quantity") Double quantity) {
        CurrencyInfoDTO currencyInfo = CurrencyInfoDTOBuilder
            .builder()
            .fromCurrency(from)
            .toCurrency(to)
            .quantity(quantity)
            .build();
        return currencyConversionService.convertCurrency(currencyInfo);
    }
}
