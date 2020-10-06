package com.ubaid.ms.countryservice.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.countryservice.service.CountryCodeService.getAll())")
    public void getAll() {
    }
}