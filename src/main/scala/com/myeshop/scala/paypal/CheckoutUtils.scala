package com.myeshop.scala.paypal

import java.io.BufferedReader
import java.io.InputStreamReader
import java.io.OutputStreamWriter
import java.io.UnsupportedEncodingException
import java.math.BigDecimal
import java.net.URL
import java.net.URLConnection
import java.net.URLDecoder
import java.net.URLEncoder
import com.myeshop.web.entity.PaymentReview


object CheckoutUtils {
  
  val UTF8: String = "UTF-8"
  
  val EQUAL: String = "=";
	
	val AMPERSAND: String = "&";
  
   /* Post data to an end point */
  def postData(data: String) : Map[String, String] = {
    var outputStreamWriter: OutputStreamWriter = null
    var bufferedReader: BufferedReader = null
    var resultString: String = ""
    
    try {
      // Send the request
      var url: URL = new URL(PaypalConfig.API_ENDPOINT)
      var connection: URLConnection = url.openConnection();
      connection.setDoOutput(true)
      outputStreamWriter = new OutputStreamWriter(connection.getOutputStream, UTF8) 
      outputStreamWriter.write(data)
      outputStreamWriter.flush()
      
      // Get the response
      bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream))
      resultString = bufferedReader.readLine()
    } catch {
      case e: Exception => {
        throw new RuntimeException(CheckoutUtils.getClass +  " - Error to post data to " + PaypalConfig.API_ENDPOINT + ": " + e.getStackTrace)
      }
    } finally {
      outputStreamWriter.close()
      bufferedReader.close()
    }
    return deformatNVP(resultString);
  } 
  
  final def startTransaction(grandTotal: BigDecimal, successPage: String, failurePage: String): Map[String, String] = {
    var data: StringBuilder = new StringBuilder()
    data.append(URLEncoder.encode("USER", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_USERNAME, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("PWD", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_PASSWORD, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("SIGNATURE", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_SIGNATURE, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("METHOD", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_METHOD_SET_EXPRESS_CHECKOUT, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("RETURNURL", UTF8)).append(EQUAL).append(URLEncoder.encode(successPage, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("CANCELURL", UTF8)).append(EQUAL).append(URLEncoder.encode(failurePage, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("VERSION", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_SET_EXPRESS_CHECKOUT_VERISON, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode(PaypalConfig.PAYMENT_AMOUNT, UTF8)).append(EQUAL).append(URLEncoder.encode(grandTotal.toString(), UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode(PaypalConfig.PAYMENT_CURRENCY_CODE, UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.PAYMENT_CURRENCY_CODE_VALUE, UTF8));
    return postData(data.toString());
  }
  
  
  final def getPaymentDetails(token: String, payerID: String): Map[String, String] = {
    
    var data: StringBuilder = new StringBuilder()
    data.append(URLEncoder.encode("USER", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_USERNAME, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("PWD", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_PASSWORD, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("SIGNATURE", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_SIGNATURE, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("METHOD", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_METHOD_GET_EXPRESS_CHECKOUT_DETAILS, UTF8));
		
		data.append(AMPERSAND).append(URLEncoder.encode("TOKEN", UTF8)).append(EQUAL).append(URLEncoder.encode(token, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("VERSION", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_GET_EXPRESS_CHECKOUT_DETAILS_VERISON, UTF8));
		
		return postData(data.toString());
  }
  
  
  final def doPaypalPayment(paymentReview: PaymentReview): Map[String, String] = {
    
    var data: StringBuilder = new StringBuilder()
    
    data.append(URLEncoder.encode("USER", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_USERNAME, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("PWD", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_PASSWORD, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("SIGNATURE", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_SIGNATURE, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("METHOD", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_METHOD_DO_EXPRESS_CHECKOUT_PAYMENT, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("PAYERID", UTF8)).append(EQUAL).append(URLEncoder.encode(paymentReview.getPayerID(), UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode(PaypalConfig.PAYMENT_ACTION, UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.PAYMENT_ACTION_VALUE, UTF8));
		
		data.append(AMPERSAND).append(URLEncoder.encode("TOKEN", UTF8)).append(EQUAL).append(URLEncoder.encode(paymentReview.getToken(), UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode(PaypalConfig.PAYMENT_AMOUNT, UTF8)).append(EQUAL).append(URLEncoder.encode(paymentReview.getAmount(), UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode(PaypalConfig.PAYMENT_CURRENCY_CODE, UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.PAYMENT_CURRENCY_CODE_VALUE, UTF8));
		data.append(AMPERSAND).append(URLEncoder.encode("VERSION", UTF8)).append(EQUAL).append(URLEncoder.encode(PaypalConfig.API_DO_EXPRESS_CHECKOUT_VERISON, UTF8));
    
    return postData(data.toString());
  }
  
  /* Extract Name-Value Pair to a map */
  final def deformatNVP(nvpData: String): Map[String, String] = {
    var resultMap: Map[String, String] = Map()
    
    if(nvpData == null && nvpData.isEmpty())
      return resultMap
      
    var tokens: Array[String] = nvpData.split("&")
    for(token <- tokens) {
      var subTokens: Array[String] = token.split("=")
      try {
        resultMap += (URLDecoder.decode(subTokens(0), UTF8)  -> URLDecoder.decode(subTokens(1), UTF8))
      } catch {
        case e: UnsupportedEncodingException => {
          throw new RuntimeException(CheckoutUtils.getClass +  " - Unsuported encoding for " + UTF8 + ": " + e.getStackTrace)
        }
      }
    }
    return resultMap
  }
  
}