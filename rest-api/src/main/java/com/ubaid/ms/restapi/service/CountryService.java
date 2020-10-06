package com.ubaid.ms.restapi.service;

import com.ubaid.ms.ccdto.CountryCodeDTO;

import java.util.List;

public interface CountryService {
    List<CountryCodeDTO> getAll();
}
