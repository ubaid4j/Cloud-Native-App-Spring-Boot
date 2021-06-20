package com.ubaid.ms.currencyconversion.service;

import com.ubaid.ms.currencyconversion.util.BearerToken;
import com.ubaid.ms.common.dto.AuditDTO;
import com.ubaid.ms.common.dto.AuditDTOBuilder;
import com.ubaid.ms.common.dto.ConvertedCurrency;
import com.ubaid.ms.common.dto.ExchangeValueDTO;
import com.ubaid.ms.currencyconversion.feignProxy.CurrencyConversionServiceProxy;
import com.ubaid.ms.currencyconversion.feignProxy.CurrencyExchangeServiceProxy;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class CurrencyConversionServiceImp implements CurrencyConversionService {

    private final CurrencyExchangeServiceProxy exchangeServiceProxy;
    private final CurrencyConversionServiceProxy conversionServiceProxy;
    private final AuditService auditService;
    private final AuthService authService;
    private final RequestService requestService;

    @Override
    public ExchangeValueDTO convertCurrency(String fromCurrency, String toCurrency, Double quantity) {
        BearerToken bearerToken = new BearerToken(authService.getAccessToken());
        ExchangeValueDTO exchangeValueDTO = getExchangeRate(bearerToken.getBearerToken(), fromCurrency, toCurrency);
        ConvertedCurrency convertedCurrency = getConvertedCurrency(bearerToken.getBearerToken(), quantity, exchangeValueDTO);
        exchangeValueDTO.setExchangedCurrencyQuantity(convertedCurrency.getConvertedCurrency());
        exchangeValueDTO.setQuantity(quantity);
        AuditDTO auditDTO = convertToAudit(exchangeValueDTO, convertedCurrency);
        auditService.sendAuditLogToMQ(auditDTO);
        return exchangeValueDTO;
    }

    private AuditDTO convertToAudit(ExchangeValueDTO exchangeValueDTO, ConvertedCurrency convertedCurrency) {
        log.debug("Creating Audit DTO from {} and {}", exchangeValueDTO, convertedCurrency);
        AuditDTO auditDTO =  AuditDTOBuilder
            .builder()
            .fromCurrency(exchangeValueDTO.getFrom())
            .fromCurrencyValue(exchangeValueDTO.getQuantity())
            .toCurrency(exchangeValueDTO.getTo())
            .toCurrencyValue(exchangeValueDTO.getExchangedCurrencyQuantity())
            .exchangeRate(exchangeValueDTO.getExchangeRate())
            .userUUID(authService.getUserUUID())
            .currencyConversionPort(convertedCurrency.getPort())
            .currencyConversionIP(convertedCurrency.getIpAddress())
            .currencyExchangePort(exchangeValueDTO.getPort())
            .currencyExchangeIP(exchangeValueDTO.getIpAddress())
            .userIPAddress(requestService.getClientIP())
            .build();
        log.debug("Audit DTO: {}", auditDTO);
        return auditDTO;
    }

    ConvertedCurrency getConvertedCurrency(String accessToken, Double quantity, ExchangeValueDTO exchangeValueDTO) {
        return conversionServiceProxy.convert(accessToken, quantity, exchangeValueDTO.getExchangeRate());
    }

    ExchangeValueDTO getExchangeRate(String accessToken, String fromCurrency, String toCurrency) {
        return exchangeServiceProxy.getCurrencyExchangeRate(accessToken, fromCurrency, toCurrency);
    }
}
