package com.ubaid.ms.currencyexchangeservice.task;

import com.ubaid.ms.currencyexchangeservice.config.Config;
import com.ubaid.ms.module.ccexception.CCException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

@Component
@EnableAsync
@Slf4j
public class FetchExchangeRates {

    private final RestTemplate restTemplate;
    private final Config config;


    @Autowired
    @Lazy
    public FetchExchangeRates(RestTemplate restTemplate,
                              Config config) {
        this.restTemplate = restTemplate;
        this.config = config;
    }


    @Async
    @Scheduled(initialDelay = 10000, fixedDelay = 43200000)
    public void fetchExchangeRatesFromFixerDotIO() throws CCException {
        try {
            final File responseFile = getResponseDataFile();
            log.debug("Saving Response into {}", responseFile.getAbsolutePath());
            String response = getResponseFromFoxitAPI();
            FileUtils.write(responseFile, response, StandardCharsets.UTF_8);
            log.info("Response has been written at {}", responseFile.getAbsolutePath());
        } catch (Exception exp) {
            throw new CCException(exp.getMessage());
        }
    }

    File getResponseDataFile() {
        final String responseFilePath = System.getProperty("user.home") + config.getLocalStoragePath();
        return new File(responseFilePath);
    }

    String getResponseFromFoxitAPI() {
        try {
            final String baseUrl = config.getBaseURL() + config.getApiKey();
            URI uri = new URI(baseUrl);
            return restTemplate.getForObject(uri, String.class);
        } catch(Exception exception) {
            log.error("Error in foxit api response");
            throw new RuntimeException(exception.getMessage());
        }
    }
}
