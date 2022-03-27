package com.ubaid.ms.math.service;


import com.ubaid.ms.common.dto.ValueDTO;

public interface MathService {
    ValueDTO multiply(Double currency, Double conversionRate);
}
