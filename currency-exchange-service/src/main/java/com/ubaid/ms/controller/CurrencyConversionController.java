package com.ubaid.ms.controller;

import com.netflix.zuul.context.RequestContext;
import com.ubaid.ms.dto.ExchangeValueDTO;
import com.ubaid.ms.service.ExchangeValueService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;


@RestController
@RequestMapping("currency-exchange")
@Slf4j
public class CurrencyConversionController {

    private final ExchangeValueService service;

    @Autowired
    public CurrencyConversionController(ExchangeValueService exchangeValueService) {
        this.service = exchangeValueService;
    }

    @GetMapping("/from/{from}/to/{to}")
    public ExchangeValueDTO getExchangeValue(@PathVariable("from") String from,
                                             @PathVariable("to") String to) {
        HttpServletResponse response = RequestContext.getCurrentContext().getResponse();
        log.info("response ==========> {}", response);
        return service.getExchangeValue(from, to);
    }
}
