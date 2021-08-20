package com.ubaid.ms.currencyconversion.service;

import com.ubaid.ms.currencyconversion.util.BearerToken;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

import static com.ubaid.ms.common.util.Constants.EMPTY_STRING;

@Service
@Slf4j
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {

    private final JwtDecoder jwtDecoder;

    @Override
    public Authentication getAuthentication() {
        return SecurityContextHolder.getContext().getAuthentication();
    }

    @Override
    public String getAccessToken() {
        Authentication auth = getAuthentication();
        if (auth.getPrincipal() instanceof Jwt jwt) {
            return jwt.getTokenValue();
        } else {
            return EMPTY_STRING;
        }
    }

    @Override
    public String getBearerToken() {
        BearerToken bearerToken = new BearerToken(getAccessToken());
        return bearerToken.getBearerToken();
    }

    @Override
    public String getUserUUID() {
        return Optional
            .ofNullable(jwtDecoder.decode(getAccessToken()))
            .map(Jwt::getClaims)
            .map(claimsMap -> claimsMap.get("sub"))
            .map(String::valueOf)
            .map(this::logUserUUID)
            .orElseGet(this::logWarnMessageAndSendEmptyString);
    }

    private String logUserUUID(String userUUID) {
        log.debug("User UUID: {}: ", userUUID);
        return userUUID;
    }

    private String logWarnMessageAndSendEmptyString() {
        log.warn("User UUID not found");
        return EMPTY_STRING;
    }
}
