package com.ubaid.ms.currencyconversion.service;

import com.ubaid.ms.common.dto.AuditDTO;

public interface AuditService {
    void sendAuditLogToMQ(AuditDTO auditDTO);
}
