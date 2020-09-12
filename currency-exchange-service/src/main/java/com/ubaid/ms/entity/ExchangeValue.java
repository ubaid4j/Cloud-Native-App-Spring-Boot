package com.ubaid.ms.entity;

import com.ubaid.ms.dto.ExchangeValueDTO;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table
@Data
@NoArgsConstructor
public class ExchangeValue {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String fromCurrency;
    private String toCurrency;
    private BigDecimal exchangeRate;

    public ExchangeValueDTO createDTO() {
        ExchangeValueDTO exchangeValueDTO = new ExchangeValueDTO();
        exchangeValueDTO.setId(id);
        exchangeValueDTO.setFrom(fromCurrency);
        exchangeValueDTO.setTo(toCurrency);
        exchangeValueDTO.setExchangeRate(exchangeRate);
        return exchangeValueDTO;
    }
}
