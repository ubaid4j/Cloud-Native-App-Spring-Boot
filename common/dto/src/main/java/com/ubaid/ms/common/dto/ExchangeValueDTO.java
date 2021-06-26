package com.ubaid.ms.common.dto;

import lombok.Data;
import lombok.NoArgsConstructor;


import java.util.Objects;

@Data
@NoArgsConstructor
public class ExchangeValueDTO {
    private Long id;
    private String from;
    private Double quantity;
    private String to;
    private Double exchangeRate;
    private Double exchangedCurrencyQuantity;
    private Integer port;
    private String ipAddress;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ExchangeValueDTO that = (ExchangeValueDTO) o;
        return from.equals(that.from) &&
                to.equals(that.to) &&
                exchangeRate.equals(that.exchangeRate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(from, to, exchangeRate);
    }
}
