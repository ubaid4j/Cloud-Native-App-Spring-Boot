package com.ubaid.ms.auditservice.listener;

import com.ubaid.ms.auditservice.entity.Audit;
import com.ubaid.ms.auditservice.service.AuditService;
import com.ubaid.ms.ccdto.AuditDTO;
import com.ubaid.ms.common.Constants;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

import java.time.Instant;


@Service
@Slf4j
@RequiredArgsConstructor
@RabbitListener(queues = Constants.AUDIT_QUEUE)
public class ListenAuditLogs {

    private final AuditService auditService;

    @RabbitHandler
    public void listen(AuditDTO auditDTO) {
        log.debug("Received Audit: {}", auditDTO);
        Audit audit = new Audit();
        Instant now = Instant.now();
        audit.setCreatedAt(now);
        audit.setLastUpdated(now);
        audit.setExchangeRate(auditDTO.exchangeRate());
        audit.setFromCurrency(auditDTO.fromCurrency());
        audit.setFromCurrencyValue(auditDTO.fromCurrencyValue());
        audit.setToCurrency(auditDTO.toCurrency());
        audit.setToCurrencyValue(auditDTO.toCurrencyValue());
        audit.setUserUuid(auditDTO.userUUID());
        audit.setCurrencyConversionPort(auditDTO.currencyConversionPort());
        audit.setCurrencyConversionURL(auditDTO.currencyConversionIP());
        audit.setCurrencyExchangePort(auditDTO.currencyExchangePort());
        audit.setCurrencyExchangeURL(auditDTO.currencyExchangeIP());
        audit.setUserIPAddress(auditDTO.userIPAddress());
        auditService.save(audit);
    }

}
