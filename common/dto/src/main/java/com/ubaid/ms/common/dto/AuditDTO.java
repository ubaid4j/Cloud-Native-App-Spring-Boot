package com.ubaid.ms.common.dto;

import io.soabase.recordbuilder.core.RecordBuilder;

import java.io.Serializable;
import java.time.Instant;

@RecordBuilder
public record AuditDTO(
        Long id,
        String userUUID,
        Instant timestamp,
        String fromCurrency,
        String toCurrency,
        double exchangeRate,
        double fromCurrencyValue,
        double toCurrencyValue,
        String userIPAddress,
        String currencyExchangeIP,
        String currencyConversionIP,
        int currencyExchangePort,
        int currencyConversionPort
) implements Serializable { }
