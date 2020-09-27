package com.ubaid.ms.currencyexchangeservice.service;

import com.ubaid.ms.currencyexchangeservice.dao.ExchangeValueRepo;
import com.ubaid.ms.currencyexchangeservice.dto.ExchangeValueDTO;
import com.ubaid.ms.currencyexchangeservice.entity.ExchangeValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class ExchangeValueServiceImp implements ExchangeValueService {

    private final Environment env;
    private final ExchangeValueRepo dao;

    @Autowired
    public ExchangeValueServiceImp(Environment env, ExchangeValueRepo exchangeValueRepo) {
        this.env = env;
        this.dao = exchangeValueRepo;
    }

    @Override
    public ExchangeValueDTO getExchangeValue(String from, String to) {
        int port = Integer.parseInt(Objects.requireNonNull(env.getProperty("local.server.port")));
        ExchangeValue exchangeValue = dao.findByFromCurrencyAndToCurrency(from, to).orElseThrow(RuntimeException::new);
        ExchangeValueDTO exchangeValueDTO = exchangeValue.createDTO();
        exchangeValueDTO.setPort(port);
        return exchangeValueDTO;
    }
}
