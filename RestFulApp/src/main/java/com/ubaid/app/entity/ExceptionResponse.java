package com.ubaid.app.entity;

import java.util.Date;

public class ExceptionResponse
{
	private String message;
	private String detail;
	private Date date;
	public ExceptionResponse(String message, String detail, Date date) {
		this.message = message;
		this.detail = detail;
		this.date = date;
	}
	
	public ExceptionResponse()
	{
		
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
