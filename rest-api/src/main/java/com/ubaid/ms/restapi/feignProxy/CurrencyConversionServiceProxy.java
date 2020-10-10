package com.ubaid.ms.restapi.feignProxy;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "netflix-zuul-api-gateway-server")
@RibbonClient(name = "currency-conversion-service")
public interface CurrencyConversionServiceProxy {

    @GetMapping("currency-conversion-service/currency-conversion/currency/{currency}/rate/{conversion-rate}")
    ConvertedCurrency convert(@PathVariable("currency") Double currency, @PathVariable("conversion-rate") Double rate);
}
