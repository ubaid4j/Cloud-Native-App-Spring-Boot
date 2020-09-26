package com.ubaid.ms.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.service.CurrencyConversionServiceImp.convert(Integer, Integer))")
    public void convert() {
    }
}