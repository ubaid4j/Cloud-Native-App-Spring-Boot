package com.ubaid.ms.currencyconversion.exceptionController;

import com.ubaid.ms.common.dto.ExceptionDTO;

import com.ubaid.ms.common.util.exception.CCException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Date;

@RestControllerAdvice
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
