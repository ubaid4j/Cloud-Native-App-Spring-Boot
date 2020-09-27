package com.ubaid.ms.currency_conversion_service.service;

import com.ubaid.ms.currency_conversion_service.dto.ExchangeValueDTO;

public interface ExchangeValueService {
    ExchangeValueDTO getExchangeValue(String from, String to);
}
