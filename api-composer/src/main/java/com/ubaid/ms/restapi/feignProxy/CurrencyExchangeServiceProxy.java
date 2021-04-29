package com.ubaid.ms.restapi.feignProxy;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

@FeignClient(name = "spring-cloud-api-gateway-server")
public interface CurrencyExchangeServiceProxy {

    @GetMapping("currency-exchange/from/{from}/to/{to}")
    ExchangeValueDTO getCurrencyExchangeRate(
            @RequestHeader(value = "Authorization") String token,
            @PathVariable(value = "from") String from,
            @PathVariable(value = "to") String to);
}