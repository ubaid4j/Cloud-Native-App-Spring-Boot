package com.ubaid.ms.apicomposer.service;


import com.ubaid.ms.ccdto.ExchangeValueDTO;

public interface CurrencyConversionService {
    ExchangeValueDTO convertCurrency(String fromCurrency, String toCurrency, Double quantity);
}
