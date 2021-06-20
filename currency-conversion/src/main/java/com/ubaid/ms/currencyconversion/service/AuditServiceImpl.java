package com.ubaid.ms.currencyconversion.service;

import com.ubaid.ms.common.dto.AuditDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuditServiceImpl implements AuditService {

    private final RabbitTemplate rabbitTemplate;
    private final Queue queue;

    @Override
    public void sendAuditLogToMQ(AuditDTO auditDTO) {
        log.debug("Sending Audit Log [{}] to message broker", auditDTO);
        rabbitTemplate.convertAndSend(queue.getName(), auditDTO);
    }
}
