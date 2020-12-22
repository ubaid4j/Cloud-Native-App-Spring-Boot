package com.ubaid.ms.restapi.service;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.restapi.feignProxy.CurrencyConversionServiceProxy;
import com.ubaid.ms.restapi.feignProxy.CurrencyExchangeServiceProxy;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CurrencyConversionServiceImp implements CurrencyConversionService {

    private final CurrencyExchangeServiceProxy exchangeServiceProxy;
    private final CurrencyConversionServiceProxy conversionServiceProxy;
    private final TokenService tokenService;

    @Override
    public ExchangeValueDTO convertCurrency(String fromCurrency, String toCurrency, Double quantity) {
        ExchangeValueDTO exchangeValueDTO = getExchangeRate(fromCurrency, toCurrency);
        ConvertedCurrency convertedCurrency = getConvertedCurrency(quantity, exchangeValueDTO);
        exchangeValueDTO.setExchangedCurrencyQuantity(convertedCurrency.getConvertedCurrency());
        exchangeValueDTO.setQuantity(quantity);
        return exchangeValueDTO;
    }

    ConvertedCurrency getConvertedCurrency(Double quantity, ExchangeValueDTO exchangeValueDTO) {
        return conversionServiceProxy.convert(tokenService.getBearerToken(), quantity, exchangeValueDTO.getExchangeRate());
    }

    ExchangeValueDTO getExchangeRate(String fromCurrency, String toCurrency) {
        return exchangeServiceProxy.getCurrencyExchangeRate(tokenService.getBearerToken(), fromCurrency, toCurrency);
    }
}
