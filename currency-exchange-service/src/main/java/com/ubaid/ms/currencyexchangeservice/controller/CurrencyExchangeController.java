package com.ubaid.ms.currencyexchangeservice.controller;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.currencyexchangeservice.service.ExchangeRateService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("currency-exchange")
@RequiredArgsConstructor
public class CurrencyExchangeController {

    private final ExchangeRateService service;

    @GetMapping("/from/{from}/to/{to}")
    public ExchangeValueDTO getExchangeValue(@PathVariable("from") String from,
                                             @PathVariable("to") String to) {
        return service.getExchangeValue(from, to);
    }
}
