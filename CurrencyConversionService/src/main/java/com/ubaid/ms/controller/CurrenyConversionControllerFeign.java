package com.ubaid.ms.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.netflix.zuul.context.RequestContext;
//TODO uncomment
//import com.netflix.zuul.context.RequestContext;
import com.ubaid.ms.entity.CurrencyConversion;
import com.ubaid.ms.feignProxy.FeignProxy;

@RestController
@RequestMapping("currency-conversion")
public class CurrenyConversionControllerFeign
{
	@Autowired
	private FeignProxy proxy;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping("/from/{from}/to/{to}/quantity/{quantity}")
	public CurrencyConversion getCurrencyConversion(
			@PathVariable("from") String from,
			@PathVariable("to") String to,
			@PathVariable("quantity") BigDecimal quantity)
	{
		CurrencyConversion currencyConversion = proxy.getCurrentConversion(from, to);
		currencyConversion.setQuantity(quantity);

		HttpServletResponse response = RequestContext.getCurrentContext().getResponse();
		logger.info("response =========> {}", response);
		return currencyConversion;
	}
	
}
