package com.ubaid.ms.entity;

import com.fasterxml.jackson.annotation.JsonAlias;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;


@Data
@NoArgsConstructor
public class CurrencyConversion {
    private Long id;
    private String from;
    private String to;

    //if conversionMultiple has other name coming from another server
    @JsonAlias(value = {"exchangeRate"})
    private BigDecimal conversionMultiple;
    private BigDecimal quantity;
    private BigDecimal calculatedAmount;
    private int port;

    public BigDecimal getCalculatedAmount() {
        if (conversionMultiple != null && quantity != null) {
            this.calculatedAmount = conversionMultiple.multiply(quantity);
            return calculatedAmount;
        }
        return calculatedAmount;
    }
}
