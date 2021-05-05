package com.ubaid.ms.userservice.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.userservice.service.AccessTokenService.getAccessToken(String, String))")
    public void getAccessToken() {}

}
