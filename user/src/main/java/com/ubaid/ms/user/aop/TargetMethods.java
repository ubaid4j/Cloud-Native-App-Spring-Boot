package com.ubaid.ms.user.aop;

import org.aspectj.lang.annotation.Pointcut;

public abstract class TargetMethods {

    @Pointcut("execution(* com.ubaid.ms.user.service.AccessTokenService.getAccessToken(String, String))")
    public void getAccessToken() {}

}
