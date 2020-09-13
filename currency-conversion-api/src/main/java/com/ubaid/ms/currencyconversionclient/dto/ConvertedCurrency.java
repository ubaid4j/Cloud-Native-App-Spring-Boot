package com.ubaid.ms.currencyconversionclient.dto;

import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class ConvertedCurrency {
    private Integer port;
    private Integer convertedCurrency;
}
