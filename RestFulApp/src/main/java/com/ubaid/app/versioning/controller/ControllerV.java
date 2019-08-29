package com.ubaid.app.versioning.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ubaid.app.versioning.entity.Name;
import com.ubaid.app.versioning.entity.Person1;
import com.ubaid.app.versioning.entity.Person2;

@RestController
@RequestMapping("api")
public class ControllerV
{
	//----------------------------------------Versioning Through URL--------------------------------
	
	@GetMapping("v1/person")
	public Person1 getPerson1()
	{
		return new Person1("Ubaid");
	}
	
	@GetMapping("v2/person")
	public Person2 getPerson2()
	{
		return new Person2(new Name("Ubaid", "Rehman"));
	}
	
	//---------------------------------------Versioning through query Parameter----------------------
	@GetMapping(value = "person", params = "version=1")
	public Person1 getPerson1_P()
	{
		return new Person1("Ubaid");
	}
	
	@GetMapping(value = {"person"}, params = {"version=2"})
	public Person2 getPerson2_P()
	{
		return new Person2(new Name("Ubaid", "Rehman"));
	}
	
	//-----------------------------------Versioning through custom headers------------------------------
	@GetMapping(value = {"person/header"}, headers = {"ver=1"})
	public Person1 getPerson1_H()
	{
		return new Person1("Ubaid");
	}
	
	@GetMapping(value = {"person/header"}, headers = {"ver=2"})
	public Person2 getPerson2_H()
	{
		return new Person2(new Name("Ubaid", "Rehman"));
	}
	
	//----------------------------------Versioning through content negotiation---------------------------
	@GetMapping(value = "person", produces = "application/x-api-1+json")
	public Person1 getPerson1_CN()
	{
		return new Person1("Ubaid");
	}
	
	@GetMapping(value = "person", produces = "application/x-api-2+json")
	public Person2 getPerson2_CN()
	{
		return new Person2(new Name("Ubaid", "Rehman"));
	}
	
	
}
