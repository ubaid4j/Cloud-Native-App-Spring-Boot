package com.ubaid.ms.restapi.service;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.restapi.feignProxy.CurrencyConversionServiceProxy;
import com.ubaid.ms.restapi.feignProxy.CurrencyExchangeServiceProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CurrencyConversionServiceImp implements CurrencyConversionService {

    private final CurrencyExchangeServiceProxy exchangeServiceProxy;
    private final CurrencyConversionServiceProxy conversionServiceProxy;

    @Autowired
    public CurrencyConversionServiceImp(CurrencyExchangeServiceProxy exchangeServiceProxy, CurrencyConversionServiceProxy conversionServiceProxy) {
        this.exchangeServiceProxy = exchangeServiceProxy;
        this.conversionServiceProxy = conversionServiceProxy;
    }

    @Override
    public ExchangeValueDTO convertCurrency(String fromCurrency, String toCurrency, Integer quantity) {
        ExchangeValueDTO exchangeValueDTO = getExchangeRate(fromCurrency, toCurrency);
        ConvertedCurrency convertedCurrency = getConvertedCurrency(quantity, exchangeValueDTO);
        exchangeValueDTO.setExchangedCurrencyQuantity(convertedCurrency.getConvertedCurrency());
        exchangeValueDTO.setQuantity(quantity);
        return exchangeValueDTO;
    }

    ConvertedCurrency getConvertedCurrency(Integer quantity, ExchangeValueDTO exchangeValueDTO) {
        return conversionServiceProxy.convert(quantity, exchangeValueDTO.getExchangeRate());
    }

    ExchangeValueDTO getExchangeRate(String fromCurrency, String toCurrency) {
        return exchangeServiceProxy.getCurrencyExchangeRate(fromCurrency, toCurrency);
    }
}
