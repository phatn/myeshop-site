package com.myeshop.service;

import java.util.List;

import com.myeshop.domain.Category;
import com.myeshop.domain.Language;

/**
 *  
 * @author Phat Nguyen
 * 
 */

public interface CategoryService {
	
	public List<Category> getAll(Language language);
	
	public List<Category> getAllByCode(String code);
	
	public Category getByName(String name);
	
	public List<Category> getAllRootCategories(Language language);
	
	public List<Category> getAllRootCategories(String languageCode);
	
	public Category getBySefUrl(String sefUrl, Language language);
	
	public Category getById(Long categoryId, Language language);
	
	public void update(Category category);
	
	public void create(Category category);
	
	public void deleteById(Long categoryId);
	
	public List<Category> getByIds(List<Long> categoryIds);
}
