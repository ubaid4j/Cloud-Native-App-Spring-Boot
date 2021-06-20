package com.ubaid.ms.currencyexchangeservice.service;

import com.ubaid.ms.common.dto.ExchangeValueDTO;
import com.ubaid.ms.currencyexchangeservice.entity.ExchangeRate;

import java.util.List;

public interface ExchangeRateService {
    ExchangeValueDTO getExchangeValue(String from, String to);
    void saveAll(List<ExchangeRate> exchangeRates);
}
