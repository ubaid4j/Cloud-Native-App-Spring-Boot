package com.ubaid.ms.auditservice.controller;

import com.ubaid.ms.auditservice.entity.Audit;
import com.ubaid.ms.auditservice.service.AuditService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.security.Principal;
import java.util.UUID;

@RestController
@RequestMapping("audit-service")
@RequiredArgsConstructor
public class AuditController {

    private final AuditService auditService;

    @GetMapping("/{id}")
    public Mono<Audit> findById(@PathVariable Long id) {
        return auditService.findById(id);
    }

    @GetMapping("/user")
    public Flux<Audit> findAllByUserId(Principal principal) {
        return auditService
                .findAllByUserUUID(principal);
    }

    @GetMapping
    public Flux<Audit> findAll() {
        return auditService.findAll();
    }


    @PostMapping
    public Mono<Audit> save(Principal principal, @RequestBody Audit audit) {
        return auditService.save(principal, audit);
    }

    @PutMapping
    public Mono<Audit> update(Principal principal, @RequestBody Audit audit) {
        return auditService.update(principal, audit);
    }

    @DeleteMapping("/{id}")
    public Mono<Void> delete(@PathVariable Long id) {
        return auditService.delete(id);
    }


}
