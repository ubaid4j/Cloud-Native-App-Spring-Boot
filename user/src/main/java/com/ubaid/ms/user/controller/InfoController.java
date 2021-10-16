package com.ubaid.ms.user.controller;

import com.ubaid.ms.common.dto.serviceinfo.ServiceInformation;
import com.ubaid.ms.user.service.InfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("v1")
@RequiredArgsConstructor
public class InfoController {
    private final InfoService infoService;

    @GetMapping("info")
    public ResponseEntity<ServiceInformation> getInfo() {
        return ResponseEntity.ok(infoService.get());
    }
}
