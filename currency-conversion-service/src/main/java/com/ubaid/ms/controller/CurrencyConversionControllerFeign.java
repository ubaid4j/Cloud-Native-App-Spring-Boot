package com.ubaid.ms.controller;

import com.netflix.zuul.context.RequestContext;
import com.ubaid.ms.entity.CurrencyConversion;
import com.ubaid.ms.feignProxy.FeignProxy;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;

@RestController
@RequestMapping("currency-conversion")
@Slf4j
public class CurrencyConversionControllerFeign {
    private final FeignProxy proxy;

    @Autowired
    public CurrencyConversionControllerFeign(FeignProxy proxy) {
        this.proxy = proxy;
    }

    @GetMapping("/from/{from}/to/{to}/quantity/{quantity}")
    public CurrencyConversion getCurrencyConversion(
            @PathVariable("from") String from,
            @PathVariable("to") String to,
            @PathVariable("quantity") BigDecimal quantity) {
        CurrencyConversion currencyConversion = proxy.getCurrentConversion(from, to);
        currencyConversion.setQuantity(quantity);

        HttpServletResponse response = RequestContext.getCurrentContext().getResponse();
        log.info("response =========> {}", response);
        return currencyConversion;
    }

}
