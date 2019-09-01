package com.ubaid.ms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ubaid.ms.config.Config;
import com.ubaid.ms.entity.LimitsConfig;

@RestController
public class LimitsConfigController
{
	@Autowired
	private Config config;
	
	@GetMapping("/limits")
	public LimitsConfig retrieveLimitConfig()
	{
		return new LimitsConfig(config.getMax(), config.getMin());
	}
}
