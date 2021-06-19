package com.ubaid.ms.auditservice.listener;

import com.ubaid.ms.auditservice.entity.Audit;
import com.ubaid.ms.auditservice.service.AuditService;
import com.ubaid.ms.ccdto.AuditDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

import java.time.Instant;

@Service
@Slf4j
@RequiredArgsConstructor
@RabbitListener(queues = "auditQueue")
public class ListenAuditLogs {

    private final AuditService auditService;

    @RabbitHandler
    public void listen(AuditDTO auditDTO) {
        log.debug("Received Audit: {}", auditDTO);
        Audit audit = new Audit();
        audit.setCreatedAt(Instant.now());
        audit.setExchangeRate(auditDTO.exchangeRate());
        audit.setFromCurrency(auditDTO.fromCurrency());
        audit.setFromCurrencyValue(auditDTO.fromCurrencyValue());
        audit.setToCurrency(auditDTO.toCurrency());
        audit.setToCurrencyValue(auditDTO.toCurrencyValue());
        audit.setUserUuid(auditDTO.userUUID());
        auditService.save(audit);
    }

}
