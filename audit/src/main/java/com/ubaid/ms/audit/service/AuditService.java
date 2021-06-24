package com.ubaid.ms.audit.service;

import com.ubaid.ms.audit.entity.Audit;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.security.Principal;

public interface AuditService {
    Mono<Audit> findById(Long id);
    Flux<Audit> findAllByUserUUID(Principal principal);
    Flux<Audit> findAll();
    Mono<Audit> save(Principal principal, Audit audit);
    Mono<Audit> update(Principal principal, Audit audit);
    void save(Audit audit);
    Mono<Void> delete(Long id);
}
