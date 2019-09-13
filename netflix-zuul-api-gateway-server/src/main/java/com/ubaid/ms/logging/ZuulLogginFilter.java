package com.ubaid.ms.logging;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;

@Component
public class ZuulLogginFilter extends ZuulFilter
{

	//slf4j logger
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * true for filter
	 */
	@Override
	public boolean shouldFilter()
	{
		return true;
	}

	
	/**
	 * actual method
	 */
	@Override
	public Object run() throws ZuulException
	{
		HttpServletRequest request = RequestContext.getCurrentContext().getRequest();
		logger.info("request ---> {} request uri ---> {}", request, request.getRequestURI());
		return null;
	}

	/**
	 * doing filter for all request
	 */
	
	@Override
	public String filterType()
	{
		return "pre";
	}

	/**
	 * priority order
	 */
	@Override
	public int filterOrder()
	{
		return 1;
	}

}
