package com.ubaid.ms.restapi.feignProxy;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "spring-cloud-api-gateway-server")
@RibbonClient(name = "currency-exchange-service")
public interface CurrencyExchangeServiceProxy {

    @GetMapping("currency-exchange/from/{from}/to/{to}")
    ExchangeValueDTO getCurrencyExchangeRate(
            @PathVariable(value = "from") String from,
            @PathVariable(value = "to") String to);
}