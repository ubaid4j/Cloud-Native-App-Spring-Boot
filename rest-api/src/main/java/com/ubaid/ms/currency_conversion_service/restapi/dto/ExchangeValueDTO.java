package com.ubaid.ms.currency_conversion_service.restapi.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

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
