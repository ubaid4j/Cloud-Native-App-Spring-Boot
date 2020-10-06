package com.ubaid.ms.countryservice.service;

import com.ubaid.ms.ccdto.CountryCodeDTO;
import com.ubaid.ms.countryservice.dao.CountryCodeDAO;
import com.ubaid.ms.countryservice.entity.CountryCode;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CountryCodeServiceImp implements CountryCodeService {

    private final CountryCodeDAO countryCodeDAO;

    @Autowired
    public CountryCodeServiceImp(CountryCodeDAO countryCodeDAO) {
        this.countryCodeDAO = countryCodeDAO;
    }

    @Override
    public List<CountryCodeDTO> getAll() {
        return countryCodeDAO.findAll().stream().map(countryCode -> new ConvertCountryCodeTODTO(countryCode).getCountryCodeDTO()).collect(Collectors.toList());
    }

    @Getter
    private static class ConvertCountryCodeTODTO {

        CountryCodeDTO countryCodeDTO;

        ConvertCountryCodeTODTO(CountryCode countryCode) {
            convert(countryCode);
        }

        private void convert(CountryCode countryCode) {
            countryCodeDTO = new CountryCodeDTO();
            countryCodeDTO.setCountry(countryCode.getCountry());
            countryCodeDTO.setCurrencyCode(countryCode.getCurrencyCode());
            countryCodeDTO.setCurrencyName(countryCode.getCurrencyName());
            countryCodeDTO.setId(countryCode.getId());
            countryCodeDTO.setNumber(countryCode.getNumber());
        }
    }
}
