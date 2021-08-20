package com.ubaid.ms.currencyconversion.service;

import org.springframework.security.core.Authentication;

public interface AuthService {
    Authentication getAuthentication();
    String getAccessToken();
    String getBearerToken();
    String getUserUUID();
}
