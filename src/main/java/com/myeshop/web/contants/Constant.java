package com.myeshop.web.contants;

import java.io.File;

/**
 *  
 * @author Phat Nguyen
 * 
 */

public abstract class Constant {
	
	public static final String LANGUAGE = "language";
	
	public static final String DEFAULT_LANGUAGE = "en";
	
	public static final int PRODUCTS_PER_PAGE = 4;
	
	public static final String DELIVERY_ADDRESS = "DELIVERY_ADDRESS";
	
	public static final String FILE_SEPERATOR = File.separator; 
	
	public static final String PATH_IMAGE_UPLOAD = FILE_SEPERATOR + "resources" + FILE_SEPERATOR + "images" + FILE_SEPERATOR  + "uploads" + FILE_SEPERATOR + "products" + FILE_SEPERATOR;
	
}
