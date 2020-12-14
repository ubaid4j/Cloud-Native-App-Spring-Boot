package com.ubaid.ms.restapi.service;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.ccdto.ExchangeValueDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @author ubaid
 * @implNote Note that, these integration tests will pass,
 * when all the services are up,
 * I have not implemented the graceful tests fail (when services are down_
 */
@SpringBootTest
class CurrencyConversionServiceImpTest {

    private final CurrencyConversionServiceImp currencyConversionService;
    private ExchangeValueDTO exchangeValueDTO;

    private final double PKR_CURRENCY_VALUE = 20;
    private final double PKR_USD_EXCHANGE_RATE = 160.03;
    private final double USD_CURRENCY_VALUE = PKR_CURRENCY_VALUE * PKR_USD_EXCHANGE_RATE;
    private final String PKR_CODE = "PKR";
    private final String USD_CODE = "USD";


    String token = null;

    @Autowired
    private LoginService loginService;

    @MockBean
    private TokenService tokenService;


    @Autowired
    public CurrencyConversionServiceImpTest(CurrencyConversionServiceImp currencyConversionService) {
        this.currencyConversionService = currencyConversionService;
    }

    @BeforeEach
    public void init() {
        Map<String, ?> response = loginService.login("ubaid", "changeme");
        token = (String) response.get("access_token");
        Mockito.when(tokenService.getBearerToken()).thenReturn("Bearer " + token);

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