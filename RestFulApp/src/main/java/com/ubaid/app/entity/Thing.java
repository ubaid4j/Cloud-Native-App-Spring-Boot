package com.ubaid.app.entity;

import com.fasterxml.jackson.annotation.JsonFilter;

@JsonFilter("filter1")
public class Thing
{
	private static int COUNTER;
	private String name;

	private Integer id;
	
	private Double price;
	
	public Thing(String name, Double price) {
		this.name = name;
		this.price = price;
		setId(++COUNTER);
		System.out.println(COUNTER);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Thing [name=" + name + ", id=" + id + ", price=" + price + "]";
	}
	
	
	
	
}
