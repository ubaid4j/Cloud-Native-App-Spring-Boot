package com.ubaid.ms.restapi.aop;

import com.ubaid.ms.module.ccexception.CCException;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@Aspect
public class Logging extends TargetMethods {

    @Around("convertCurrency()")
    public Object doLog(ProceedingJoinPoint joinPoint) throws Throwable {
        Object result;
        try {
            Object[] args = joinPoint.getArgs();
            String fromCurrency = (String) args[0];
            String toCurrency = (String) args[1];
            Integer quantity = (Integer) args[2];
            log.debug("Converting {} {} to {}", quantity, fromCurrency, toCurrency);
            result = joinPoint.proceed();

        } catch (Exception exp) {
            log.error("Exception Occurred: Message: [{}]", exp.getMessage());
            throw new CCException(exp.getMessage(), exp);
        }
        return result;
    }
}
