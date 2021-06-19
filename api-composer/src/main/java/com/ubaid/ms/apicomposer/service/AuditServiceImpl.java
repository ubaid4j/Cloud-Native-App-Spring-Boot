package com.ubaid.ms.apicomposer.service;

import com.ubaid.ms.ccdto.AuditDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuditServiceImpl implements AuditService {

    private final RabbitTemplate rabbitTemplate;
    private final Queue queue;

    @Override
    public void sendAuditLog(AuditDTO auditDTO) {
        rabbitTemplate.convertAndSend(queue.getName(), auditDTO);
    }
}
