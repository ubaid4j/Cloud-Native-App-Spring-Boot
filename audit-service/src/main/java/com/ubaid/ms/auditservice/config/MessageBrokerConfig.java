package com.ubaid.ms.auditservice.config;

import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MessageBrokerConfig {

    @Bean
    public Queue auditQueue() {
        return new Queue("auditQueue", false);
    }

}
