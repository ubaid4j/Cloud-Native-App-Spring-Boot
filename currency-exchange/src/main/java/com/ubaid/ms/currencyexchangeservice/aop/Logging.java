package com.ubaid.ms.currencyexchangeservice.aop;

import com.ubaid.ms.common.dto.ExchangeValueDTO;
import com.ubaid.ms.common.util.exception.CCException;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@Aspect
public class Logging extends TargetMethods {

    @Around("getExchangeValue()")
    public ExchangeValueDTO doLog(ProceedingJoinPoint pjp) throws Throwable {
        logMethodStart(pjp);
        long start = System.currentTimeMillis();
        try {
            Object[] args = pjp.getArgs();
            String from = (String) args[0];
            String to = (String) args[1];
            ExchangeValueDTO exchangeValueDTO = (ExchangeValueDTO) pjp.proceed();
            log.debug("{} ---> {} : Exchange Rate: {}", from, to, exchangeValueDTO.getExchangeRate());
            long elapsedTime = System.currentTimeMillis() - start;
            logMethodExit(pjp, elapsedTime);
            return exchangeValueDTO;
        } catch (Exception exp) {
            log.error("Exception Occurred: Message: [{}]", exp.getMessage());
            throw new CCException(exp);
        }
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

    private void logMethodStart(ProceedingJoinPoint pjp) {
        String packageName = pjp.getSignature().getDeclaringTypeName();
        String methodName = pjp.getSignature().getName();
        if(!pjp.getSignature().getName().equals("initBinder")) {
            log.info("Entering method [" + packageName + "." + methodName +  "]");
        }
    }

    private void logMethodExit(ProceedingJoinPoint pjp, long elapsedTime) {
        String methodName = pjp.getSignature().getName();
        String packageName = pjp.getSignature().getDeclaringTypeName();
        if(!methodName.equals("initBinder")) {
            log.info("Exiting method [" + packageName + "." + methodName + "]; exec time (ms): " + elapsedTime);
        }
    }

}
