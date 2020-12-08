package com.ubaid.ms.currencyexchangeservice.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.currencyexchangeservice.service.ExchangeRateService.getExchangeValue(String, String))")
    public void getExchangeValue() {}

    @Pointcut("execution(* com.ubaid.ms.currencyexchangeservice.task.PopulateDBWithExchangeRates.populateDbWithExchangeRates())")
    public void fetchExchangeRatesFromFixerDotIO() {}
}