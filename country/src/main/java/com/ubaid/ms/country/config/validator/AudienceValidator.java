package com.ubaid.ms.country.config.validator;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.oauth2.core.OAuth2Error;
import org.springframework.security.oauth2.core.OAuth2TokenValidator;
import org.springframework.security.oauth2.core.OAuth2TokenValidatorResult;
import org.springframework.security.oauth2.jwt.Jwt;

import static com.ubaid.ms.common.util.Constants.*;

/**
 * This class is responsible to validate {@link AudienceValidator#AUD} in JWT token in the incoming request
 * @author ubaid
 */
@Slf4j
public class AudienceValidator implements OAuth2TokenValidator<Jwt> {

    private final OAuth2Error error = new OAuth2Error(INVALID_TOKEN, String.format("The required audience %s is missing", AUD), null);
    private final static String AUD = COUNTRY_SERVICE;

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
