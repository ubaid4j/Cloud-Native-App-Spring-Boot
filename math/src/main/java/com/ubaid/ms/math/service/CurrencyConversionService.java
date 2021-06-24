package com.ubaid.ms.math.service;


import com.ubaid.ms.common.dto.ConvertedCurrency;

public interface CurrencyConversionService {
    ConvertedCurrency convert(Double currency, Double conversionRate);
}
