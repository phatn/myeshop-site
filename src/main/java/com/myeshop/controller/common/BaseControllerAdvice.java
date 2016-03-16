package com.myeshop.controller.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.myeshop.domain.Language;
import com.myeshop.service.CategoryService;
import com.myeshop.web.contants.Constant;

@ControllerAdvice(basePackages={"com.myeshop.controller"})
public class BaseControllerAdvice {
	
	@Autowired
	private CategoryService categoryService;
	
	@ModelAttribute
    public void globalAttributes(Model model, HttpServletRequest request) {
		Language language = (Language)request.getAttribute(Constant.LANGUAGE);
		model.addAttribute("categories", categoryService.getAllRootCategories(language));
    }
}
