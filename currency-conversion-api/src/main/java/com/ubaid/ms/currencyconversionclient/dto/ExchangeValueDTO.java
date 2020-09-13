package com.ubaid.ms.currencyconversionclient.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
public class ExchangeValueDTO {
    private Long id;
    private String from;
    private Integer quantity;
    private String to;
    private Integer exchangeRate;
    private Integer exchangedCurrencyQuantity;
    private Integer port;
}
