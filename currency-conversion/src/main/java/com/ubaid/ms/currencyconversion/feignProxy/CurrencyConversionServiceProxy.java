package com.ubaid.ms.currencyconversion.feignProxy;

import static com.ubaid.ms.common.util.Constants.API_GATEWAY;
import static com.ubaid.ms.common.util.Constants.AUTHORIZATION;

import com.ubaid.ms.common.dto.ConvertedCurrency;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

@FeignClient(name = API_GATEWAY)
public interface CurrencyConversionServiceProxy {

    @GetMapping("api/math/v1/multiply/currency/{currency}/rate/{conversion-rate}")
    ConvertedCurrency convert(
            @RequestHeader(value = AUTHORIZATION) String token,
            @PathVariable("currency") Double currency,
            @PathVariable("conversion-rate") Double rate);
}
