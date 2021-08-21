package com.ubaid.ms.currencyconversion.service;


import com.ubaid.ms.common.dto.CurrencyInfoDTO;
import com.ubaid.ms.common.dto.ExchangeValueDTO;

public interface CurrencyConversionService {
    ExchangeValueDTO convertCurrency(CurrencyInfoDTO currencyInfo);
}
