package com.ubaid.ms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;

//TODO uncomment
//import brave.sampler.Sampler;

@SpringBootApplication
@EnableFeignClients(basePackages = {"com.ubaid.ms"})
//TODO uncomment
//@EnableDiscoveryClient
public class CurrencyConversionServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(CurrencyConversionServiceApplication.class, args);
	}

	//TODO uncomment
//	@Bean
//	public Sampler defaultSampler()
//	{
//		return Sampler.ALWAYS_SAMPLE;
//	}
}
