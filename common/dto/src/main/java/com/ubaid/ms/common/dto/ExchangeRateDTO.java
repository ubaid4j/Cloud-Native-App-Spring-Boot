package com.ubaid.ms.common.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Map;

@Data
@NoArgsConstructor
public class ExchangeRateDTO {
    private Boolean success;
    private String date;
    private Long timestamp;
    private String base;
    private Map<String, Double> rates;
}
