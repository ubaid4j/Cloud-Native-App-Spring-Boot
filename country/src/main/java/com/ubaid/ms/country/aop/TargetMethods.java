package com.ubaid.ms.country.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.country.service.CountryCodeService.getAll())")
    public void getAll() {
    }
}