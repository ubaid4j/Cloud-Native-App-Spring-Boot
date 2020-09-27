package com.ubaid.ms.currencyconversionservice.service;

import com.ubaid.ms.currencyconversionservice.dto.ConvertedCurrency;

public interface CurrencyConversionService {
    ConvertedCurrency convert(Integer currency, Integer conversionRate);
}
