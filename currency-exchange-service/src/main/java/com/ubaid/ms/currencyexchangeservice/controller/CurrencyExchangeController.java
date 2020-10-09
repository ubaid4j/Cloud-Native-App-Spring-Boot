package com.ubaid.ms.currencyexchangeservice.controller;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.currencyexchangeservice.service.ExchangeValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("currency-exchange")
public class CurrencyExchangeController {

    private final ExchangeValueService service;

    @Autowired
    public CurrencyExchangeController(ExchangeValueService exchangeValueService) {
        this.service = exchangeValueService;
    }

    @GetMapping("/from/{from}/to/{to}")
    public ExchangeValueDTO getExchangeValue(@PathVariable("from") String from,
                                             @PathVariable("to") String to) {
        return service.getExchangeValue(from, to);
    }
}
