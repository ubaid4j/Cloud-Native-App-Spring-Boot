package com.ubaid.ms.restapi.feignProxy;

import com.ubaid.ms.ccdto.CountryCodeDTO;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@FeignClient("netflix-zuul-api-gateway-server")
@RibbonClient("country-service")
public interface CountryServiceProxy {

    @GetMapping("country-service/country/code")
    List<CountryCodeDTO> getAll();
}
