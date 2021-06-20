package com.ubaid.ms.currencyexchangeservice.utility;

import com.ubaid.ms.common.dto.ExchangeRateDTO;
import com.ubaid.ms.currencyexchangeservice.entity.ExchangeRate;
import lombok.Getter;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Getter
public class ExchangeRateDTOConverter {
    private final List<ExchangeRate> exchangeRates;
    public ExchangeRateDTOConverter(ExchangeRateDTO exchangeRateDTO) {
        exchangeRates = convert(exchangeRateDTO);
    }

    List<ExchangeRate> convert(ExchangeRateDTO exchangeRateDTO) {
        return exchangeRateDTO.getRates().entrySet().stream().map(entry -> {
           ExchangeRate exchangeRate = getExchangeRateInitializedWithValues(exchangeRateDTO.getTimestamp(), exchangeRateDTO.getBase());
           exchangeRate.setToCurrency(entry.getKey());
           exchangeRate.setExchangeRate(entry.getValue());
           exchangeRate.setId(exchangeRate.getFromCurrency() + "_" + exchangeRate.getToCurrency());
           return exchangeRate;
        }).collect(Collectors.toList());
    }

    private ExchangeRate getExchangeRateInitializedWithValues(long timestamp, String fromCurrency) {
        ExchangeRate exchangeRate = new ExchangeRate();
        exchangeRate.setFromCurrency(fromCurrency);
        exchangeRate.setTimestamp(new Date(timestamp));
        return exchangeRate;
    }

}
