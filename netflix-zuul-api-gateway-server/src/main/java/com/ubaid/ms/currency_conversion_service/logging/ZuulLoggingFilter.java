package com.ubaid.ms.currency_conversion_service.logging;


import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;


@Component
@Slf4j
public class ZuulLoggingFilter extends ZuulFilter {

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
        log.info("request ---> {} request uri ---> {}", request, request.getRequestURI());
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
