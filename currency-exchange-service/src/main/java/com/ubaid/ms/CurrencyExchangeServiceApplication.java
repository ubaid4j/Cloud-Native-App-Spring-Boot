package com.ubaid.ms;

import brave.sampler.Sampler;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableDiscoveryClient
@EnableAspectJAutoProxy
@EnableScheduling
public class CurrencyExchangeServiceApplication {

    // TODO: 10/7/20  check this api https://freecurrencyrates.com/ 
    // TODO: 10/7/20 check this one https://exchangeratesapi.io/ 
    // TODO: 10/7/20 check this too  https://fixer.io/product
    
    public static void main(String[] args) {
        SpringApplication.run(CurrencyExchangeServiceApplication.class, args);
    }

    @Bean
    public Sampler defaultSampler() {
        return Sampler.ALWAYS_SAMPLE;
    }
}
