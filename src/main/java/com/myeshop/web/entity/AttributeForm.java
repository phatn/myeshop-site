package com.myeshop.web.entity;

import java.util.HashMap;
import java.util.Map;

public class AttributeForm {
	
	private Map<String, String> attributeMap = new HashMap<String, String>();

	public Map<String, String> getAttributeMap() {
		return attributeMap;
	}

	public void setAttributeMap(Map<String, String> attributeMap) {
		this.attributeMap = attributeMap;
	}
	
}
