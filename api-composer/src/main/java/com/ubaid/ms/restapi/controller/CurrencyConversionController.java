package com.ubaid.ms.restapi.controller;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.restapi.service.CurrencyConversionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.cors.CorsConfiguration;

import javax.annotation.security.RolesAllowed;
import java.security.Principal;

@RestController
@RequestMapping(value = "convert")
@Slf4j
@RequiredArgsConstructor
public class CurrencyConversionController {

    private final CurrencyConversionService currencyConversionService;

    @GetMapping("/{from}/to/{to}/q/{quantity}")
    public ExchangeValueDTO getCurrencyConversion(
            @PathVariable("from") String from,
            @PathVariable("to") String to,
            @PathVariable("quantity") Double quantity,
            Principal principal) {
        log.info("AUTH: {}", principal);
        return currencyConversionService.convertCurrency(principal, from, to, quantity);
    }

    @GetMapping("/")
    public String helloWorld() {
        return "Hello World";
    }
}
