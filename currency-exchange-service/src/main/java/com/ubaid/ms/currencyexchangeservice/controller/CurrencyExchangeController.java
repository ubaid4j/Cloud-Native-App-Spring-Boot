package com.ubaid.ms.currencyexchangeservice.controller;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.currencyexchangeservice.config.SwaggerConfig;
import com.ubaid.ms.currencyexchangeservice.service.ExchangeRateService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.apache.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.security.RolesAllowed;

@Api(tags = SwaggerConfig.EXCHANGE)
@RestController
@RequestMapping("currency-exchange")
@RequiredArgsConstructor
public class CurrencyExchangeController {

    private final ExchangeRateService service;

    @ApiOperation(value = "Get Exchange value of given two currencies", response = ExchangeValueDTO.class)
    @ApiResponses({
            @ApiResponse(code = HttpStatus.SC_OK, message = "Got exchange rate successfully"),
            @ApiResponse(code = HttpStatus.SC_UNAUTHORIZED, message = "You are not authorized to get exchange rate")
    })
    @PreAuthorize("hasAuthority('SCOPE_exchange-rate')")
    @GetMapping(value = "/from/{from}/to/{to}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ExchangeValueDTO getExchangeValue(@PathVariable("from") String from,
                                             @PathVariable("to") String to) {
        return service.getExchangeValue(from, to);
    }
}
