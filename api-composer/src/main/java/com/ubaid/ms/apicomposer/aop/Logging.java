package com.ubaid.ms.apicomposer.aop;

import com.ubaid.ms.ccdto.ExchangeValueDTO;
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
    public ExchangeValueDTO doLog(ProceedingJoinPoint pjp) throws Throwable {
        logMethodStart(pjp);
        long start = System.currentTimeMillis();
        ExchangeValueDTO result;
        try {
            Object[] args = pjp.getArgs();
            String fromCurrency = (String) args[0];
            String toCurrency = (String) args[1];
            Double quantity = (Double) args[2];
            log.debug("Converting {} {} to {}", quantity, fromCurrency, toCurrency);
            result = (ExchangeValueDTO) pjp.proceed();
            log.debug("The Converted Currency is: {}", result);

        } catch (Exception exp) {
            log.error("Exception Occurred: Message: [{}]", exp.getMessage());
            throw new CCException(exp.getMessage(), exp);
        }
        long elapsedTime = System.currentTimeMillis() - start;
        logMethodExit(pjp, elapsedTime);
        return result;
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
