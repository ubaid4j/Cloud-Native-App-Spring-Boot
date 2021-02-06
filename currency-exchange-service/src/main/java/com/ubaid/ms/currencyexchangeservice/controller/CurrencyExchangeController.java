package com.ubaid.ms.currencyexchangeservice.controller;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.currencyexchangeservice.service.ExchangeRateService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.security.RolesAllowed;

@RestController
@RequestMapping("currency-exchange")
@RequiredArgsConstructor
public class CurrencyExchangeController {

    private final ExchangeRateService service;

    @PreAuthorize("hasAuthority('SCOPE_exchange-rate')")
    @GetMapping("/from/{from}/to/{to}")
    public ExchangeValueDTO getExchangeValue(@PathVariable("from") String from,
                                             @PathVariable("to") String to) {
        return service.getExchangeValue(from, to);
    }
}
