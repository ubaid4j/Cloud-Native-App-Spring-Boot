package com.ubaid.ms.currencyexchangeservice.entity;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table
@Data
@NoArgsConstructor
public class ExchangeRate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Date timestamp;
    private String fromCurrency;
    private String toCurrency;
    private Double exchangeRate;

    public ExchangeValueDTO createDTO() {
        ExchangeValueDTO exchangeValueDTO = new ExchangeValueDTO();
        exchangeValueDTO.setId(id);
        exchangeValueDTO.setFrom(fromCurrency);
        exchangeValueDTO.setTo(toCurrency);
        exchangeValueDTO.setExchangeRate(exchangeRate);
        return exchangeValueDTO;
    }
}
