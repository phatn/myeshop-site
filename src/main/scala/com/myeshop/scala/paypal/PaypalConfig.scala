package com.myeshop.scala.paypal

object PaypalConfig {
  
  val API_USERNAME = "phatnguyen-facilitator_api1.outlook.com"
  
  val API_PASSWORD = "6UKS472CEVMUNRG4"
  
  val API_SIGNATURE = "AFcWxV21C7fd0v3bYYYRCpSSRl31AvM53e7i6m01cKDSel.YKhOuhN.F"
  
  val API_METHOD_SET_EXPRESS_CHECKOUT = "SetExpressCheckout"
  
  val API_METHOD_GET_EXPRESS_CHECKOUT = "GetExpressCheckout"
  
  val API_METHOD_DO_EXPRESS_CHECKOUT_PAYMENT = "DoExpressCheckoutPayment"
  
  val API_METHOD_GET_EXPRESS_CHECKOUT_DETAILS = "GetExpressCheckoutDetails"
  
  val API_SET_EXPRESS_CHECKOUT_VERISON = "109.0"
  
  val API_GET_EXPRESS_CHECKOUT_DETAILS_VERISON = "104.0" 
  
  val API_DO_EXPRESS_CHECKOUT_VERISON = "104.0"
  
  val API_ENDPOINT = "https://api-3t.sandbox.paypal.com/nvp"
  
  val PAYMENT_AMOUNT = "PAYMENTREQUEST_0_AMT"
  
  val PAYMENT_CURRENCY_CODE = "PAYMENTREQUEST_0_CURRENCYCODE"
  
  val RETURN_URL = "RETURNURL"
  
  val CANCEL_URL = "CANCELURL"
  
  val PAYMENT_ACTION = "PAYMENTREQUEST_0_PAYMENTACTION"
  
  val PAYMENT_ACTION_VALUE = "Sale"
  
  val PAYMENT_CURRENCY_CODE_VALUE = "SGD"
  
}