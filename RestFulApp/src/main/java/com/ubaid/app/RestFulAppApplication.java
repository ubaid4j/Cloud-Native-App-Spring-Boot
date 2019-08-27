package com.ubaid.app;

import java.util.Locale;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@SpringBootApplication
public class RestFulAppApplication
{

	public static void main(String[] args)
	{
		SpringApplication.run(RestFulAppApplication.class, args);
	}

	/**
	 * 
	 * @return LocateResolver It actually 
	 */
	
	@Bean
	public LocaleResolver localeResolver()
	{
//		SessionLocaleResolver resolver = new SessionLocaleResolver();

		AcceptHeaderLocaleResolver resolver = new AcceptHeaderLocaleResolver();
		resolver.setDefaultLocale(Locale.US);
		return resolver;
	}

//Stead we use spring.messages.basename	
	
//	@Bean
//	public ResourceBundleMessageSource resourceBundleMessageSource()
//	{
//		ResourceBundleMessageSource source = new ResourceBundleMessageSource();
//		source.setBasename("msg");
//		return source;
//	}
	
}
