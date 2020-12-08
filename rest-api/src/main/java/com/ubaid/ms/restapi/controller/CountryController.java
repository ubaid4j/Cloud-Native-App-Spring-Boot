package com.ubaid.ms.restapi.controller;

import com.ubaid.ms.ccdto.CountryCodeDTO;
import com.ubaid.ms.restapi.service.CountryService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.cors.CorsConfiguration;

import java.util.List;

@RestController
@RequestMapping(value = "/api/country")
@CrossOrigin(value = CorsConfiguration.ALL)
@RequiredArgsConstructor
public class CountryController {

    private final CountryService countryService;

    @GetMapping(value = "code")
    public List<CountryCodeDTO> getAll() {
        return countryService.getAll();
    }
}
