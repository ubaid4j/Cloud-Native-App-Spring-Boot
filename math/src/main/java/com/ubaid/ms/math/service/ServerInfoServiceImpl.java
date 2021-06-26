package com.ubaid.ms.math.service;

import com.netflix.appinfo.ApplicationInfoManager;
import com.netflix.appinfo.InstanceInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Optional;

import static com.ubaid.ms.common.util.Constants.EMPTY_STRING;

@Service
@Slf4j
@RequiredArgsConstructor
public class ServerInfoServiceImpl implements ServerInfoService {

    private final ApplicationInfoManager applicationInfoManager;


    @Override
    public int getPort() {
        Optional<Integer> port = Optional
                .ofNullable(applicationInfoManager)
                .map(ApplicationInfoManager::getInfo)
                .map(InstanceInfo::getPort);

        port.ifPresentOrElse(port_ ->
                log.debug("{} port --> {}", getInstanceName(), port_), () ->
                log.warn("{} port is not found", getInstanceName()));

        return port.orElse(0);
    }

    @Override
    public String getIPAddress() {
        Optional<String> ipAddress = Optional
                .ofNullable(applicationInfoManager)
                .map(ApplicationInfoManager::getInfo)
                .map(InstanceInfo::getIPAddr);

        ipAddress.ifPresentOrElse(ipAdd ->
                log.debug("{} IP address ---> {}", getInstanceName(), ipAdd), () ->
                log.warn("{} ip address is not found", getInstanceName()));

        return ipAddress.orElse(EMPTY_STRING);
    }

    private String getInstanceName() {
        return Optional
                .ofNullable(applicationInfoManager)
                .map(ApplicationInfoManager::getInfo)
                .map(InstanceInfo::getAppName)
                .orElse(EMPTY_STRING);
    }
}
