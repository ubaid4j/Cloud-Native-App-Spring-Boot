package com.ubaid.ms.currencyconversion.util;

import lombok.Data;

import static com.ubaid.ms.common.util.Constants.*;

@Data
public class BearerToken {

    private final String bearerToken;

    public BearerToken(String accessToken) {
        this.bearerToken = BEARER + SINGLE_SPACE + accessToken;
    }

}
