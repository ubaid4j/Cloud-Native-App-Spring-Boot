package com.ubaid.ms.currencyconversion.service;


import com.ubaid.ms.common.dto.ExchangeValueDTO;

public interface CurrencyConversionService {
    ExchangeValueDTO convertCurrency(String fromCurrency, String toCurrency, Double quantity);
}
