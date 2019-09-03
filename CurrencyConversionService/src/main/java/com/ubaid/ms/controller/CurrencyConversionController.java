package com.ubaid.ms.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.ubaid.ms.entity.CurrencyConversion;

@RestController
@RequestMapping("currency-conversion")
public class CurrencyConversionController
{
	@GetMapping(value = "from/{from}/to/{to}/quantity/{quantity}")
	public CurrencyConversion getCurrencyConversion(
			@PathVariable("to") String to, 
			@PathVariable("from") String from,
			@PathVariable("quantity") BigDecimal quantity)
	{

		Map<String, String> urlMap = new HashMap<String, String>();
		urlMap.put("to", to);
		urlMap.put("from", from);
		
		
		ResponseEntity<CurrencyConversion> responseEntity
			= new RestTemplate().getForEntity(
					"http://localhost:8000/currency-exchange/from/{from}/to/{to}",
						CurrencyConversion.class, urlMap);
	
		CurrencyConversion currencyConversion = responseEntity.getBody();
		currencyConversion.setQuantity(quantity);
		System.out.println(currencyConversion);
		return currencyConversion;
	}
}
