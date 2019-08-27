package com.ubaid.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ubaid.app.entity.HelloWorld;

@RestController
@RequestMapping("/")
public class HomeController
{
	
	@GetMapping(value = "helloWorld")
	public String getHelloWorld()
	{
		return "Hello World";
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
