package com.myeshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.myeshop.dao.AttributeDao;
import com.myeshop.domain.Attribute;
import com.myeshop.service.AttributeService;
import com.myeshop.service.TransactionalAspectAwareService;

public class AttributeServiceImpl implements AttributeService, TransactionalAspectAwareService {

	@Autowired
	private AttributeDao attributeDao;
	
	@Override
	public List<Attribute> getAttributesByProductId(Long productId) {
		return attributeDao.getAttributesByProductId(productId);
	}
	
}
