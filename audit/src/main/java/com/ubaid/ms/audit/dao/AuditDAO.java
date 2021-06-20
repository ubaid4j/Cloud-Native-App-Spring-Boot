package com.ubaid.ms.audit.dao;

import com.ubaid.ms.audit.entity.Audit;
import org.springframework.data.r2dbc.repository.Query;
import org.springframework.data.r2dbc.repository.R2dbcRepository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface AuditDAO extends R2dbcRepository<Audit, Long> {
    Flux<Audit> findAllByUserUuid(String userUUID);

    @Query(value = "UPDATE audit SET is_deleted=true WHERE id = :id")
    Mono<Void> delete(Long id);
}
