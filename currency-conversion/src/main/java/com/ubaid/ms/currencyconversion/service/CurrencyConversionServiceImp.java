package com.ubaid.ms.currencyconversion.service;

import com.ubaid.ms.common.dto.CurrencyInfoDTO;
import com.ubaid.ms.common.dto.AuditDTO;
import com.ubaid.ms.common.dto.AuditDTOBuilder;
import com.ubaid.ms.common.dto.ValueDTO;
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
    public ExchangeValueDTO convertCurrency(CurrencyInfoDTO currencyInfo) {
        ExchangeValueDTO exchangeValueDTO = getExchangeRate(currencyInfo.fromCurrency(), currencyInfo.toCurrency());
        ValueDTO valueDTO = getConvertedCurrency(currencyInfo.quantity(), exchangeValueDTO);
        exchangeValueDTO.setExchangedCurrencyQuantity(valueDTO.getValue());
        exchangeValueDTO.setQuantity(currencyInfo.quantity());
        AuditDTO auditDTO = convertToAudit(exchangeValueDTO, valueDTO);
        auditService.sendAuditLogToMQ(auditDTO);
        return exchangeValueDTO;
    }

    private AuditDTO convertToAudit(ExchangeValueDTO exchangeValueDTO, ValueDTO valueDTO) {
        log.debug("Creating Audit DTO from {} and {}", exchangeValueDTO, valueDTO);
        AuditDTO auditDTO =  AuditDTOBuilder
            .builder()
            .fromCurrency(exchangeValueDTO.getFrom())
            .fromCurrencyValue(exchangeValueDTO.getQuantity())
            .toCurrency(exchangeValueDTO.getTo())
            .toCurrencyValue(exchangeValueDTO.getExchangedCurrencyQuantity())
            .exchangeRate(exchangeValueDTO.getExchangeRate())
            .userUUID(authService.getUserUUID())
            .currencyConversionPort(valueDTO.getPort())
            .currencyConversionIP(valueDTO.getIpAddress())
            .currencyExchangePort(exchangeValueDTO.getPort())
            .currencyExchangeIP(exchangeValueDTO.getIpAddress())
            .userIPAddress(requestService.getClientIP())
            .build();
        log.debug("Audit DTO: {}", auditDTO);
        return auditDTO;
    }

    ValueDTO getConvertedCurrency(Double quantity, ExchangeValueDTO exchangeValueDTO) {
        return conversionServiceProxy.convert(authService.getBearerToken(), quantity, exchangeValueDTO.getExchangeRate());
    }

    ExchangeValueDTO getExchangeRate(String fromCurrency, String toCurrency) {
        return exchangeServiceProxy.getCurrencyExchangeRate(authService.getBearerToken(), fromCurrency, toCurrency);
    }
}
