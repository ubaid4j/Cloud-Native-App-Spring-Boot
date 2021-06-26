package com.ubaid.ms.audit.service;

import com.ubaid.ms.audit.dao.AuditDAO;
import com.ubaid.ms.audit.entity.Audit;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.AbstractOAuth2TokenAuthenticationToken;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.security.Principal;
import java.util.Optional;

import static com.ubaid.ms.common.util.Constants.EMPTY_STRING;

@RequiredArgsConstructor
@Slf4j
@Service
public class AuditServiceImpl implements AuditService {

    private final AuditDAO auditDAO;

    @Override
    public Mono<Audit> save(Principal principal, Audit audit) {
        log.debug("Saving Audit Log: {}", audit);
        audit.setUserUuid(getUserUUID(principal));
        return auditDAO.save(audit);
    }

    @Override
    public void save(Audit audit) {
        log.debug("Saving Audit Log: {}", audit);
        Mono<Audit> savedAudit = auditDAO.save(audit);
        log.debug("Audit Log saved: {}", savedAudit.block());
    }

    @Override
    public Mono<Audit> update(Principal principal, Audit audit) {
        log.debug("Updating Audit Log of Id {} to {}", audit.getId(), audit);
        return auditDAO.save(audit);
    }

    @Override
    public Flux<Audit> findAllByUserUUID(Principal principal) {
        log.debug("Finding all Audits by User UUID");
        String userUUID = getUserUUID(principal);
        return auditDAO.findAllByUserUuid(userUUID);
    }

    @Override
    public Flux<Audit> findAll() {
        log.debug("Finding all Audit Logs");
        return auditDAO.findAll();
    }

    @Override
    public Mono<Void> delete(Long id) {
        log.debug("Deleting Audit of UUID: {}", id);
        return auditDAO.delete(id);
    }

    @Override
    public Mono<Audit> findById(Long id) {
        log.debug("Finding Audit using: {}", id);
        return auditDAO.findById(id);
    }

    public String getUserUUID(Principal principal) {
        if (principal instanceof JwtAuthenticationToken jwtAuth) {
            return Optional
                    .of(jwtAuth)
                    .map(AbstractOAuth2TokenAuthenticationToken::getToken)
                    .map(Jwt::getClaims)
                    .map(claimsMap -> claimsMap.get("sub"))
                    .map(String::valueOf)
                    .map(this::logUserUUID)
                    .orElse(EMPTY_STRING);
        } else {
            return EMPTY_STRING;
        }
    }

    private String logUserUUID(String userUUID) {
        log.debug("User UUID: {}: ", userUUID);
        return userUUID;
    }
}
