package com.ubaid.ms.countryservice.aop;


import com.ubaid.ms.module.ccexception.CCException;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
@Aspect
public class Logging extends TargetMethods {

    @Around("getAll()")
    public List<?> doLog(ProceedingJoinPoint joinPoint) throws Throwable {
        List<?> result;
        try {
            log.debug("Getting All Country Codes");
            result = (List<?>) joinPoint.proceed();
            log.debug("Got {} Country Codes", result.size());

        } catch (Exception exp) {
            log.error("Exception Occurred: Message: [{}]", exp.getMessage());
            throw new CCException("Unknown Exception");
        }
        return result;
    }
}
