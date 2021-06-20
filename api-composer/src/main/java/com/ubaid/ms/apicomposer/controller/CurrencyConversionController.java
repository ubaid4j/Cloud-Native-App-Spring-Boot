package com.ubaid.ms.apicomposer.controller;

import com.ubaid.ms.apicomposer.config.SwaggerConfig;
import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.apicomposer.service.CurrencyConversionService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import java.net.HttpURLConnection;

@Api(tags = SwaggerConfig.CURRENCY_CONVERSION)
@RestController
@RequestMapping(value = "convert")
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
    public ExchangeValueDTO getCurrencyConversion(
            @PathVariable("from") String from,
            @PathVariable("to") String to,
            @PathVariable("quantity") Double quantity) {
        return currencyConversionService.convertCurrency(from, to, quantity);
    }
}
