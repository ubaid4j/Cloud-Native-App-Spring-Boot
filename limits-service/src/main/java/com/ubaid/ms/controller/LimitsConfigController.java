package com.ubaid.ms.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.netflix.zuul.context.RequestContext;
import com.ubaid.ms.config.Config;
import com.ubaid.ms.entity.LimitsConfig;

@RestController
public class LimitsConfigController
{
	@Autowired
	private Config config;

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@GetMapping("/limits")
	public LimitsConfig retrieveLimitConfig()
	{
		
		HttpServletResponse response = RequestContext.getCurrentContext().getResponse();
		
		logger.info("Response ========> {}", response);
		return new LimitsConfig(config.getMax(), config.getMin());
	}
}
