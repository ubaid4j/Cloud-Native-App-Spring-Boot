package com.ubaid.ms.restapi.service;

import java.util.Map;

/**
 * get the access token from the keycloak
 * @author ubaid
 */
public interface LoginService {
    Map<String, ?> login(String username, String password);
}
