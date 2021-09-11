package com.ubaid.ms.country.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.netflix.appinfo.ApplicationInfoManager;
import com.ubaid.ms.common.dto.serviceinfo.ServiceInformation;
import com.ubaid.ms.common.dto.serviceinfo.ServiceInformationBuilder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.actuate.info.InfoEndpoint;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class InfoServiceImpl implements InfoService {

    private final InfoEndpoint infoEndpoint;
    private final ObjectMapper objectMapper;
    private final ApplicationInfoManager applicationInfoManager;

    @Override
    public ServiceInformation get() {
        ServiceInformationBuilder builder = ServiceInformationBuilder
            .builder(objectMapper.convertValue(infoEndpoint.info(), ServiceInformation.class));
        builder.name(applicationInfoManager.getInfo().getAppName());
        ServiceInformation serviceInformation = builder.build();
        log.debug("Service Information: {}", serviceInformation);
        return serviceInformation;
    }
}
