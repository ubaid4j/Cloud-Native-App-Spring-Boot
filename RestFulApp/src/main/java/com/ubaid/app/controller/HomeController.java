package com.ubaid.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ubaid.app.entity.HelloWorld;

@RestController
@RequestMapping("/")
public class HomeController
{

	@Autowired
	ResourceBundleMessageSource source;
	
	@GetMapping(value = "helloWorld")
	public String getHelloWorld()
	{
		return source.getMessage("greetings", null, LocaleContextHolder.getLocale());
	}
	
	@GetMapping(value = "helloWorldBean")
	public HelloWorld getHelloWorldBean()
	{
		return new HelloWorld("Hello world bean");
	}
	
	@GetMapping(value = "helloWorld/path/{name}")
	public HelloWorld getHWwithPath(@PathVariable("name") String name)
	{
		return new HelloWorld(String.format("Hello %s", name));
	}
	
	
}
