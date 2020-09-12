package com.ubaid.ms.currencyconversionclient.controller;


import com.netflix.zuul.context.RequestContext;
import com.ubaid.ms.currencyconversionclient.entity.Limit;
import com.ubaid.ms.currencyconversionclient.feignProxy.LimitProxy;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping(value = "splgbi")
@Slf4j
public class LimitController {

    private final LimitProxy proxy;

    @Autowired
    public LimitController(LimitProxy proxy) {
        this.proxy = proxy;
    }

    @GetMapping("/limits")
    public Limit getCurrencyConversion() {
        Limit limitConfig = proxy.getLimitConfig();
        HttpServletResponse response = RequestContext.getCurrentContext().getResponse();
        log.info("response =========> {}", response);
        return limitConfig;
    }
}
