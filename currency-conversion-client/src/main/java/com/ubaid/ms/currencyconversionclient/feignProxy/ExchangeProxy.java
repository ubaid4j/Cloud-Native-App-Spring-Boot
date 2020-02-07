package com.ubaid.ms.currencyconversionclient.feignProxy;

import java.math.BigDecimal;

import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ubaid.ms.currencyconversionclient.entity.CurrencyConversion;

@FeignClient(name = "netflix-zuul-api-gateway-server1")
@RibbonClient(name = "currency-conversion-service")
public interface ExchangeProxy
{

	@GetMapping("currency-conversion-service/currency-conversion/from/{from}/to/{to}/quantity/{quantity}")
	public CurrencyConversion getCurrencyConversion(
			@PathVariable(value = "from") String from,
			@PathVariable(value = "to") String to,
			@PathVariable(value = "quantity") BigDecimal quantity);
}
