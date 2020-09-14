package com.ubaid.ms.controller;

import com.ubaid.ms.config.Config;
import com.ubaid.ms.entity.LimitsConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
@Slf4j
public class LimitsConfigController {

    private final Config config;
    private final Environment env;

    @Autowired
    public LimitsConfigController(Config config, Environment env) {
        this.config = config;
        this.env = env;
    }

    @GetMapping("/limits")
    public LimitsConfig retrieveLimitConfig() {
        int port = Integer.parseInt(Objects.requireNonNull(env.getProperty("local.server.port")));
        return new LimitsConfig(config.getMax(), config.getMin(), port);
    }
}
