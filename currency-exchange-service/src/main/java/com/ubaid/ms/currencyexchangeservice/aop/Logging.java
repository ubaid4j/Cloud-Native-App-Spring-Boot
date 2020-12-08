package com.ubaid.ms.currencyexchangeservice.aop;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.module.ccexception.CCException;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
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
            throw new CCException(exp);
        }
        return result;
    }

    @Before("fetchExchangeRatesFromFixerDotIO()")
    public void bLogFetchExchangeRatesFromFixerDotIO() {
        log.debug("Executing Task to fetch all rates from http://data.fixer.io/");
    }

    @After("fetchExchangeRatesFromFixerDotIO()")
    public void rLogFetchExchangeRatesFromFixerDotIO() {
        log.debug("Task to fetch all rates from http://data.fixer.io/ finished");
    }

    @AfterThrowing(value = "fetchExchangeRatesFromFixerDotIO()", throwing = "exception")
    public void tLogFetchExchangeRatesFromFixerDotIO(CCException exception) {
        log.error(exception.getMessage());
        log.error("Task to fetch all rates from http://data.fixer.io/ produced some errors");
    }
}
