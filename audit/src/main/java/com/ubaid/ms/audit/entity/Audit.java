package com.ubaid.ms.audit.entity;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.Instant;

@Data
@Table
public class Audit {

    @Id
    private Long id;
    private String userUuid;
    private Instant createdAt;
    private String fromCurrency;
    private String toCurrency;
    private double exchangeRate;
    private double fromCurrencyValue;
    private double toCurrencyValue;
    private String userIPAddress;
    private String currencyExchangeURL;
    private String currencyConversionURL;
    private int currencyExchangePort;
    private int currencyConversionPort;
    private boolean isDeleted;
    private Instant lastUpdated;
}
