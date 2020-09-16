package com.ubaid.ms.currencyconversionapi.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.currencyconversionapi.service.CurrencyConversionService.convertCurrency(String, String, Integer))")
    public void convertCurrency() {
    }
}