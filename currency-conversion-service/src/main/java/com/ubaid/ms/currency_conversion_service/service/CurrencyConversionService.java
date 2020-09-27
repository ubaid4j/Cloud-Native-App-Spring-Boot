package com.ubaid.ms.currency_conversion_service.service;

import com.ubaid.ms.currency_conversion_service.dto.ConvertedCurrency;

public interface CurrencyConversionService {
    ConvertedCurrency convert(Integer currency, Integer conversionRate);
}
