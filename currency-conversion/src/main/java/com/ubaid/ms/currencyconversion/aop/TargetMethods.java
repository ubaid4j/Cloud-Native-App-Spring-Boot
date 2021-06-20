package com.ubaid.ms.currencyconversion.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.currencyconversion.service.CurrencyConversionService.convertCurrency(String, String, Double))")
    public void convertCurrency() {}
}