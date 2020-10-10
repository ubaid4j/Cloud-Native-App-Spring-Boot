package com.ubaid.ms.currencyconversionservice.service;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class CurrencyConversionServiceImp implements CurrencyConversionService {


    private final Environment env;

    @Autowired
    public CurrencyConversionServiceImp(Environment env) {
        this.env = env;
    }

    @Override
    public ConvertedCurrency convert(Double currency, Double conversionRate) {
        Double convertedCurrency = currency * conversionRate;
        int port = Integer.parseInt(Objects.requireNonNull(env.getProperty("local.server.port")));

        ConvertedCurrency cc = new ConvertedCurrency();
        cc.setConvertedCurrency(convertedCurrency);
        cc.setPort(port);

        return cc;
    }
}
