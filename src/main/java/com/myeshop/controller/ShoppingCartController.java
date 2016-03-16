package com.myeshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myeshop.domain.Order;
import com.myeshop.domain.OrderLine;
import com.myeshop.domain.OrderStatus;
import com.myeshop.domain.Product;
import com.myeshop.service.OrderService;
import com.myeshop.service.ProductService;
import com.myeshop.web.entity.Cart;
import com.myeshop.web.entity.CartItem;
import com.myeshop.web.utils.UserUtils;

/**
 *  
 * @author Phat Nguyen
 * 
 */

@Controller
public class ShoppingCartController {

	@Autowired
	private Cart cart;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	@RequestMapping(value = "/cart/addToCart/{productId}", method = RequestMethod.POST)
	public String addToCart(@PathVariable("productId") Long productId, 
			@RequestParam(value = "quantity", required = false, defaultValue = "1") int quantity, Model model) {
		Product product = productService.getById(productId);
		cart.add(product, quantity);
		return "redirect:/cart/shoppingCart";
	}
	
	@RequestMapping(value = "/cart/clear", method = RequestMethod.GET)
	public String clear(HttpServletRequest request) {
		cart.clear();
		return "redirect:/cart/shoppingCart";
	}
	
	@RequestMapping(value = "/cart/remove/{productId}", method = RequestMethod.GET)
	public String remove(@PathVariable("productId") Long productId, HttpServletRequest request, Model model) {
		Product product = productService.getById(productId);
		cart.remove(product);
		return "redirect:/cart/shoppingCart";
	}
	
	@RequestMapping(value = "/cart/shoppingCart", method = RequestMethod.GET)
	public String shoppingCart(Model model) {
		model.addAttribute("cart", cart);
		return "shoppingCart";
	}
	
	@RequestMapping(value = "/cart/update", method = RequestMethod.POST)
	public String update(@RequestParam("productIds") List<Long> productIds, @RequestParam("quantities") List<Integer> quantities) {
		Map<Long, Integer> productIdMap = new HashMap<>();
		for(int i = 0; i < productIds.size(); i++) {
			productIdMap.put(productIds.get(i), quantities.get(i));
		}
		List<CartItem> cartItems = new ArrayList<>();
		CartItem item = null;
		List<Product> products = productService.getByIds(productIds);
		for(int i = 0; i < productIds.size(); i++) {
			item = new CartItem(productIdMap.get(products.get(i).getId()), products.get(i));
			cartItems.add(item);
		}
		cart.update(cartItems);
		return "redirect:/cart/shoppingCart";
	}
	
	@RequestMapping(value = "/customer/checkout", method = RequestMethod.POST)
	public String checkout(HttpSession session) {
		createOrder(cart, session);
		return "redirect:/checkout/step1";
	}
	
	private void createOrder(Cart cart, HttpSession session) {
		
		Order order = new Order();
		order.setCustomer(UserUtils.getLoggedInCustomer());
		
		Set<OrderLine> orderLines = new HashSet<OrderLine>();
		List<CartItem> cartItems = cart.getCartItems();
		for(CartItem item : cartItems) {
			OrderLine orderLine = new OrderLine();
			orderLine.setProduct(item.getProduct());
			orderLine.setQuantity(item.getQuantity());
			orderLine.setOrder(order);
			orderLines.add(orderLine);
		}
		order.setOrderLines(orderLines);
		order.setOrderStatus(OrderStatus.PENDING);
		order.setGrandTotal(cart.getGrandTotal());
		orderService.create(order);
		session.setAttribute("order", order);
	}
}
