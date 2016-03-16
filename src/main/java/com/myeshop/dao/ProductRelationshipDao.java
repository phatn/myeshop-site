package com.myeshop.dao;

import java.util.List;

import com.myeshop.domain.ProductRelationship;

/**
 *  
 * @author Phat Nguyen
 * 
 */

public interface ProductRelationshipDao {

	public List<ProductRelationship> getByProductId(Long id);
	
	public List<ProductRelationship> getByProductIds(List<Long> ids);
	
	public List<ProductRelationship> getByProductIdAndRelatedProductIds(Long productId, List<Long> relatedProductIds);
	
}
