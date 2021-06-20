package com.ubaid.ms.country.aop;

import com.ubaid.ms.common.util.exception.CCException;
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
    public List<?> doLog(ProceedingJoinPoint pjp) throws Throwable {
        logMethodStart(pjp);
        long start = System.currentTimeMillis();
        try {
            log.debug("Getting All Country Codes");
            List<?> countries = (List<?>) pjp.proceed();
            log.debug("Got {} Country Codes", countries.size());
            long elapsedTime = System.currentTimeMillis() - start;
            logMethodExit(pjp, elapsedTime);
            return countries;
        } catch (Exception exp) {
            log.error("Exception Occurred: Message: [{}]", exp.getMessage());
            throw new CCException(exp.getMessage(), exp);
        }
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
