package com.ubaid.ms.currencyconversionservice.config.validator;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.oauth2.core.OAuth2Error;
import org.springframework.security.oauth2.core.OAuth2TokenValidator;
import org.springframework.security.oauth2.core.OAuth2TokenValidatorResult;
import org.springframework.security.oauth2.jwt.Jwt;

@Slf4j
public class AudienceValidator implements OAuth2TokenValidator<Jwt> {

    private final OAuth2Error error = new OAuth2Error("invalid_token", "The required audience is missing", null);
    private final static String AUD = "currency-conversion-service";

    @Override
    public OAuth2TokenValidatorResult validate(Jwt jwt) {
        if (jwt.getAudience().contains(AUD)) {
            return OAuth2TokenValidatorResult.success();
        } else {
            log.error("The required audience {} is missing from the token", AUD);
            return OAuth2TokenValidatorResult.failure(error);
        }
    }
}
