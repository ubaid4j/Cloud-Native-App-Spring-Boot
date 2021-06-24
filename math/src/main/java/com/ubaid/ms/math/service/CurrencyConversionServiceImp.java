package com.ubaid.ms.math.service;

import com.ubaid.ms.common.dto.ConvertedCurrency;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CurrencyConversionServiceImp implements CurrencyConversionService {

    private final ServerInfoService serverInfo;

    @Override
    public ConvertedCurrency convert(Double currency, Double conversionRate) {
        Double convertedCurrency = currency * conversionRate;

        ConvertedCurrency cc = new ConvertedCurrency();
        cc.setConvertedCurrency(convertedCurrency);
        cc.setPort(serverInfo.getPort());
        cc.setIpAddress(serverInfo.getIPAddress());
        return cc;
    }
}
