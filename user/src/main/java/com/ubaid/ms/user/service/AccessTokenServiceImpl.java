package com.ubaid.ms.user.service;


import com.ubaid.ms.user.feignproxy.AuthTokenServiceProxy;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AccessTokenServiceImpl implements AccessTokenService {

    private static final String GRANT_TYPE = "grant_type";
    private static final String CLIENT_ID = "client_id";
    private static final String USERNAME = "username";
    private static final String PASSWORD = "password";

    private final AuthTokenServiceProxy authProxy;

    @Override
    public String getAccessToken(String username, String password) {
        Map<String, Object> form = new HashMap<>();
        form.put(GRANT_TYPE, "password");
        form.put(CLIENT_ID, "3cn-react-client");
        form.put(USERNAME, username);
        form.put(PASSWORD, password);
        return String.valueOf(authProxy.getAccessToken(form).get("access_token"));
    }
}
