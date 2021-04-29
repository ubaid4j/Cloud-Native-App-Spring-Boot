package com.ubaid.ms.apicomposer.service;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.ccdto.ExchangeValueDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @author ubaid
 * @implNote Note that, these integration tests will pass,
 * when all the micro-services (api-gateway-service, currency-exchange-service, currency-conversion-service, country-service)
 * are up (and these services should be up natively not in docker)
 * I have not implemented the graceful tests fail (when services are down)
 */
@SpringBootTest
class CurrencyConversionServiceImpTest {

    private final CurrencyConversionServiceImp currencyConversionService;
    private final AccessTokenService accessTokenService;

    String token = null;

    @Autowired
    public CurrencyConversionServiceImpTest(CurrencyConversionServiceImp currencyConversionService,
                                            AccessTokenService accessTokenService) {
        this.currencyConversionService = currencyConversionService;
        this.accessTokenService = accessTokenService;
    }


    @BeforeEach
    public void init() {
        Map<String, ?> response = accessTokenService.getAccessToken("ubaid", "changeme");
        token = (String) response.get("access_token");
    }


    @DisplayName("Test Converted Currency Method")
    @Test
    @Order(value = 2)
    void getConvertedCurrency() {
        String GIVEN_CURRENCY_CODE = "PKR";
        String TARGETED_CURRENCY_CODE = "USD";
        ExchangeValueDTO exchangeValueDTO = currencyConversionService.getExchangeRate(token, TARGETED_CURRENCY_CODE, GIVEN_CURRENCY_CODE);
        assertNotNull(exchangeValueDTO);
        double GIVEN_CURRENCY_VALUE = 20;
        ConvertedCurrency actualConvertedCurrency = currencyConversionService.getConvertedCurrency(token, GIVEN_CURRENCY_VALUE, exchangeValueDTO);
        double expectedConvertedCurrencyValue = GIVEN_CURRENCY_VALUE * exchangeValueDTO.getExchangeRate();
        assertEquals(expectedConvertedCurrencyValue, actualConvertedCurrency.getConvertedCurrency());
    }

}