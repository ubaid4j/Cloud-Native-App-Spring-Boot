package com.ubaid.ms.currencyconversion.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.currencyconversion.service.CurrencyConversionService.convertCurrency(com.ubaid.ms.common.dto.CurrencyInfoDTO))")
    public void convertCurrency() {}
}