package com.ubaid.ms.currency_conversion_service.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.currency_conversion_service.service.CurrencyConversionServiceImp.convert(Integer, Integer))")
    public void convert() {
    }
}