package com.ubaid.ms.math.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.math.service.CurrencyConversionServiceImp.convert(Double, Double))")
    public void convert() {
    }
}