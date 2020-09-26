package com.ubaid.ms.aop;

import com.ubaid.ms.dto.ConvertedCurrency;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@Aspect
public class Logging extends TargetMethods {

    @Around("convert()")
    public ConvertedCurrency doLog(ProceedingJoinPoint joinPoint) throws Throwable {
        ConvertedCurrency result;
        try {
            Object[] args = joinPoint.getArgs();
            Integer quantity = (Integer) args[0];
            Integer conversionRate = (Integer) args[1];
            result = (ConvertedCurrency) joinPoint.proceed();
            log.debug("Currency Value: {} * Conversion Rate: {} = Converted Currency: {}", quantity, conversionRate, result.getConvertedCurrency());

        } catch (Exception exp) {
            log.error("Exception Occurred: Message: [{}]", exp.getMessage());
            throw new RuntimeException("Unknown Exception");
        }
        return result;
    }
}
