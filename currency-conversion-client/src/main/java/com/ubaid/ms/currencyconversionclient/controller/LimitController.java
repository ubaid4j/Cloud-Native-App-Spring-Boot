package com.ubaid.ms.currencyconversionclient.controller;


import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.netflix.zuul.context.RequestContext;
import com.ubaid.ms.currencyconversionclient.entity.Limit;
import com.ubaid.ms.currencyconversionclient.feignProxy.LimitProxy;

@RestController
@RequestMapping(value = "splgbi")
public class LimitController
{

	@Autowired
	LimitProxy proxy;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping("/limits")
	public Limit getCurrencyConversion()
	{
		Limit limitConfig = proxy.getLimitConfig();
		HttpServletResponse response = RequestContext.getCurrentContext().getResponse();
		logger.info("response =========> {}", response);
		return limitConfig;
	}


}
