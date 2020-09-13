package com.ubaid.ms.currencyconversionclient.feignProxy;

import com.ubaid.ms.currencyconversionclient.entity.Limit;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name = "netflix-zuul-api-gateway-server")
@RibbonClient(name = "limits-service")
public interface LimitProxy {
    @GetMapping("/limits-service/limits")
    Limit getLimitConfig();
}
