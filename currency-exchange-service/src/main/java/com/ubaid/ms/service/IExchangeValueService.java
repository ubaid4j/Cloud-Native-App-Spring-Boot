package com.ubaid.ms.service;

import com.ubaid.ms.entity.ExchangeValue;

public interface IExchangeValueService
{
	public ExchangeValue getExchangeValue(String from, String to);
}
