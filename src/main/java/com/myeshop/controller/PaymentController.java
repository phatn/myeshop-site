package com.myeshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paypal.core.NVPUtil;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@RequestMapping("/success")
	public String success() {
		return "orderSuccess";
	}
}
