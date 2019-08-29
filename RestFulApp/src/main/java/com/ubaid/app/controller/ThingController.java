package com.ubaid.app.controller;

import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.fasterxml.jackson.databind.ser.impl.SimpleBeanPropertyFilter;
import com.fasterxml.jackson.databind.ser.impl.SimpleFilterProvider;
import com.ubaid.app.entity.Thing;

@RestController
@RequestMapping("/")
public class ThingController
{
	
	@GetMapping("/thing/{id}")
	private MappingJacksonValue getThing(@PathVariable("id") int id)
	{
		SimpleBeanPropertyFilter filter = SimpleBeanPropertyFilter.filterOutAllExcept("price");
		FilterProvider filters = new SimpleFilterProvider().addFilter("filter1", filter);
		Thing thing = new Thing("Qulfi", 10.2);
		MappingJacksonValue mapping = new MappingJacksonValue(thing);
		mapping.setFilters(filters);
		return mapping;
	}
}
