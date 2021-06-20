package com.ubaid.ms.currencyexchangeservice.service;

import com.ubaid.ms.common.dto.ExchangeRateDTO;
import com.ubaid.ms.common.dto.ExchangeValueDTO;
import com.ubaid.ms.currencyexchangeservice.dao.ExchangeRateDAO;
import com.ubaid.ms.currencyexchangeservice.entity.ExchangeRate;
import com.ubaid.ms.currencyexchangeservice.task.PopulateDBWithExchangeRates;
import com.ubaid.ms.currencyexchangeservice.utility.ExchangeRateDTOConverter;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Lazy;

import java.math.BigDecimal;
import java.util.List;

@SpringBootTest
class ExchangeRateServiceImpTest {

    @Autowired
    @Lazy
    ExchangeRateServiceImp exchangeRateService;

    @Autowired
    @Lazy
    PopulateDBWithExchangeRates populateDBWithExchangeRates;

    @Autowired
    @Lazy
    ExchangeRateDAO dao;

    @Test
    @Order(1)
    @DisplayName("Saving All Results into Database")
    void saveAll() {
        dao.deleteAll();
        List<ExchangeRate> exchangeRates = getExchangeRates();
        exchangeRateService.saveAll(exchangeRates);
        List<ExchangeRate> exchangeRatesFromDB = dao.findAll();
        assertEquals(exchangeRates.size(), exchangeRatesFromDB.size(), "Should Saved all Rates in DB");

    }

    private List<ExchangeRate> getExchangeRates() {
        ExchangeRateDTO exchangeRateDTO = populateDBWithExchangeRates.getResponseData();
        ExchangeRateDTOConverter converter = new ExchangeRateDTOConverter(exchangeRateDTO);
        return converter.getExchangeRates();
    }


    @Test
    @Order(2)
    @DisplayName("Checking if we can get Exchange Rate from given values")
    void getExchangeValue() {
        dao.deleteAll();
        List<ExchangeRate> exchangeRates = getExchangeRates();
        exchangeRateService.saveAll(exchangeRates);
        ExchangeValueDTO exchangeRate = exchangeRateService.getExchangeValue("INR", "PKR");
        assertNotNull(exchangeRate);
        assertTrue(exchangeRate.getExchangeRate() > 1 && exchangeRate.getExchangeRate() < 3, "INR to PKR exchange rate is greater than 1 and smaller than 3");
    }

    @Test
    @Order(3)
    @DisplayName("Checking if we can get exchange rate from exchangeRateFromEUR method")
    void exchangeRateFromEUR() {
        dao.deleteAll();
        List<ExchangeRate> exchangeRates = getExchangeRates();
        exchangeRateService.saveAll(exchangeRates);
        Double exchangeRate = exchangeRateService.exchangeRateFromEUR("PKR");
        assertNotNull(exchangeRate);
        assertTrue(exchangeRate > 150, "EUR to PKR exchange rate is greater than 150");
    }

    @Test
    @Order(4)
    @DisplayName("Test Calculate Target Exchange Rate Method")
    void calculateTargetExchangeRate() {
        Double calculatedER = exchangeRateService.calculateTargetExchangeRate(new BigDecimal("193.73"), new BigDecimal("86.32"));
        assertEquals(0.45, calculatedER);
    }

    @Test
    @Order(5)
    @DisplayName("Test Calculate Exchange Rate Method")
    void calculateExchangeRate() {
        dao.deleteAll();
        List<ExchangeRate> exchangeRates = getExchangeRates();
        exchangeRateService.saveAll(exchangeRates);

        ExchangeValueDTO exchangeRate = exchangeRateService.calculateExchangeRate("PKR", "INR");

        ExchangeValueDTO expectedExchangeValueDTO = new ExchangeValueDTO();
        expectedExchangeValueDTO.setExchangeRate(0.46);
        expectedExchangeValueDTO.setFrom("PKR");
        expectedExchangeValueDTO.setTo("INR");

        assertNotNull(exchangeRate);
        assertEquals(expectedExchangeValueDTO, exchangeRate);
    }
}