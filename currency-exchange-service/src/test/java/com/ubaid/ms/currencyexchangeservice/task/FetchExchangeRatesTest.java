package com.ubaid.ms.currencyexchangeservice.task;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ubaid.ms.ccdto.ExchangeRateDTO;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Lazy;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class FetchExchangeRatesTest {


    @Autowired
    @Lazy
    private FetchExchangeRates fetchExchangeRates;

    @Test
    @Order(1)
    void checkResponseSavedInFile() throws InterruptedException {
        fetchExchangeRates.fetchExchangeRatesFromFixerDotIO();
        File file = fetchExchangeRates.getResponseDataFile();
        int tries = 5;
        while (--tries > 0) {
            if (!file.exists()) {
                TimeUnit.SECONDS.sleep(1);
            } else {
                break;
            }
        }
        assertTrue(FileUtils.sizeOf(file) > 0);
    }

    @Test
    @Order(2)
    void checkResponseType() {
        ObjectMapper mapper = new ObjectMapper();
        try {
            File file = fetchExchangeRates.getResponseDataFile();
            ExchangeRateDTO exchangeRateDTO = mapper.readValue(file, ExchangeRateDTO.class);
            System.out.println(exchangeRateDTO);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}