package com.ubaid.ms.currencyexchangeservice.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

@Entity
@Table
@Data
@NoArgsConstructor
public class ExchangeRate {
    @Id
    private String id;
    private Date timestamp;
    private String fromCurrency;
    private String toCurrency;
    private Double exchangeRate;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ExchangeRate that = (ExchangeRate) o;
        return fromCurrency.equals(that.fromCurrency) &&
                toCurrency.equals(that.toCurrency);
    }

    @Override
    public int hashCode() {
        return Objects.hash(fromCurrency, toCurrency);
    }
}
