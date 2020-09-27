package com.ubaid.ms.currency_conversion_service.restapi.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.currency_conversion_service.restapi.service.CurrencyConversionService.convertCurrency(String, String, Integer))")
    public void convertCurrency() {
    }
}