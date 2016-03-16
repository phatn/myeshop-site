package com.myeshop.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.myeshop.dao.AbstractGenericDao;
import com.myeshop.dao.AttributeDao;
import com.myeshop.domain.Attribute;

/**
 *  
 * @author Phat Nguyen
 * 
 */

@Repository("attributeDao")
public class AttributeDaoImpl extends AbstractGenericDao<Attribute> implements AttributeDao {

	@Override
	public List<Attribute> getAttributesByProductId(Long productId) {
		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder
				.append("select DISTINCT a from Attribute a join fetch a.product p join fetch a.attributeValues av where p.id = :productId");
		TypedQuery<Attribute> query = getEntityManager().createQuery(queryBuilder.toString(), Attribute.class);
		query.setParameter("productId", productId);
		return query.getResultList();
	}
}
