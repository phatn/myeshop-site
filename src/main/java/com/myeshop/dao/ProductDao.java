package com.myeshop.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.myeshop.domain.Category;
import com.myeshop.domain.Product;

/**
 *  
 * @author Phat Nguyen
 * 
 */

public interface ProductDao {
	
	public Map<String, Object> getProductsByCategory(Category category, int start, int limit);
	
	public List<Product> getProductsByCategories(Set<Long> categoryIds);
	
	public List<Product> getAllProducts();
	
	public List<Product> getFeaturedProducts();
	
	public List<Product> getClearanceProducts();
	
	public List<Product> getNewReleaseProducts();
	
	public Product getById(Long id);
	
	public Product getSpecById(Long id);
	
	public Product getBySefUrl(String sefUrl);
	
	public List<Product> getByIds(List<Long> productIds);
	
	public List<Product> getProductsByCategoryId(Long categoryId);
	
	public void deleteById(Long productId);
	
	public void update(Product product);
	
	public List<Product> getRelatedProductsById(long productId);
	
	public List<Product> getNotRelatedProductsById(long productId);
	
	public void create(Product product);
	
}
