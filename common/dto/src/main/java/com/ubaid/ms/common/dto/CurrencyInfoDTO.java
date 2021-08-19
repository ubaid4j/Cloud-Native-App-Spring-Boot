package com.ubaid.ms.common.dto;

import io.soabase.recordbuilder.core.RecordBuilder;
import java.io.Serializable;

@RecordBuilder
public record CurrencyInfoDTO(String fromCurrency, String toCurrency, Double quantity)
    implements Serializable {
}
