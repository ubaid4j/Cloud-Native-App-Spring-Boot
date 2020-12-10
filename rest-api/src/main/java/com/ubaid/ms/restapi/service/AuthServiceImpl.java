package com.ubaid.ms.restapi.service;

import com.ubaid.ms.restapi.feignProxy.AuthTokenServiceProxy;
import com.ubaid.ms.restapi.util.BearerToken;
import lombok.RequiredArgsConstructor;
import org.keycloak.KeycloakPrincipal;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {

    private static final String GRANT_TYPE = "grant_type";
    private static final String CLIENT_ID = "client_id";
    private static final String CLIENT_SECRET = "client_secret";
    private static final String USERNAME = "username";
    private static final String PASSWORD = "password";

    @Value("${keycloak.resource}")
    private String clientId;

    @Value("${keycloak.credentials.secret}")
    private String clientSecret;

    private final AuthTokenServiceProxy authTokenServiceProxy;

    @Override
    public String getBearerToken() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        KeycloakPrincipal<?> principal = (KeycloakPrincipal<?>) authentication.getPrincipal();
        String token = principal.getKeycloakSecurityContext().getTokenString();
        BearerToken bearerToken = new BearerToken(token);
        return bearerToken.getBearerToken();
    }

    @Override
    public Map<String, ?> login(String username, String password) {
        Map<String, Object> form = new HashMap<>();
        String grantType = "password";
        form.put(GRANT_TYPE, grantType);
        form.put(CLIENT_ID, clientId);
        form.put(CLIENT_SECRET, clientSecret);
        form.put(USERNAME, username);
        form.put(PASSWORD, password);
        return authTokenServiceProxy.login(form);
    }
}
