package com.ubaid.ms.currency_conversion_service.dao;

import com.ubaid.ms.currency_conversion_service.entity.ExchangeValue;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ExchangeValueRepo extends JpaRepository<ExchangeValue, Long> {
    Optional<ExchangeValue> findByFromCurrencyAndToCurrency(String from, String to);
}
