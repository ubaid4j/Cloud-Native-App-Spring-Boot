package com.ubaid.ms.currencyconversionclient.feignProxy;

//Feign is a declarative web service client and we use it to map our request conveniently
//name: the name of service which we want to talk
//url: where this service is hosted
//@FeignClient(name = "currency-exchange-service", url = "localhost:8000")
//@FeignClient(name="currency-exchange-service")

import com.ubaid.ms.currencyconversionclient.dto.ConvertedCurrency;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

//now name is pointing to api gateway server and
//this api gateway server will talk to eureka naming server
//now append service name in the getMapping
@FeignClient(name = "netflix-zuul-api-gateway-server")

//ribbon acts like load balancer and we have to pass the name of service which is registered in api gateway
//ribbon is used to connect this service to the other service, which link is in our props file
//and it helps to load balancing
@RibbonClient(name = "currency-conversion-service")
public interface CurrencyConversionServiceProxy {

    @GetMapping("currency-conversion-service/currency-conversion/currency/{currency}/rate/{conversion-rate}")
    ConvertedCurrency convert(@PathVariable("currency") Integer currency, @PathVariable("conversion-rate") Integer rate);
}
