package com.ubaid.ms.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//TODO uncomment
//import com.netflix.zuul.context.RequestContext;
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
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping("/from/{from}/to/{to}")
	public ExchangeValue getExchangeValue(@PathVariable("from") String from, 
			@PathVariable("to") String to)
	{
		int port = Integer.parseInt(env.getProperty("local.server.port"));
		ExchangeValue exchangeValue = service.getExchangeValue(from, to);
		if(exchangeValue != null)
			exchangeValue.setPort(port);
		//TODO uncomment		
//		HttpServletResponse response = RequestContext.getCurrentContext().getResponse();
//		logger.info("respose ==========> {}", response);
		
		return exchangeValue;
	}
}
