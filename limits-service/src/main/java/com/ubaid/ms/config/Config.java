package com.ubaid.ms.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 
 * 
 * and define the prefix
 * same as in the application.properties file 
 * 
 * @author UbaidurRehman
 *
 */

@ConfigurationProperties(prefix = "limits-service")
@Component
public class Config
{
	
	private int min;
	private int max;

	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}

	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public Config(int min, int max) {
		this.min = min;
		this.max = max;
	}
		
	public Config()
	{

	}
	
}
