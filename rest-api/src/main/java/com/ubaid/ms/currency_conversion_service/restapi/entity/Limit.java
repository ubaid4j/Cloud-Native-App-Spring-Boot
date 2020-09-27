package com.ubaid.ms.currency_conversion_service.restapi.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Limit {
	private int max;
	private int min;
	private int port;
}
