package com.ubaid.ms.auditservice.config;

import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import static com.ubaid.ms.common.Constants.AUDIT_QUEUE;

@Configuration
public class MessageBrokerConfig {

    @Bean
    public Queue auditQueue() {
        return new Queue(AUDIT_QUEUE, false);
    }
}
