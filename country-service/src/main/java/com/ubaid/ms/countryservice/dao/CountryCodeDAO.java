package com.ubaid.ms.countryservice.dao;

import com.ubaid.ms.countryservice.entity.CountryCode;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CountryCodeDAO extends JpaRepository<CountryCode, Long> {

}
