package com.ubaid.ms.user.feignproxy;

import feign.codec.Decoder;
import feign.codec.Encoder;
import feign.form.spring.SpringFormEncoder;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.support.SpringDecoder;
import org.springframework.cloud.openfeign.support.SpringEncoder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

import static org.springframework.http.MediaType.APPLICATION_FORM_URLENCODED_VALUE;

@FeignClient(name = "auth-server", url = "${keycloak.auth-server-url}", configuration = AuthTokenServiceProxy.FeignResponseDecoderConfig.class)
public interface AuthTokenServiceProxy {

    @PostMapping(value = "/realms/3cn/protocol/openid-connect/token", consumes = APPLICATION_FORM_URLENCODED_VALUE)
    Map<String, ?> getAccessToken(@RequestBody Map<String, ?> form);

    @Configuration
    class FeignResponseDecoderConfig {
        ObjectFactory<HttpMessageConverters> messageConverters = HttpMessageConverters::new;

        @Bean
        Encoder feignFormEncoder() {
            return new SpringFormEncoder(new SpringEncoder(messageConverters));
        }

        @Bean
        Decoder feignFormDecoder() {
            return new SpringDecoder(messageConverters);
        }
    }
}
