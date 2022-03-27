package com.ubaid.ms.common.dto;

import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class ValueDTO {
    private Integer port;
    private String ipAddress;
    private Double value;
}
