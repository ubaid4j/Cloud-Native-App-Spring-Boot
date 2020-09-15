package com.ubaid.ms.currencyconversionapi.service;

import com.ubaid.ms.currencyconversionapi.dto.ExchangeValueDTO;

public interface CurrencyConversionService {
    ExchangeValueDTO convertCurrency(String fromCurrency, String toCurrency, Integer quantity);
}
