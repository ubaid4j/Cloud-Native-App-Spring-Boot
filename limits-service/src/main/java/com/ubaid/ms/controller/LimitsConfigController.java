package com.ubaid.ms.controller;

import com.netflix.zuul.context.RequestContext;
import com.ubaid.ms.config.Config;
import com.ubaid.ms.entity.LimitsConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
@Slf4j
public class LimitsConfigController {

    private final Config config;


    @Autowired
    public LimitsConfigController(Config config) {
        this.config = config;
    }

    @GetMapping("/limits")
    public LimitsConfig retrieveLimitConfig() {

        HttpServletResponse response = RequestContext.getCurrentContext().getResponse();

        log.info("Response ========> {}", response);
        return new LimitsConfig(config.getMax(), config.getMin());
    }
}
