package com.ubaid.ms.currencyexchangeservice.utility;

import com.ubaid.ms.common.dto.ExchangeRateDTO;
import com.ubaid.ms.currencyexchangeservice.entity.ExchangeRate;
import com.ubaid.ms.currencyexchangeservice.task.PopulateDBWithExchangeRates;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Lazy;

import java.util.List;

@SpringBootTest
class ExchangeRateDTOConverterTest {

    @Autowired
    @Lazy
    PopulateDBWithExchangeRates populateDBWithExchangeRates;

    @Test
    @DisplayName("Exchange Rate DTO Should convert to list of ExchangeRate")
    void convert() {
        ExchangeRateDTO exchangeRateDTO = populateDBWithExchangeRates.getResponseData();
        ExchangeRateDTOConverter converter = new ExchangeRateDTOConverter(exchangeRateDTO);
        List<ExchangeRate> exchangeRates = converter.convert(exchangeRateDTO);
        assertNotNull(exchangeRates, "Exchange rates should not be null");
        assertTrue(exchangeRates.size() > 150, "There are 168 actual rates. The minimum threshold should be 150");
    }
}