package com.myeshop.web.entity;

public class PaymentReview {
	
	private String fullName = "";
	
	private String email = "";
	
	private String shipToCountryName = "";
	
	private String amount = "";
	
	private String currencyCode = "";
	
	private String token = "";
	
	private String payerID = "";
	
	private String shipToStreet = "";

	public String getShipToStreet() {
		return shipToStreet;
	}

	public void setShipToStreet(String shipToStreet) {
		this.shipToStreet = shipToStreet;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getPayerID() {
		return payerID;
	}

	public void setPayerID(String payerID) {
		this.payerID = payerID;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getShipToCountryName() {
		return shipToCountryName;
	}

	public void setShipToCountryName(String shipToCountryName) {
		this.shipToCountryName = shipToCountryName;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}
	
}
