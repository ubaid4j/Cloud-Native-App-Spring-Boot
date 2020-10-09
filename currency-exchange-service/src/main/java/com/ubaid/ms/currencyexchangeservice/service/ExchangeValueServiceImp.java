package com.ubaid.ms.currencyexchangeservice.service;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.currencyexchangeservice.dao.ExchangeValueRepo;
import com.ubaid.ms.currencyexchangeservice.entity.ExchangeRate;
import com.ubaid.ms.module.ccexception.ExchangeValueNotFound;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class ExchangeValueServiceImp implements ExchangeValueService {

    private final static String EXCHANGE_VALUE_NOT_FOUNT = "Exchange value not found for given currencies";

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



        return null;
    }
}
