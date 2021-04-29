package com.ubaid.ms.apicomposer.service;


import com.ubaid.ms.ccdto.ExchangeValueDTO;

import java.security.Principal;

public interface CurrencyConversionService {
    ExchangeValueDTO convertCurrency(Principal principal, String fromCurrency, String toCurrency, Double quantity);
}
