package com.ubaid.ms.currency_conversion_service.restapi.exception;

public class UnknownException extends RuntimeException {
    public UnknownException(String message) {
        super(message);
    }

    public UnknownException(String message, Throwable cause) {
        super(message, cause);
    }
}
