package com.ubaid.ms.apicomposer.feignProxy;

import static org.springframework.http.MediaType.APPLICATION_FORM_URLENCODED_VALUE;
import feign.codec.Encoder;
import feign.form.spring.SpringFormEncoder;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.support.SpringEncoder;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

@FeignClient(name = "auth-server", url = "${keycloak.auth-server-url}" , configuration = AuthTokenServiceProxy.Configuration.class)
public interface AuthTokenServiceProxy {

    @PostMapping(value = "/realms/3cn/protocol/openid-connect/token", consumes = APPLICATION_FORM_URLENCODED_VALUE)
    Map<String, ?> login(@RequestBody Map<String, ?> form);

    class Configuration {
        @Bean
        Encoder feignFormEncoder(ObjectFactory<HttpMessageConverters> converters) {
            return new SpringFormEncoder(new SpringEncoder(converters));
        }
    }
}
