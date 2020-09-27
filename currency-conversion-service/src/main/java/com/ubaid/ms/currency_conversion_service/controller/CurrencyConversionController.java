package com.ubaid.ms.currency_conversion_service.controller;

import com.ubaid.ms.currency_conversion_service.service.CurrencyConversionService;
import com.ubaid.ms.currency_conversion_service.dto.ConvertedCurrency;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("currency-conversion")
@Slf4j
public class CurrencyConversionController {

    private final CurrencyConversionService currencyConversionService;

    @Autowired
    public CurrencyConversionController(CurrencyConversionService currencyConversionService) {
        this.currencyConversionService = currencyConversionService;
    }

    @GetMapping("/currency/{currency}/rate/{conversion-rate}")
    public ConvertedCurrency getCurrencyConversion(
            @PathVariable("currency") Integer currency,
            @PathVariable("conversion-rate") Integer conversionRate) {
        return currencyConversionService.convert(currency, conversionRate);
    }

}
