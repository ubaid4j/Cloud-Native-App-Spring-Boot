package com.ubaid.ms.currencyexchangeservice.service;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.currencyexchangeservice.dao.ExchangeRateDAO;
import com.ubaid.ms.currencyexchangeservice.entity.ExchangeRate;
import com.ubaid.ms.module.ccexception.ExchangeValueNotFound;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ExchangeRateServiceImp implements ExchangeRateService {

    private final ExchangeRateDAO dao;

    @Override
    public ExchangeValueDTO getExchangeValue(String from, String to) {
        return calculateExchangeRate(from, to);
    }

    ExchangeValueDTO calculateExchangeRate(String from, String to) {
        Double fromCountryExchangeRate = exchangeRateFromEUR(from);
        Double toCountryExchangeRate = exchangeRateFromEUR(to);
        Double targetExchangeRate = calculateTargetExchangeRate(new BigDecimal(fromCountryExchangeRate), new BigDecimal(toCountryExchangeRate));
        ExchangeValueDTO exchangeValueDTO = new ExchangeValueDTO();
        exchangeValueDTO.setFrom(from);
        exchangeValueDTO.setTo(to);
        exchangeValueDTO.setExchangeRate(targetExchangeRate);
        return exchangeValueDTO;
    }

    Double calculateTargetExchangeRate(BigDecimal fromCountryExchangeRateWrtEUR,
                                       BigDecimal toCountryExchangeRateWrtEUR) {
        return toCountryExchangeRateWrtEUR.divide(fromCountryExchangeRateWrtEUR, 5, RoundingMode.HALF_EVEN).setScale(2, RoundingMode.HALF_EVEN).doubleValue();
    }

    Double exchangeRateFromEUR(String to) {
        if (to.equalsIgnoreCase("EUR")) return 1d;
        ExchangeRate exchangeRate = dao.findByFromCurrencyAndToCurrency("EUR", to).orElseThrow(() -> {
            throw new ExchangeValueNotFound("The exchange rate of {" + to + "} is not present in database");
        });
        return exchangeRate.getExchangeRate();
    }

    @Override
    public void saveAll(List<ExchangeRate> exchangeRates) {
        dao.saveAll(exchangeRates);
    }
}
