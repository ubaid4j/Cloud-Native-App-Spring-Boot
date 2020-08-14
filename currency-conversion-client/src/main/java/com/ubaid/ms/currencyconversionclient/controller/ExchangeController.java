package com.ubaid.ms.currencyconversionclient.controller;

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
import com.ubaid.ms.currencyconversionclient.entity.CurrencyConversion;
import com.ubaid.ms.currencyconversionclient.feignProxy.ExchangeProxy;


@RestController
@RequestMapping(value = "splgbi")
public class ExchangeController
{
	@Autowired
	private ExchangeProxy proxy;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping("/{from}/to/{to}/q/{quantity}")
	public CurrencyConversion getCurrencyConversion(
			@PathVariable("from") String from,
			@PathVariable("to") String to,
			@PathVariable("quantity") BigDecimal quantity)
	{
		CurrencyConversion currencyConversion = proxy.getCurrencyConversion(from, to, quantity);
		HttpServletResponse response = RequestContext.getCurrentContext().getResponse();
		logger.info("response =========> {}", response);
		return currencyConversion;
	}

}
