package com.ubaid.ms.currencyexchangeservice.task;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.ubaid.ms.common.dto.ExchangeRateDTO;
import com.ubaid.ms.currencyexchangeservice.config.Config;
import com.ubaid.ms.currencyexchangeservice.dao.ExchangeRateDAO;
import com.ubaid.ms.currencyexchangeservice.entity.ExchangeRate;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Lazy;

@SpringBootTest
class PopulateDBWithExchangeRatesTest {


    @Autowired
    @Lazy
    private PopulateDBWithExchangeRates populateDBWithExchangeRates;

    @Autowired
    @Lazy
    Config config;

    @Autowired
    @Lazy
    ExchangeRateDAO dao;

    @Test
    @Order(1)
    @DisplayName("Checking If Response is saved into the file:")
    void writeResponseFromFixerDotIOAPI() throws IOException {
        getResponseFromFixerDotIOAPI();
        writeResponse();
        File file = populateDBWithExchangeRates.getResponseDataFile();
        assertTrue(Files.size(file.toPath()) > 0, file.getAbsolutePath() + " has some content");
    }

    @Test
    @Order(2)
    @DisplayName("Checking Response From FixerDotIOAPI")
    void getResponseFromFixerDotIOAPI() {
        String response = populateDBWithExchangeRates.getResponseFromFixerDotIOAPI();
        assertTrue(response.length() > 0, "Body of Response Should be greater than 0");
    }

    @Test
    @Order(3)
    @DisplayName("Checking writing the response")
    void writeResponse() throws IOException {
        String response = populateDBWithExchangeRates.getResponseFromFixerDotIOAPI();
        assertTrue(response.length() > 0);
        populateDBWithExchangeRates.writeResponse(response);
        File file = populateDBWithExchangeRates.getResponseDataFile();
        assertTrue(Files.size(file.toPath()) > 0, file.getAbsolutePath() + " has some content");
    }

    @Test
    @Order(4)
    @DisplayName("Checking DataResponse File Validity")
    void getResponseDataFile() {
        File file = populateDBWithExchangeRates.getResponseDataFile();
        File expectedFile = new File(System.getProperty("user.home") + config.getLocalStoragePath());
        assertEquals(file, expectedFile, "DataResponse File Should be Equal");
    }

    @Test
    @Order(5)
    @DisplayName("Checking if Response is able to convert into ExchangeRateDTO")
    void readResponseFile() {
        File responseFile = populateDBWithExchangeRates.getResponseDataFile();
        ExchangeRateDTO exchangeRateDTO = populateDBWithExchangeRates.readResponseFile(responseFile);
        testExchangeRateValidity(exchangeRateDTO);
    }

    @Test
    @Order(6)
    @DisplayName("Checking if we get data form the resource")
    void getResponseDataFromResources() {
        ExchangeRateDTO exchangeRateDTO = populateDBWithExchangeRates.getResponseDataFromResources();
        testExchangeRateValidity(exchangeRateDTO);
    }

    @Test
    @Order(7)
    @DisplayName("Checking if file is present in resource module")
    void getResponseFileFromResource() {
        File file = populateDBWithExchangeRates.getResponseFileFromResource();
        assertTrue(file.exists(), file.getAbsolutePath() + " should be present");
    }

    @Test
    @Order(8)
    @DisplayName("Checking if DTO can convert into list of entities")
    void convert() {
        ExchangeRateDTO dto = populateDBWithExchangeRates.getResponseData();
        List<ExchangeRate> exchangeRates = populateDBWithExchangeRates.convert(dto);
        assertNotNull(exchangeRates, "After converting dto to entity, entity should not be null");
        assertEquals(dto.getRates().size(), exchangeRates.size(), "Converted entities size should be equal to size of map (of rates)");
    }

    @Test
    @Order(9)
    @DisplayName("Checking if exchange rates are saved in db")
    void saveAll() {
        ExchangeRateDTO dto = populateDBWithExchangeRates.getResponseData();
        List<ExchangeRate> exchangeRates = populateDBWithExchangeRates.convert(dto);
        populateDBWithExchangeRates.saveAll(exchangeRates);
        assertEquals(exchangeRates.size(), dao.findAll().size(), "Saved exchanges rates should be equal to retrieved exchange rates from response");
    }


    private void testExchangeRateValidity(ExchangeRateDTO responseDTO) {
        ExchangeRateDTO expectedExchangeRateDTO = getDummyExchangeRateDTO();
        assertNotNull(responseDTO, "Exchange Rate DTO Should Not be null");
        assertEquals(expectedExchangeRateDTO.getBase(), responseDTO.getBase(), "Base should be EUR in Response");
        assertEquals(expectedExchangeRateDTO.getSuccess(), responseDTO.getSuccess(), "Success should be true in Response");
        assertTrue(responseDTO.getRates().size() > 0, "There should some rates present in Response");
    }

    private ExchangeRateDTO getDummyExchangeRateDTO() {
        ExchangeRateDTO expectedExchangeRateDTO = new ExchangeRateDTO();
        expectedExchangeRateDTO.setBase("EUR");
        expectedExchangeRateDTO.setSuccess(true);
        return expectedExchangeRateDTO;
    }

}