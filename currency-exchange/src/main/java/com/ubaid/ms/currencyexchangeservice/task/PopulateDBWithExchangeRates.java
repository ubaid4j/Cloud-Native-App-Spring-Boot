package com.ubaid.ms.currencyexchangeservice.task;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ubaid.ms.common.dto.ExchangeRateDTO;
import com.ubaid.ms.common.util.exception.CCException;
import com.ubaid.ms.currencyexchangeservice.config.Config;
import com.ubaid.ms.currencyexchangeservice.entity.ExchangeRate;
import com.ubaid.ms.currencyexchangeservice.service.ExchangeRateService;
import com.ubaid.ms.currencyexchangeservice.utility.ExchangeRateDTOConverter;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
@EnableAsync
@Slf4j
public class PopulateDBWithExchangeRates {

    private final RestTemplate restTemplate;
    private final Config config;
    private final ExchangeRateService exchangeRateService;

    @Autowired
    @Lazy
    public PopulateDBWithExchangeRates(RestTemplate restTemplate,
                                       Config config,
                                       ExchangeRateService exchangeRateService) {
        this.restTemplate = restTemplate;
        this.config = config;
        this.exchangeRateService = exchangeRateService;
    }

    @Async
    @Scheduled(initialDelay = 10000, fixedDelay = 43200000)
    public void populateDbWithExchangeRates() throws CCException {
        writeResponseFromFixerDotIOAPI();
        saveResponseIntoDatabase();
    }

    void writeResponseFromFixerDotIOAPI() {
        try {
            String response = getResponseFromFixerDotIOAPI();
            writeResponse(response);
        } catch (RuntimeException exp) {
            log.error("Error {}. Could Not Write Response", exp.getMessage());
        }
    }

    String getResponseFromFixerDotIOAPI() {
        try {
            final String baseUrl = config.getBaseURL() + config.getApiKey();
            URI uri = new URI(baseUrl);
            return restTemplate.getForObject(uri, String.class);
        } catch (Exception exception) {
            log.error("Error in FixerDotIO api response");
            throw new RuntimeException(exception.getMessage());
        }
    }

    void writeResponse(String response) {
        final File responseFile = getResponseDataFile();
        try {
            Files.writeString(responseFile.toPath(), response, StandardCharsets.UTF_8);
        } catch (IOException e) {
            throw new RuntimeException("Error in writing response in " + responseFile.getAbsolutePath());
        }
    }

    void saveResponseIntoDatabase() {
        try {
            ExchangeRateDTO exchangeRateDTO = getResponseData();
            List<ExchangeRate> exchangeRates = convert(exchangeRateDTO);
            saveAll(exchangeRates);
        } catch(Exception exp) {
            log.error("Error: {}", exp.getMessage());
        }
    }

    public ExchangeRateDTO getResponseData() {
        File responseFile = getResponseDataFile();
        if (responseFile.exists()) {
            try {
                return readResponseFile(responseFile);
            } catch (RuntimeException exp) {
                log.error("Error: {}", exp.getMessage());
                return getResponseDataFromResources();
            }
        } else {
            return getResponseDataFromResources();
        }
    }

    File getResponseDataFile() {
        final String responseFilePath = System.getProperty("user.home") + config.getLocalStoragePath();
        return new File(responseFilePath);
    }

    ExchangeRateDTO readResponseFile(File responseFile) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.readValue(responseFile, ExchangeRateDTO.class);
        } catch (IOException e) {
            throw new RuntimeException("File is not valid");
        }
    }

    ExchangeRateDTO getResponseDataFromResources() {
        File responseFileInResource = getResponseFileFromResource();
        if (responseFileInResource.exists()) {
            return readResponseFile(responseFileInResource);
        } else {
            throw new RuntimeException("Severe Error Cannot Get Exchange Rate from the Resources");
        }
    }

    File getResponseFileFromResource() {
        try {
            InputStream inputStream = new ClassPathResource("exchangeRates.json").getInputStream();
            File tempFile = File.createTempFile("exchangeRates", ".json");
            Files.copy(inputStream, tempFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
            return tempFile;
        } catch(IOException exp) {
            throw new RuntimeException("Severe Error. Cannot get exchangeRates.json file from resources");
        }
    }

    List<ExchangeRate> convert(ExchangeRateDTO exchangeRateDTO) {
        ExchangeRateDTOConverter converter = new ExchangeRateDTOConverter(exchangeRateDTO);
        return converter.getExchangeRates();
    }

    void saveAll(List<ExchangeRate> exchangeRates) {
        exchangeRateService.saveAll(exchangeRates);
    }

}