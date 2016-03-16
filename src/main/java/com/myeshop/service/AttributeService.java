package com.myeshop.service;

import java.util.List;

import com.myeshop.domain.Attribute;

public interface AttributeService {
	
	public List<Attribute> getAttributesByProductId(Long productId);
}
