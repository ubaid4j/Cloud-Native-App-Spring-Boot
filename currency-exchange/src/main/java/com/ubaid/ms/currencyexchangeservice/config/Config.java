package com.ubaid.ms.currencyexchangeservice.config;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@ConfigurationProperties(prefix = "fixer.io")
@Component
@Data
@NoArgsConstructor
public class Config {
    private String baseURL;
    private String apiKey;
    private String localStoragePath;
}
