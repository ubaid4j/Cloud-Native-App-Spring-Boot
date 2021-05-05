package com.ubaid.ms.apicomposer.service;

import com.ubaid.ms.ccdto.ConvertedCurrency;
import com.ubaid.ms.ccdto.ExchangeValueDTO;
import com.ubaid.ms.apicomposer.feignProxy.CurrencyConversionServiceProxy;
import com.ubaid.ms.apicomposer.feignProxy.CurrencyExchangeServiceProxy;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class CurrencyConversionServiceImp implements CurrencyConversionService {

    private final CurrencyExchangeServiceProxy exchangeServiceProxy;
    private final CurrencyConversionServiceProxy conversionServiceProxy;

    @Override
    public ExchangeValueDTO convertCurrency(Principal principal, String fromCurrency, String toCurrency, Double quantity) {
        String accessToken = getAccessToken(principal);
        ExchangeValueDTO exchangeValueDTO = getExchangeRate(accessToken, fromCurrency, toCurrency);
        ConvertedCurrency convertedCurrency = getConvertedCurrency(accessToken, quantity, exchangeValueDTO);
        exchangeValueDTO.setExchangedCurrencyQuantity(convertedCurrency.getConvertedCurrency());
        exchangeValueDTO.setQuantity(quantity);
        return exchangeValueDTO;
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
                    .map(accessToken -> "Bearer " + accessToken)
                    .orElse("");
        } else {
            return "";
        }
    }
}
