package com.ubaid.ms.currencyconversionservice.service;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@RequiredArgsConstructor
public class CurrencyConversionServiceImp implements CurrencyConversionService {

    private final Environment env;

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
