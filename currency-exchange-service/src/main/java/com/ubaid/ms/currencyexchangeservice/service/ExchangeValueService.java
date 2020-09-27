package com.ubaid.ms.currencyexchangeservice.service;

import com.ubaid.ms.currencyexchangeservice.dto.ExchangeValueDTO;

public interface ExchangeValueService {
    ExchangeValueDTO getExchangeValue(String from, String to);
}
