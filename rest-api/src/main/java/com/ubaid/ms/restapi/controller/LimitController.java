package com.ubaid.ms.restapi.controller;


import com.ubaid.ms.restapi.config.Config;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "config")
@Slf4j
public class LimitController {

    private final Config config;

    @Autowired
    public LimitController(Config config) {
        this.config = config;
    }

    @GetMapping("/limits")
    public Config getCurrencyConversion() {
        return config;
    }
}
