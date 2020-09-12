package com.ubaid.ms.service;

import com.ubaid.ms.dto.ConvertedCurrency;

public interface CurrencyConversionService {
    ConvertedCurrency convert(Integer currency, Integer conversionRate);
}
