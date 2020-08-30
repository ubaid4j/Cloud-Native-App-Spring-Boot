package com.ubaid.ms.config;

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

@ConfigurationProperties(prefix = "limits-service")
@Component
@Data
@NoArgsConstructor
public class Config {
    private int min;
    private int max;
}
