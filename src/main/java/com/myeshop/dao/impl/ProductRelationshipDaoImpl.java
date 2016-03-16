package com.myeshop.dao.impl;

import java.util.Collections;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.myeshop.dao.AbstractGenericDao;
import com.myeshop.dao.ProductRelationshipDao;
import com.myeshop.domain.ImageSize;
import com.myeshop.domain.ProductRelationship;

/**
 *  
 * @author Phat Nguyen
 * 
 */

@Repository("productRelationshipDao")
public class ProductRelationshipDaoImpl extends AbstractGenericDao<ProductRelationship> implements
		ProductRelationshipDao {

	@Override
	public List<ProductRelationship> getByProductId(Long id) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select pr from ProductRelationship pr join pr.product p ")
		.append("join fetch pr.relatedProduct rp join fetch rp.productImages pi join fetch rp.attributes a join fetch ")
		.append("a.attributeValues av where pi.imageSize =:imageSize and a.name = :name and p.id = :id");
		TypedQuery<ProductRelationship> query = getEntityManager().createQuery(
				queryBuilder.toString(), ProductRelationship.class);
		
		query.setParameter("imageSize", ImageSize.SMALL);
		query.setParameter("name", "Name");
		query.setParameter("id", id);
		return query.getResultList();
	}

	@Override
	public List<ProductRelationship> getByProductIds(List<Long> ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductRelationship> getByProductIdAndRelatedProductIds(Long productId, List<Long> relatedProductIds) {
		if(productId == null || relatedProductIds == null || relatedProductIds.isEmpty()) {
			return Collections.emptyList();
		}
		
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select pr from ProductRelationship pr where pr.relatedProduct.id IN :relatedProductId");
		TypedQuery<ProductRelationship> query = getEntityManager().createQuery(
				queryBuilder.toString(), ProductRelationship.class);
		
		//query.setParameter("productId", productId);
		query.setParameter("relatedProductId", relatedProductIds);
		return query.getResultList();
	}

}
