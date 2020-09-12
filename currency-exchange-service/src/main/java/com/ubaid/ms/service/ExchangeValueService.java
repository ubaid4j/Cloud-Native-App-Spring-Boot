package com.ubaid.ms.service;

import com.ubaid.ms.dto.ExchangeValueDTO;

public interface ExchangeValueService {
    ExchangeValueDTO getExchangeValue(String from, String to);
}
