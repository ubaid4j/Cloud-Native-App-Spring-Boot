package com.ubaid.ms.currencyexchangeservice.controller;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.currencyexchangeservice.config.SwaggerConfig;
import com.ubaid.ms.currencyexchangeservice.service.ExchangeRateService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.ubaid.ms.common.Constants.BEARER;
import static java.net.HttpURLConnection.HTTP_OK;
import static java.net.HttpURLConnection.HTTP_UNAUTHORIZED;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;


@Api(tags = SwaggerConfig.EXCHANGE)
@RestController
@RequestMapping("currency-exchange")
@RequiredArgsConstructor
public class CurrencyExchangeController {

    private final ExchangeRateService service;

    @ApiOperation(
            value = "Get Exchange value of given two currencies",
            authorizations = @Authorization(value = BEARER),
            response = ExchangeValueDTO.class)
    @ApiResponses({
            @ApiResponse(code = HTTP_OK, message = "Got exchange rate successfully"),
            @ApiResponse(code = HTTP_UNAUTHORIZED, message = "You are not authorized to get exchange rate")
    })
    @PreAuthorize("hasAuthority('SCOPE_exchange-rate')")
    @GetMapping(value = "/from/{from}/to/{to}", produces = APPLICATION_JSON_VALUE)
    public ExchangeValueDTO getExchangeValue(@PathVariable("from") String from,
                                             @PathVariable("to") String to) {
        return service.getExchangeValue(from, to);
    }
}
