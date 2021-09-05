package com.ubaid.ms.apigateway.controller;

import com.ubaid.ms.apigateway.services.InfoService;
import com.ubaid.ms.common.dto.serviceinfo.ServiceInformation;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.RequiredArgsConstructor;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping(value = "api/api-gateway/v1/info")
@RequiredArgsConstructor
public class InformationController {

    private final DiscoveryClient discoveryClient;
    private final InfoService infoService;
    
    @GetMapping("services")
    public Mono<ResponseEntity<Map<String, String>>> getAllServices() {
        List<String> allServices = discoveryClient.getServices();
        Map<String, String> servicesWithInfoURI = allServices
            .stream()
            .collect(Collectors.toMap(key -> key, value -> "api/" + value + "/v1/info"));
        return Mono.just(ResponseEntity.ok(servicesWithInfoURI));
    }

    @GetMapping 
    Mono<ResponseEntity<ServiceInformation>> get() {
        return Mono.just(ResponseEntity.ok(infoService.get()));
    }
}
