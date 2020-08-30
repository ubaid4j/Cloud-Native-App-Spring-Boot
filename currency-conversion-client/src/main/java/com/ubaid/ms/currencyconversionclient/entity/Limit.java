package com.ubaid.ms.currencyconversionclient.entity;

public class Limit
{
	private int max;
	private int min;
	
	public Limit()
	{
		
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public Limit(int max, int min)
	{
		this.max = max;
		this.min = min;
	}

}
