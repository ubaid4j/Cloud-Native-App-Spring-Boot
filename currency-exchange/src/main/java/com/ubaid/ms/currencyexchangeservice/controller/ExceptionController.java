package com.ubaid.ms.currencyexchangeservice.controller;

import com.ubaid.ms.common.dto.ExceptionDTO;
import com.ubaid.ms.common.util.exception.CCException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.Date;

@ControllerAdvice
public class ExceptionController {

    @ExceptionHandler(CCException.class)
    public ResponseEntity<ExceptionDTO> handleUnknownException(CCException exp) {
        ExceptionDTO exceptionDTO = new ExceptionDTO();
        exceptionDTO.setMessage(exp.getMessage());
        exceptionDTO.setCause(exp.getCause().toString());
        exceptionDTO.setTimeStamp(new Date());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(exceptionDTO);
    }

}
