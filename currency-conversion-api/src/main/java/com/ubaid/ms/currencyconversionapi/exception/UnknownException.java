package com.ubaid.ms.currencyconversionapi.exception;

public class UnknownException extends RuntimeException {
    public UnknownException(String message) {
        super(message);
    }

    public UnknownException(String message, Throwable cause) {
        super(message, cause);
    }
}
