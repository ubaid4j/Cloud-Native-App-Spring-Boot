package com.ubaid.ms.logging;


import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Component
public class ZuulLoggingFilter extends ZuulFilter {

    //slf4j logger
    private final Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * true for filter
     */
    @Override
    public boolean shouldFilter() {
        return true;
    }


    /**
     * actual method
     */
    @Override
    public Object run() {
        HttpServletRequest request = RequestContext.getCurrentContext().getRequest();
        logger.info("request ---> {} request uri ---> {}", request, request.getRequestURI());
        return null;
    }

    /**
     * doing filter for all request
     */

    @Override
    public String filterType() {
        return "pre";
    }

    /**
     * priority order
     */
    @Override
    public int filterOrder() {
        return 1;
    }

}
