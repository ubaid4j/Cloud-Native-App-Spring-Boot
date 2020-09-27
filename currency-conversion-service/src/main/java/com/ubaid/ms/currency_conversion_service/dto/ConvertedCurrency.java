package com.ubaid.ms.currency_conversion_service.dto;

import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class ConvertedCurrency {
    private Integer port;
    private Integer convertedCurrency;
}
