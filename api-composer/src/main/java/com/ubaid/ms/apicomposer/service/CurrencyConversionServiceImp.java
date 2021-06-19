package com.ubaid.ms.apicomposer.service;

import com.ubaid.ms.apicomposer.util.BearerToken;
import com.ubaid.ms.ccdto.AuditDTO;
//import com.ubaid.ms.ccdto.AuditDTOBuilder;
import com.ubaid.ms.ccdto.AuditDTOBuilder;
import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.apicomposer.feignProxy.CurrencyConversionServiceProxy;
import com.ubaid.ms.apicomposer.feignProxy.CurrencyExchangeServiceProxy;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.time.Instant;
import java.util.Optional;

import static com.ubaid.ms.common.Constants.BEARER;
import static com.ubaid.ms.common.Constants.EMPTY_STRING;
import static com.ubaid.ms.common.Constants.SINGLE_SPACE;

@Service
@Slf4j
@RequiredArgsConstructor
public class CurrencyConversionServiceImp implements CurrencyConversionService {

    private final CurrencyExchangeServiceProxy exchangeServiceProxy;
    private final CurrencyConversionServiceProxy conversionServiceProxy;
    private final AuditService auditService;
    private final AuthService authService;

    @Override
    public ExchangeValueDTO convertCurrency(Principal principal, String fromCurrency, String toCurrency, Double quantity) {
        BearerToken bearerToken = new BearerToken(authService.getAccessToken());
        ExchangeValueDTO exchangeValueDTO = getExchangeRate(bearerToken.getBearerToken(), fromCurrency, toCurrency);
        ConvertedCurrency convertedCurrency = getConvertedCurrency(bearerToken.getBearerToken(), quantity, exchangeValueDTO);
        exchangeValueDTO.setExchangedCurrencyQuantity(convertedCurrency.getConvertedCurrency());
        exchangeValueDTO.setQuantity(quantity);
        AuditDTO auditDTO = convertToAudit(exchangeValueDTO);
        log.debug("Audit Log: {}", auditDTO);
        auditService.sendAuditLog(auditDTO);
        return exchangeValueDTO;
    }

    private AuditDTO convertToAudit(ExchangeValueDTO exchangeValueDTO) {
        return AuditDTOBuilder
                .builder()
                .fromCurrency(exchangeValueDTO.getFrom())
                .fromCurrencyValue(Float.parseFloat(String.valueOf(exchangeValueDTO.getQuantity())))
                .toCurrency(exchangeValueDTO.getTo())
                .toCurrencyValue(Float.parseFloat(String.valueOf(exchangeValueDTO.getExchangedCurrencyQuantity())))
                .exchangeRate(Float.parseFloat(String.valueOf(exchangeValueDTO.getExchangeRate())))
                .userUUID(authService.getUserUUID())
                .build();
    }

    ConvertedCurrency getConvertedCurrency(String accessToken, Double quantity, ExchangeValueDTO exchangeValueDTO) {
        return conversionServiceProxy.convert(accessToken, quantity, exchangeValueDTO.getExchangeRate());
    }

    ExchangeValueDTO getExchangeRate(String accessToken, String fromCurrency, String toCurrency) {
        return exchangeServiceProxy.getCurrencyExchangeRate(accessToken, fromCurrency, toCurrency);
    }


    public String getAccessToken(Principal principal) {
        if (principal instanceof  JwtAuthenticationToken jwtAuth) {
            return Optional
                    .of(jwtAuth)
                    .map(jwtAuthToken -> jwtAuthToken.getToken().getTokenValue())
                    .map(accessToken -> BEARER + SINGLE_SPACE + accessToken)
                    .orElse(EMPTY_STRING);
        } else {
            return EMPTY_STRING;
        }
    }
}
