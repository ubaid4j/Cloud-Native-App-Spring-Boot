package com.ubaid.ms.module.ccexception;

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
