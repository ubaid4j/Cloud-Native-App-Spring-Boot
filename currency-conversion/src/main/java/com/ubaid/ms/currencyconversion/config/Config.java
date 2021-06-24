package com.ubaid.ms.currencyconversion.config;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * and define the prefix
 * same as in the application.properties file
 *
 * @author UbaidurRehman
 */

@ConfigurationProperties(prefix = "ls")
@Component
@Data
@NoArgsConstructor
public class Config {
    private int min;
    private int max;
}
