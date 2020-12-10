package com.ubaid.ms.restapi.service;

import java.util.Map;

/**
 * Return a bearer token in full format
 * @author ubaid
 */
public interface AuthService {
    String getBearerToken();
    Map<String, ?> login(String username, String password);
}
