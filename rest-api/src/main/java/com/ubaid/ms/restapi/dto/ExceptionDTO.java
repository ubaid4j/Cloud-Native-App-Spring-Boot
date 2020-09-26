package com.ubaid.ms.restapi.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class ExceptionDTO {
    private String message;
    private String cause;
    private Date timeStamp;
}
