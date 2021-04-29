package com.ubaid.ms.apicomposer.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.apicomposer.service.CurrencyConversionService.convertCurrency(String, String, Double))")
    public void convertCurrency() {}
}