package com.ubaid.ms.currencyconversionclient.service;

import com.ubaid.ms.currencyconversionclient.dto.ExchangeValueDTO;

public interface CurrencyConversionService {
    ExchangeValueDTO convertCurrency(String fromCurrency, String toCurrency, Integer quantity);
}
