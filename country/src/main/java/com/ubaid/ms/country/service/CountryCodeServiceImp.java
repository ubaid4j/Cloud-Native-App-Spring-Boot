package com.ubaid.ms.country.service;

import com.ubaid.ms.common.dto.CountryCodeDTO;
import com.ubaid.ms.country.dao.CountryCodeDAO;
import com.ubaid.ms.country.entity.CountryCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CountryCodeServiceImp implements CountryCodeService {

    private final CountryCodeDAO countryCodeDAO;

    @Override
    public List<CountryCodeDTO> getAll() {
        return countryCodeDAO
                .findAll()
                .stream()
                .map(countryCode -> new ConvertCountryCodeTODTO(countryCode)
                        .getCountryCodeDTO())
                .collect(Collectors.toList());
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
            countryCodeDTO.setIsoCode(countryCode.getIsoCode());
        }
    }
}
