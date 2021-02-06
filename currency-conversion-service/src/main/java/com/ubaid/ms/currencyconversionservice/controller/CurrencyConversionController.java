package com.ubaid.ms.currencyconversionservice.controller;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.currencyconversionservice.service.CurrencyConversionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.security.RolesAllowed;

@RestController
@RequestMapping("currency-conversion")
@Slf4j
@RequiredArgsConstructor
public class CurrencyConversionController {

    private final CurrencyConversionService currencyConversionService;

    @PreAuthorize("hasAuthority('SCOPE_currency-conversion')")
    @GetMapping("/currency/{currency}/rate/{conversion-rate}")
    public ConvertedCurrency getCurrencyConversion(
            @PathVariable("currency") Double currency,
            @PathVariable("conversion-rate") Double conversionRate) {
        return currencyConversionService.convert(currency, conversionRate);
    }
}
