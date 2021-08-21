package com.ubaid.ms.currencyconversion.aop;

import com.ubaid.ms.common.dto.CurrencyInfoDTO;
import com.ubaid.ms.common.dto.ExchangeValueDTO;
import com.ubaid.ms.common.util.exception.CCException;
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
            CurrencyInfoDTO currencyInfoDTO = (CurrencyInfoDTO) args[0];
            log.debug("Converting {} {} to {}", currencyInfoDTO.quantity(), currencyInfoDTO.fromCurrency(), currencyInfoDTO.toCurrency());
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
