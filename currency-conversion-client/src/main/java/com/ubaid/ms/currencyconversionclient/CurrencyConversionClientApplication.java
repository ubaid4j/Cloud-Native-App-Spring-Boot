package com.ubaid.ms.currencyconversionclient;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients(basePackages = {"com.ubaid.ms"})
@EnableDiscoveryClient
public class CurrencyConversionClientApplication
{

	public static void main(String[] args) {
		SpringApplication.run(CurrencyConversionClientApplication.class, args);
	}

}
