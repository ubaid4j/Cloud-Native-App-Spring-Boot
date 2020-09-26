package com.ubaid.ms.restapi.service;

import com.ubaid.ms.restapi.dto.ExchangeValueDTO;

public interface CurrencyConversionService {
    ExchangeValueDTO convertCurrency(String fromCurrency, String toCurrency, Integer quantity);
}
