package com.ubaid.ms.countryservice.controller;

import com.ubaid.ms.ccdto.CountryCodeDTO;
import com.ubaid.ms.countryservice.service.CountryCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("country")
public class MainController {

    private final CountryCodeService countryCodeService;

    @Autowired
    public MainController(CountryCodeService countryCodeService) {
        this.countryCodeService = countryCodeService;
    }

    @GetMapping("code")
    public List<CountryCodeDTO> getAll() {
        return countryCodeService.getAll();
    }

}
