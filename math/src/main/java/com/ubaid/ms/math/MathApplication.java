package com.ubaid.ms.math;

import brave.sampler.Sampler;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;


@SpringBootApplication
@EnableDiscoveryClient
public class MathApplication {

    public static void main(String[] args) {
        SpringApplication.run(MathApplication.class, args);
    }

    @Bean
    public Sampler defaultSampler() {
        return Sampler.ALWAYS_SAMPLE;
    }
}
