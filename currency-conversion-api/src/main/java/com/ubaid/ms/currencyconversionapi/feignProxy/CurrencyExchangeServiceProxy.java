package com.ubaid.ms.currencyconversionapi.feignProxy;

import com.ubaid.ms.currencyconversionapi.dto.ExchangeValueDTO;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "netflix-zuul-api-gateway-server")
@RibbonClient(name = "currency-exchange-service")
public interface CurrencyExchangeServiceProxy {

    @GetMapping("currency-exchange-service/currency-exchange/from/{from}/to/{to}")
    ExchangeValueDTO getCurrencyExchangeRate(
            @PathVariable(value = "from") String from,
            @PathVariable(value = "to") String to);
}