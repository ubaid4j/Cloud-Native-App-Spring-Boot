package com.ubaid.ms.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ubaid.ms.entity.ExchangeValue;

@Repository
public interface ExchangeValueRepo extends JpaRepository<ExchangeValue, Long>
{
	ExchangeValue findByFromAndTo(String from, String to);
}
