package com.ubaid.ms.apicomposer.util;

import lombok.Data;

@Data
public class BearerToken {

    private final String bearerToken;

    public BearerToken(String accessToken) {
        this.bearerToken = "Bearer " + accessToken;
    }
}
