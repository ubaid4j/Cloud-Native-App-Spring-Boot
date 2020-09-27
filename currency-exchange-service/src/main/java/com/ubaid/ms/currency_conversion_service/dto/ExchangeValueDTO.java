package com.ubaid.ms.currency_conversion_service.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
public class ExchangeValueDTO {
    private Long id;
    private String from;
    private String to;
    private BigDecimal exchangeRate;
    private Integer port;
}
