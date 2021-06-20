package com.ubaid.ms.apicomposer.service;

import com.ubaid.ms.ccdto.AuditDTO;

public interface AuditService {
    void sendAuditLogToMQ(AuditDTO auditDTO);
}
