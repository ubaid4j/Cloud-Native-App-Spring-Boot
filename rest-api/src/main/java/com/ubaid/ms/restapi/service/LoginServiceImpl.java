package com.ubaid.ms.restapi.service;

import com.ubaid.ms.restapi.feignProxy.AuthTokenServiceProxy;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

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
