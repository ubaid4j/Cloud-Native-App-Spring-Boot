package com.ubaid.app.versioning.entity;

public class Person2
{
	private Name name;

	public Person2() {
	}

	public Person2(Name name) {
		this.name = name;
	}

	public Name getName() {
		return name;
	}

	public void setName(Name name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Person2 [name=" + name + "]";
	}
	
	
}
