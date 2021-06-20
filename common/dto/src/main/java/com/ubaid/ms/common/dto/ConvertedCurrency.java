package com.ubaid.ms.common.dto;

import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class ConvertedCurrency {
    private Integer port;
    private String ipAddress;
    private Double convertedCurrency;
}
