package com.ubaid.ms.apicomposer.controller;

import com.ubaid.ms.apicomposer.config.SwaggerConfig;
import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.apicomposer.service.CurrencyConversionService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.core.MediaType;
import java.security.Principal;

@Api(tags = SwaggerConfig.CURRENCY_CONVERSION)
@RestController
@RequestMapping(value = "convert")
@Slf4j
@RequiredArgsConstructor
public class CurrencyConversionController {

    private final CurrencyConversionService currencyConversionService;

    @ApiOperation(value = "Convert Currency from a given country to target country", authorizations = @Authorization(value = "Bearer"), response = ExchangeValueDTO.class)
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "Currency is converted to target country currency"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "You are not authorized to send a request")
    })
    @GetMapping(value = "/{from}/to/{to}/q/{quantity}", produces = MediaType.APPLICATION_JSON)
    public ExchangeValueDTO getCurrencyConversion(
            Principal principal,
            @PathVariable("from") String from,
            @PathVariable("to") String to,
            @PathVariable("quantity") Double quantity) {
        log.info("AUTH: {}", principal);
        return currencyConversionService.convertCurrency(principal, from, to, quantity);
    }
}
