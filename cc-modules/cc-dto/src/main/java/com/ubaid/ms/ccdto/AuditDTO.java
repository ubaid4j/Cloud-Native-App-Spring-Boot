package com.ubaid.ms.ccdto;

import java.time.Instant;
import java.util.Date;
import java.util.UUID;

public record AuditDTO(
        Long id,
        String userUUID,
        Instant timestamp,
        String fromCurrency,
        String toCurrency,
        float exchangeRate,
        float fromCurrencyValue,
        float toCurrencyValue,
        String userIPAddress,
        String currencyExchangeURL,
        String currencyConversionURL,
        int currencyExchangePort,
        int currencyConversionPort
) { }