package com.ubaid.ms.controller;

import com.netflix.zuul.context.RequestContext;
import com.ubaid.ms.dto.ConvertedCurrency;
import com.ubaid.ms.service.CurrencyConversionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

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
        HttpServletResponse response = RequestContext.getCurrentContext().getResponse();
        log.info("response =========> {}", response);
        return currencyConversionService.convert(currency, conversionRate);
    }

}
