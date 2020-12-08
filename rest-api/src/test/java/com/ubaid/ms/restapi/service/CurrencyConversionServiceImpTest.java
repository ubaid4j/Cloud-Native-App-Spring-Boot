package com.ubaid.ms.restapi.service;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.ccdto.ExchangeValueDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class CurrencyConversionServiceImpTest {

    private final CurrencyConversionServiceImp currencyConversionService;
    private ExchangeValueDTO exchangeValueDTO;

    private final double PKR_CURRENCY_VALUE = 20;
    private final double PKR_USD_EXCHANGE_RATE=160.26;
    private final double USD_CURRENCY_VALUE = PKR_CURRENCY_VALUE * PKR_USD_EXCHANGE_RATE;
    private final String PKR_CODE = "PKR";
    private final String USD_CODE = "USD";

    @Autowired
    public CurrencyConversionServiceImpTest(CurrencyConversionServiceImp currencyConversionService) {
        this.currencyConversionService = currencyConversionService;
    }

    @BeforeEach
    void setUp() {
        exchangeValueDTO = new ExchangeValueDTO();
        exchangeValueDTO.setQuantity(PKR_CURRENCY_VALUE);
        exchangeValueDTO.setExchangeRate(PKR_USD_EXCHANGE_RATE);
    }

    @DisplayName("Test Converted Currency Method")
    @Test
    void getConvertedCurrency() {
        ConvertedCurrency convertedCurrency = currencyConversionService.getConvertedCurrency(PKR_CURRENCY_VALUE, exchangeValueDTO);
        assertEquals(USD_CURRENCY_VALUE, convertedCurrency.getConvertedCurrency());
    }

    @DisplayName("Test Exchange Rate Method")
    @Test
    void getExchangeRate() {
        ExchangeValueDTO exchangeValueDTO = currencyConversionService.getExchangeRate(USD_CODE, PKR_CODE);
        assertEquals(PKR_USD_EXCHANGE_RATE, exchangeValueDTO.getExchangeRate());
    }

    @DisplayName("Test Convert Currency Method")
    @Test
    void convertCurrency() {
        ExchangeValueDTO exchangeValueDTO = currencyConversionService.convertCurrency(USD_CODE, PKR_CODE, PKR_CURRENCY_VALUE);
        assertEquals(USD_CURRENCY_VALUE, exchangeValueDTO.getExchangedCurrencyQuantity());
    }
}