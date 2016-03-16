package com.myeshop.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myeshop.domain.Customer;
import com.myeshop.domain.Delivery;
import com.myeshop.domain.Order;
import com.myeshop.domain.OrderStatus;
import com.myeshop.scala.paypal.CheckoutUtils;
import com.myeshop.service.CustomerService;
import com.myeshop.web.contants.Constant;
import com.myeshop.web.entity.DeliveryForm;
import com.myeshop.web.entity.PaymentReview;
import com.myeshop.web.utils.UserUtils;

import scala.collection.JavaConversions;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {
	
	public enum CheckoutAddressType {
		CUSTOMER, DELIVERY
	}
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/step1", method = RequestMethod.GET)
	public String checkOutStep1(Model model) {
		model.addAttribute("delivery", new DeliveryForm());
		return "step1";
	}
	
	@RequestMapping(value = "/step1/delivery", method = RequestMethod.POST)
	public String checkOutStep2Delivery(@ModelAttribute("delivery") @Valid DeliveryForm	form, 
			BindingResult result, Model model, HttpSession session) {
		
		if(result.hasErrors()) {
			return "step1";
		}
		Customer customer = UserUtils.getLoggedInCustomer();
		customer.setDelivery(toDelivery(form));
		customerService.update(customer);
		session.setAttribute(Constant.DELIVERY_ADDRESS, "delivery");
		return "redirect:/checkout/step2";
	}
	
	@RequestMapping(value = "/step1/billing", method = RequestMethod.POST)
	public String checkOutStep2Billing(Model model, HttpSession session) {
		session.setAttribute(Constant.DELIVERY_ADDRESS, "customer");
		return "redirect:/checkout/step2";
	}
	
	@RequestMapping(value = "/step2", method = RequestMethod.GET)
	public String checkOutStep2() {
		return "step2";
	}
	
	@RequestMapping(value = "/paypal", method = RequestMethod.POST)
	public String checkPaypal(HttpSession session) {
		// Redirect to PayPal
		
		
		Order order = (Order)session.getAttribute("order");
		order.setOrderStatus(OrderStatus.DELIVERED);
		session.removeAttribute("order");
		session.removeAttribute("scopedTarget.cart");
		session.removeAttribute(Constant.DELIVERY_ADDRESS);
		return "redirect:/checkout/orderSuccess";
	}
	
	@RequestMapping(value = "/orderSuccess", method = RequestMethod.GET)
	public String checkOutSuccess() {
		return "orderSuccess";
	}
	
	private Delivery toDelivery(DeliveryForm form) {
		Delivery delivery = new Delivery();
		delivery.setFirstName(form.getFirstName());
		delivery.setLastName(form.getLastName());
		delivery.setAddress(form.getAddress());
		delivery.setPhone(form.getPhone());
		return delivery;
	}
	
	@RequestMapping(value = "/checkoutWithPaypal", method = RequestMethod.POST)
	public String checkoutWithPaypal(@RequestParam("grandTotal") BigDecimal grandTotal, Model model, HttpServletRequest request) {
		request.getSession().setAttribute("grandTotal", grandTotal);
		String url = "";
		String successPage = request.getRequestURL().toString().replaceAll(request.getServletPath(), "") + "/checkout/successPage";
		String failurePage = request.getRequestURL().toString().replaceAll(request.getServletPath(), "") + "/cart/shoppingCart";
		try {
			
			Map<String, String> result = JavaConversions.mapAsJavaMap(CheckoutUtils.startTransaction(grandTotal, successPage, failurePage));
			if(result.get("TOKEN") != null) {
				url = "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express"+ "-" + "checkout&token=" + result.get("TOKEN");
			} else {
				// Should handle error here
			}
			return "redirect:" + url;
			
		} catch(Exception ex) {
			throw new RuntimeException(CheckoutController.class + " - checkoutWithPaypal method: " + ex.getStackTrace());
		}
	}
	
	
	@RequestMapping(value = "/successPage", method = RequestMethod.GET)
//	public String successPage(HttpServletRequest request, @RequestParam(value = "token") String token, @RequestParam(value = "PayerID") String payerID, Model model, HttpSession session) {
	public String successPage(HttpServletRequest request, Model model, HttpSession session) {
		String token = (String)request.getParameter("token");
		String payerID = (String)request.getParameter("PayerID");
		Map<String, String> resultMap = JavaConversions.mapAsJavaMap(CheckoutUtils.getPaymentDetails(token, payerID));
		PaymentReview paymentReview = new PaymentReview();
		paymentReview.setFullName(resultMap.get("FIRSTNAME") + " " + resultMap.get("LASTNAME"));
		paymentReview.setEmail(resultMap.get("EMAIL"));
		paymentReview.setShipToCountryName(resultMap.get("SHIPTOCOUNTRYNAME"));
		paymentReview.setCurrencyCode(resultMap.get("CURRENCYCODE"));
		paymentReview.setAmount(resultMap.get("AMT"));
		paymentReview.setToken(token);
		paymentReview.setPayerID(payerID);
		paymentReview.setShipToStreet(resultMap.get("SHIPTOSTREET"));
		session.setAttribute("paymentReview", paymentReview);
		return "reviewPayment";
	}	
	
	
	@RequestMapping(value = "/doPayment", method = RequestMethod.POST)
	public String doPaypalPayment(HttpSession session, Model model) {
		PaymentReview paymentReview = (PaymentReview)session.getAttribute("paymentReview");
		Map<String, String> result = new HashMap<String, String>();
		try {
			result = JavaConversions.mapAsJavaMap(CheckoutUtils.doPaypalPayment(paymentReview));
			
		} catch(Exception ex) {
			throw new RuntimeException(CheckoutController.class + " - doPaypalPayment method: " + ex.getStackTrace());
		}
		
		model.addAttribute("email", paymentReview.getEmail());
		session.removeAttribute("order");
		session.removeAttribute("scopedTarget.cart");
		session.removeAttribute("paymentReview");
		return "checkoutSuccess";
	}
}
