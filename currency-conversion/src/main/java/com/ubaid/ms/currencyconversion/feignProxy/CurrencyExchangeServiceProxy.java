package com.ubaid.ms.currencyconversion.feignProxy;

import static com.ubaid.ms.common.util.Constants.*;

import com.ubaid.ms.common.dto.ExchangeValueDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

@FeignClient(name = API_GATEWAY)
public interface CurrencyExchangeServiceProxy {

    @GetMapping("currency-exchange/v1/from/{from}/to/{to}")
    ExchangeValueDTO getCurrencyExchangeRate(
            @RequestHeader(value = AUTHORIZATION) String token,
            @PathVariable(value = "from") String from,
            @PathVariable(value = "to") String to);
}