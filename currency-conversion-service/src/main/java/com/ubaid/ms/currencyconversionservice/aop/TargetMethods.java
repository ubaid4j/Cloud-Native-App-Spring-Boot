package com.ubaid.ms.currencyconversionservice.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.currencyconversionservice.service.CurrencyConversionServiceImp.convert(Integer, Integer))")
    public void convert() {
    }
}