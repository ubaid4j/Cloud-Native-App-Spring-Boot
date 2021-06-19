package com.ubaid.ms.apicomposer.service;

import org.springframework.security.core.Authentication;

public interface AuthService {
    Authentication getAuthentication();
    String getAccessToken();
    String getUserUUID();
}
