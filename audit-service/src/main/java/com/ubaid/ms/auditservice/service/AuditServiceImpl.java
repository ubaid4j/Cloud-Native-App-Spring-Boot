package com.ubaid.ms.auditservice.service;

import com.ubaid.ms.auditservice.dao.AuditDAO;
import com.ubaid.ms.auditservice.entity.Audit;
import com.ubaid.ms.ccdto.AuditDTO;
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

import static com.ubaid.ms.common.Constants.EMPTY_STRING;

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

    public Audit convert(AuditDTO auditDTO) {
        Audit audit = new Audit();
        audit.setId(auditDTO.id());
        audit.setCurrencyConversionPort(auditDTO.currencyConversionPort());
        audit.setCurrencyConversionURL(auditDTO.currencyConversionURL());
        audit.setCurrencyExchangePort(auditDTO.currencyExchangePort());
        audit.setCurrencyExchangeURL(auditDTO.currencyExchangeURL());
        audit.setExchangeRate(auditDTO.exchangeRate());
        audit.setFromCurrency(auditDTO.fromCurrency());
        audit.setFromCurrencyValue(auditDTO.fromCurrencyValue());
        audit.setCreatedAt(auditDTO.timestamp());
        audit.setToCurrency(auditDTO.toCurrency());
        audit.setToCurrencyValue(auditDTO.toCurrencyValue());
        audit.setUserIPAddress(auditDTO.userIPAddress());
        audit.setUserUuid(auditDTO.userUUID());
        return audit;
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
