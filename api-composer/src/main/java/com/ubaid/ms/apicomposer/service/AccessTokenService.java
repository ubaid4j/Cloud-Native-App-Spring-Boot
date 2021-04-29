package com.ubaid.ms.apicomposer.service;

import java.util.Map;

/**
 * get the access token from the keycloak
 * @author ubaid
 */
public interface AccessTokenService {
    Map<String, ?> getAccessToken(String username, String password);
}
