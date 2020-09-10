package com.ubaid.ms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ubaid.ms.dao.ExchangeValueRepo;
import com.ubaid.ms.entity.ExchangeValue;

@Service
public class ExchangeValueService implements IExchangeValueService
{

	@Autowired
	private ExchangeValueRepo dao;
	
	@Override
	public ExchangeValue getExchangeValue(String from, String to)
	{
		return dao.findByFromAndTo(from, to);
	}

}
