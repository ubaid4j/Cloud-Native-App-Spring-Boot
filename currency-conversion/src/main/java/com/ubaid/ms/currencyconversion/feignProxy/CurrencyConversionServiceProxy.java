package com.ubaid.ms.currencyconversion.feignProxy;

import static com.ubaid.ms.common.util.Constants.API_GATEWAY;
import static com.ubaid.ms.common.util.Constants.AUTHORIZATION;

import com.ubaid.ms.common.dto.ValueDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

@FeignClient(name = API_GATEWAY)
public interface CurrencyConversionServiceProxy {

    @GetMapping("math/v1/multiply/{currency}/{conversion-rate}")
    ValueDTO convert(
            @RequestHeader(value = AUTHORIZATION) String token,
            @PathVariable("currency") Double currency,
            @PathVariable("conversion-rate") Double rate);
}
