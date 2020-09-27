package com.ubaid.ms.currencyexchangeservice.aop;

import com.ubaid.ms.currencyexchangeservice.dto.ExchangeValueDTO;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@Aspect
public class Logging extends TargetMethods {

    @Around("getExchangeValue()")
    public ExchangeValueDTO doLog(ProceedingJoinPoint joinPoint) throws Throwable {
        ExchangeValueDTO result;
        try {
            Object[] args = joinPoint.getArgs();
            String from = (String) args[0];
            String to = (String) args[1];
            result = (ExchangeValueDTO) joinPoint.proceed();
            log.debug("{} ---> {} : Exchange Rate: {}", from, to, result.getExchangeRate());

        } catch (Exception exp) {
            log.error("Exception Occurred: Message: [{}]", exp.getMessage());
            throw new RuntimeException("Unknown Exception");
        }
        return result;
    }
}
