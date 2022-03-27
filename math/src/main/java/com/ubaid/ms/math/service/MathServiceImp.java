package com.ubaid.ms.math.service;

import com.ubaid.ms.common.dto.ValueDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MathServiceImp implements MathService {

    private final ServerInfoService serverInfo;

    @Override
    public ValueDTO multiply(Double currency, Double conversionRate) {
        Double resultantValue = currency * conversionRate;

        ValueDTO value = new ValueDTO();
        value.setValue(resultantValue);
        value.setPort(serverInfo.getPort());
        value.setIpAddress(serverInfo.getIPAddress());
        return value;
    }
}
