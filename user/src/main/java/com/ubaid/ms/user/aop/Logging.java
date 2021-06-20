package com.ubaid.ms.user.aop;

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

    @Around("getAccessToken()")
    public String doLog(ProceedingJoinPoint pjp) throws Throwable {
        logMethodStart(pjp);
        long start = System.currentTimeMillis();
        String accessToken;
        try {
            Object[] args = pjp.getArgs();
            String username = (String) args[0];
            String password = (String) args[1];
            log.debug("Getting Access Token for {} and using password {}", username, password);
            accessToken = (String) pjp.proceed();
            log.debug("Access Token: {}", accessToken);

        } catch (Exception exp) {
            log.error("Exception Occurred: Message: [{}]", exp.getMessage());
            throw new CCException(exp.getMessage(), exp);
        }
        long elapsedTime = System.currentTimeMillis() - start;
        logMethodExit(pjp, elapsedTime);
        return accessToken;
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
