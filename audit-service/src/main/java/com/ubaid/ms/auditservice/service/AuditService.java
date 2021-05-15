package com.ubaid.ms.auditservice.service;

import com.ubaid.ms.auditservice.entity.Audit;
import com.ubaid.ms.ccdto.AuditDTO;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.security.Principal;
import java.util.UUID;

public interface AuditService {
    Mono<Audit> findById(Long id);
    Flux<Audit> findAllByUserUUID(Principal principal);
    Flux<Audit> findAll();
    Mono<Audit> save(Principal principal, Audit audit);
    Mono<Audit> update(Principal principal, Audit audit);
    Mono<Void> delete(Long id);
}
