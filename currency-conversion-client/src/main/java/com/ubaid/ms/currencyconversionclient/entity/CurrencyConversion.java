package com.ubaid.ms.currencyconversionclient.entity;

import java.math.BigDecimal;

public class CurrencyConversion
{
	private Long id;
	private String from;
	private String to;
	private BigDecimal quantity;
	private BigDecimal calculatedAmount;

	public CurrencyConversion(String from, String to, BigDecimal quantity, BigDecimal calculatedAmount) {
		super();
		this.from = from;
		this.to = to;
		this.quantity = quantity;
		this.calculatedAmount = calculatedAmount;
	}

	public CurrencyConversion() {
		super();
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

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getCalculatedAmount() {
		return calculatedAmount;
	}

	public void setCalculatedAmount(BigDecimal calculatedAmount) {
		this.calculatedAmount = calculatedAmount;
	}

	@Override
	public String toString() {
		return "CurrencyConversion [id=" + id + ", from=" + from + ", to=" + to + ", quantity=" + quantity
				+ ", calculatedAmount=" + calculatedAmount + "]";
	}
}
