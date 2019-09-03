package com.ubaid.ms.feignProxy;

import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ubaid.ms.entity.CurrencyConversion;

@FeignClient(name = "currency-exchange-service")
@RibbonClient(name = "currency-exchange-service")
public interface FeignProxy
{
	@GetMapping("currency-exchange/from/{from}/to/{to}")
	public CurrencyConversion getCurrentConversion(
			@PathVariable("from") String from,
			@PathVariable("to") String to);
}
