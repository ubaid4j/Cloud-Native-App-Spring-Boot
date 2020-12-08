package com.ubaid.ms.restapi.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.restapi.service.CurrencyConversionService.convertCurrency(String, String, Double))")
    public void convertCurrency() {}

    @Pointcut("execution(* com.ubaid.ms.restapi.service.CountryService.getAll())")
    public void getAllCountries() {}
}