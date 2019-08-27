package com.ubaid.app.exception.handler;

import java.util.Date;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.ubaid.app.entity.ExceptionResponse;
import com.ubaid.app.exception.UserNotFoundException;

@RestController
@ControllerAdvice
public class ExceptionHandlerCust extends ResponseEntityExceptionHandler
{
	
	@ExceptionHandler(value = Exception.class)
	public final ResponseEntity<Object> handleAllException(Exception ex, WebRequest request) throws Exception
	{
		ExceptionResponse response = new ExceptionResponse(ex.getMessage(), "Detail will be shared later", new Date());
		return new ResponseEntity<Object>(response, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@ExceptionHandler(value = UserNotFoundException.class)
	public final ResponseEntity<Object> handleUserNotFound(Exception exp, WebRequest req)
	{
		ExceptionResponse response = new ExceptionResponse(exp.getMessage(), req.getDescription(false), new Date());
		return new ResponseEntity<Object>(response, HttpStatus.NOT_FOUND);
	}

	@Override
	protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex,
			HttpHeaders headers, HttpStatus status, WebRequest request)
	{
		ExceptionResponse response = new ExceptionResponse(ex.getMessage(), ex.getBindingResult().toString(), new Date());
		return new ResponseEntity<Object>(response, status);
	}
	
	
}
