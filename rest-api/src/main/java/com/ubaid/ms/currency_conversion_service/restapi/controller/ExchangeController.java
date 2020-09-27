package com.ubaid.ms.currency_conversion_service.restapi.controller;

import com.ubaid.ms.currency_conversion_service.restapi.dto.ExchangeValueDTO;
import com.ubaid.ms.currency_conversion_service.restapi.service.CurrencyConversionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "exchange")
@Slf4j
public class ExchangeController {

    private final CurrencyConversionService currencyConversionService;

    @Autowired
    public ExchangeController(CurrencyConversionService currencyConversionService) {
        this.currencyConversionService = currencyConversionService;
    }

    @GetMapping("/{from}/to/{to}/q/{quantity}")
    public ExchangeValueDTO getCurrencyConversion(
            @PathVariable("from") String from,
            @PathVariable("to") String to,
            @PathVariable("quantity") Integer quantity) {
        return currencyConversionService.convertCurrency(from, to, quantity);
    }

}
