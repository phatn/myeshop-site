package com.myeshop.dao;

import java.util.List;

import com.myeshop.domain.Attribute;

/**
 *  
 * @author Phat Nguyen
 * 
 */

public interface AttributeDao {

	public List<Attribute> getAttributesByProductId(Long productId);
}
