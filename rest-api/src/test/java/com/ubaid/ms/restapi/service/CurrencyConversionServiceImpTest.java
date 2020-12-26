package com.ubaid.ms.restapi.service;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.ccdto.CountryCodeDTO;
import com.ubaid.ms.ccdto.ExchangeValueDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import java.util.List;
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
    private final CountryService countryService;
    private final LoginService loginService;

    String token = null;

    @MockBean
    private TokenService tokenService;

    @Autowired
    public CurrencyConversionServiceImpTest(CurrencyConversionServiceImp currencyConversionService,
                                            CountryService countryService, LoginService loginService) {
        this.currencyConversionService = currencyConversionService;
        this.countryService = countryService;
        this.loginService = loginService;
    }


    @BeforeEach
    public void init() {
        Map<String, ?> response = loginService.login("ubaid", "changeme");
        token = (String) response.get("access_token");
        Mockito.when(tokenService.getBearerToken()).thenReturn("Bearer " + token);
    }

    @DisplayName("Get All Countries Code")
    @Test
    @Order(value = 1)
    void getAllCountries() {
        List<CountryCodeDTO>  countries =  countryService.getAll();
        assertNotNull(countries);
    }


    @DisplayName("Test Converted Currency Method")
    @Test
    @Order(value = 2)
    void getConvertedCurrency() {
        String GIVEN_CURRENCY_CODE = "PKR";
        String TARGETED_CURRENCY_CODE = "USD";
        ExchangeValueDTO exchangeValueDTO = currencyConversionService.getExchangeRate(TARGETED_CURRENCY_CODE, GIVEN_CURRENCY_CODE);
        assertNotNull(exchangeValueDTO);

        double GIVEN_CURRENCY_VALUE = 20;
        ConvertedCurrency actualConvertedCurrency = currencyConversionService.getConvertedCurrency(GIVEN_CURRENCY_VALUE, exchangeValueDTO);
        double expectedConvertedCurrencyValue = GIVEN_CURRENCY_VALUE * exchangeValueDTO.getExchangeRate();
        assertEquals(expectedConvertedCurrencyValue, actualConvertedCurrency.getConvertedCurrency());
    }

}