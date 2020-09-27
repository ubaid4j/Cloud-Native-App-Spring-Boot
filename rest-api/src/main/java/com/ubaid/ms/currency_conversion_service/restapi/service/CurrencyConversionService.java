package com.ubaid.ms.currency_conversion_service.restapi.service;

import com.ubaid.ms.currency_conversion_service.restapi.dto.ExchangeValueDTO;

public interface CurrencyConversionService {
    ExchangeValueDTO convertCurrency(String fromCurrency, String toCurrency, Integer quantity);
}
