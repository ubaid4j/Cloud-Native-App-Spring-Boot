package com.ubaid.ms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ubaid.ms.entity.ExchangeValue;
import com.ubaid.ms.service.ExchangeValueService;

@RestController
@RequestMapping("currency-exchange")
public class CurrencyConversionController
{
	@Autowired
	private Environment env;
	
	@Autowired
	private ExchangeValueService service;
	
	@GetMapping("/from/{from}/to/{to}")
	public ExchangeValue getExchangeValue(@PathVariable("from") String from, 
			@PathVariable("to") String to)
	{
		int port = Integer.parseInt(env.getProperty("local.server.port"));
		ExchangeValue exchangeValue = service.getExchangeValue(from, to);
		if(exchangeValue != null)
			exchangeValue.setPort(port);
		return exchangeValue;
	}
}
