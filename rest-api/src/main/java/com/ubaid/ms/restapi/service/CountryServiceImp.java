package com.ubaid.ms.restapi.service;

import com.ubaid.ms.ccdto.CountryCodeDTO;
import com.ubaid.ms.restapi.feignProxy.CountryServiceProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CountryServiceImp implements CountryService{

    private final CountryServiceProxy countryServiceProxy;

    @Autowired
    public CountryServiceImp(CountryServiceProxy countryServiceProxy) {
        this.countryServiceProxy = countryServiceProxy;
    }

    @Override
    public List<CountryCodeDTO> getAll() {
        return countryServiceProxy.getAll();
    }
}
