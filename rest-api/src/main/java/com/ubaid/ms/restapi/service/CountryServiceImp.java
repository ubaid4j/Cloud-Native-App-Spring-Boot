package com.ubaid.ms.restapi.service;

import com.ubaid.ms.ccdto.CountryCodeDTO;
import com.ubaid.ms.restapi.feignProxy.CountryServiceProxy;
import lombok.RequiredArgsConstructor;
import org.keycloak.KeycloakPrincipal;
import org.keycloak.adapters.RefreshableKeycloakSecurityContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CountryServiceImp implements CountryService{

    private final CountryServiceProxy countryServiceProxy;

    @Override
    public List<CountryCodeDTO> getAll() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        KeycloakPrincipal<?> principal = (KeycloakPrincipal<?>) authentication.getPrincipal();
        String token = principal.getKeycloakSecurityContext().getTokenString();
        return countryServiceProxy.getAll("Bearer " + token);
    }
}
