package com.ubaid.ms.currencyconversionservice.service;


import com.ubaid.ms.ccdto.ConvertedCurrency;

public interface CurrencyConversionService {
    ConvertedCurrency convert(Integer currency, Integer conversionRate);
}
