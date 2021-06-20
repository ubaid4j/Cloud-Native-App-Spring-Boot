package com.ubaid.ms.user.service;

/**
 * get the access token from the keycloak
 * @author ubaid
 */
public interface AccessTokenService {
    String getAccessToken(String username, String password);
}
