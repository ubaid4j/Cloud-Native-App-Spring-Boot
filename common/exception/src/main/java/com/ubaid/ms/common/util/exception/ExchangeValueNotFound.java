package com.ubaid.ms.common.util.exception;

public class ExchangeValueNotFound extends CCException{

    public ExchangeValueNotFound(Throwable cause) {
        super(cause);
    }

    public ExchangeValueNotFound(String message, Throwable cause) {
        super(message, cause);
    }

    public ExchangeValueNotFound(String message) {
        super(message);
    }

    public ExchangeValueNotFound() {
    }
}
