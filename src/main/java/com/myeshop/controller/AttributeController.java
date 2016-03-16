package com.myeshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myeshop.domain.Attribute;
import com.myeshop.domain.Product;
import com.myeshop.domain.ProductAttributeValue;
import com.myeshop.service.ProductService;

@Controller
@RequestMapping("/admin/product/attribute")
public class AttributeController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String updateAttribute(@RequestParam("attributes") List<String> attributes, @RequestParam("attributeValues") List<String> attributeValues,
			@RequestParam("productId") Long productId, HttpServletRequest request, RedirectAttributes redir) {

		Product product = productService.getById(productId);
		/*for(Attribute attribute : product.getAttributes()) {
			attribute.getAttributeValues().clear();
		}*/
		product.getAttributes().clear();
		
		
		for(int i = 0; i < attributes.size(); i++) { 
			Attribute attribute = new Attribute();
			attribute.setName(attributes.get(i));
			ProductAttributeValue attributeValue = new ProductAttributeValue();
			attributeValue.setValue(attributeValues.get(i));
			attributeValue.setAttribute(attribute);
			attribute.getAttributeValues().add(attributeValue);
			product.getAttributes().add(attribute);
			attribute.setProduct(product);
		}
		
		productService.update(product);
		
		return "redirect:/admin/product/edit/" + productId;
	}
}
