package com.ubaid.ms.entity;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonAlias;


public class CurrencyConversion
{
	private Long id;
	private String from;
	private String to;
	
	//if conversionMultiple has other name coming from another server
	@JsonAlias(value = {"exchangeRate"})
	private BigDecimal conversionMultiple;
	private BigDecimal quantity;
	private BigDecimal calculatedAmount;
	private int port;
	
	public CurrencyConversion()
	{

	}

	public CurrencyConversion(String from, String to, BigDecimal conversionMultiple, BigDecimal quantity,
			BigDecimal calculatedAmount) {
		this.from = from;
		this.to = to;
		this.conversionMultiple = conversionMultiple;
		this.quantity = quantity;
		this.calculatedAmount = calculatedAmount;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public BigDecimal getConversionMultiple() {
		return conversionMultiple;
	}

	public void setConversionMultiple(BigDecimal conversionMultiple) {
		this.conversionMultiple = conversionMultiple;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getCalculatedAmount() {
		if(conversionMultiple != null && quantity != null)
		{
			this.calculatedAmount = conversionMultiple.multiply(quantity);
			return calculatedAmount;
		}
		return calculatedAmount;
	}

	public void setCalculatedAmount(BigDecimal calculatedAmount) {
		this.calculatedAmount = calculatedAmount;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	@Override
	public String toString() {
		return "CurrencyConversion [id=" + id + ", from=" + from + ", to=" + to + ", conversionMultiple="
				+ conversionMultiple + ", quantity=" + quantity + ", calculatedAmount=" + getCalculatedAmount() + ", port="
				+ port + "]";
	}
	
	
	
	
}
