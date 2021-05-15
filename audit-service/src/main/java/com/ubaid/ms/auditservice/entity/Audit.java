package com.ubaid.ms.auditservice.entity;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.util.Date;
import java.util.UUID;

@Data
@Table
public class Audit {

    @Id
    private Long id;
    private String userUuid;
    private Date createdAt;
    private String fromCurrency;
    private String toCurrency;
    private float exchangeRate;
    private float fromCurrencyValue;
    private float toCurrencyValue;
    private String userIPAddress;
    private String currencyExchangeURL;
    private String currencyConversionURL;
    private int currencyExchangePort;
    private int currencyConversionPort;
    private boolean isDeleted;
    private Date lastUpdated;
}
