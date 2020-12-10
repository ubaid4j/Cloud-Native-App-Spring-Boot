package com.ubaid.ms.restapi.service;

import com.ubaid.ms.restapi.util.BearerToken;
import org.keycloak.KeycloakPrincipal;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService {

    @Override
    public String getBearerToken() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        KeycloakPrincipal<?> principal = (KeycloakPrincipal<?>) authentication.getPrincipal();
        String token = principal.getKeycloakSecurityContext().getTokenString();
        BearerToken bearerToken = new BearerToken(token);
        return bearerToken.getBearerToken();
    }
}
