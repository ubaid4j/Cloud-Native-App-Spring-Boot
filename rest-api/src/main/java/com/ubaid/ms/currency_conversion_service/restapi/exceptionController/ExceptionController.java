package com.ubaid.ms.currency_conversion_service.restapi.exceptionController;

import com.ubaid.ms.currency_conversion_service.restapi.dto.ExceptionDTO;
import com.ubaid.ms.currency_conversion_service.restapi.exception.UnknownException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Date;

@RestControllerAdvice
public class ExceptionController {

    @ExceptionHandler(UnknownException.class)
    public ResponseEntity<ExceptionDTO> handleUnknownException(UnknownException exp) {
        ExceptionDTO exceptionDTO = new ExceptionDTO();
        exceptionDTO.setMessage(exp.getMessage());
        exceptionDTO.setCause(exp.getCause().toString());
        exceptionDTO.setTimeStamp(new Date());
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(exceptionDTO);
    }
}
