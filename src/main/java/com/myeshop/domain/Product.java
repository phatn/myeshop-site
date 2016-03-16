package com.myeshop.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import flexjson.JSON;


/**
 * 
 * @author Phat Nguyen
 * 
 */

@Entity
@Table(name = "es_product")
public class Product implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "product_id")
	@TableGenerator(name = "table_generator", table = "es_id_gen", pkColumnName = "gen_name", valueColumnName = "gen_val", pkColumnValue = "product_id")
	@GeneratedValue(strategy = GenerationType.TABLE, generator="table_generator")
	private Long id;
	
	@Column(name = "sku")
	private String sku;
	
	@Column(name = "product_price")
	private BigDecimal productPrice;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_created")
	private Date dateCreated;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_modified")
	private Date dateModified;
	
	@Column(name = "available")
	private boolean available = true;

	@Column(name = "sort_order")
	private Integer sortOrder;
	
	@Column(name = "quantity_ordered")
	private Integer quantityOrdered;
	
	@Column(name = "review_count")
	private Integer reviewCount;
	
	@Column(name = "featured_seller")
	private Boolean featuredSeller = false;
	
	@Column(name = "new_release")
	private Boolean newRelease = false;
	
	@Column(name = "clearance")
	private Boolean clearance = false;
	
	@Column(name = "is_deleted")
	private Boolean deleted = false;
	
	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy="product")
	private Set<ProductDescription> descriptions = new HashSet<ProductDescription>();
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy="product")
	private Set<ProductImage> productImages = new HashSet<ProductImage>();
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "product")
	private Set<ProductRelationship> relationships = new HashSet<ProductRelationship>();
	
	/*@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JoinTable(name="es_product_attribute",
	joinColumns = {@JoinColumn(name="product_id")},
	inverseJoinColumns = {@JoinColumn(name = "attribute_id")})*/
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "product")
	private Set<Attribute> attributes = new HashSet<Attribute>();
	
	@ManyToMany
	@JoinTable(name="es_category_product",
	joinColumns = {@JoinColumn(name="product_id")},
	inverseJoinColumns = {@JoinColumn(name = "category_id")})
	private Set<Category> categories = new HashSet<Category>();
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product", orphanRemoval = true)
	private Set<OrderLine> orderLines = new HashSet<OrderLine>();
	
	public Set<OrderLine> getOrderLines() {
		return orderLines;
	}

	public void setOrderLines(Set<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Date getDateModified() {
		return dateModified;
	}

	public void setDateModified(Date dateModified) {
		this.dateModified = dateModified;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	
	public Integer getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
	}

	public Integer getQuantityOrdered() {
		return quantityOrdered;
	}

	public void setQuantityOrdered(Integer quantityOrdered) {
		this.quantityOrdered = quantityOrdered;
	}

	public Integer getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(Integer reviewCount) {
		this.reviewCount = reviewCount;
	}

	public String getSku() {
		return sku;
	}

	public void setSku(String sku) {
		this.sku = sku;
	}
	
	public Set<ProductDescription> getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(Set<ProductDescription> descriptions) {
		this.descriptions = descriptions;
	}

	public Set<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(Set<ProductImage> productImages) {
		this.productImages = productImages;
	}

	public Set<ProductRelationship> getRelationships() {
		return relationships;
	}

	public void setRelationships(Set<ProductRelationship> relationships) {
		this.relationships = relationships;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	public Set<Attribute> getAttributes() {
		return attributes;
	}

	public void setAttributes(Set<Attribute> attributes) {
		this.attributes = attributes;
	}

	public Set<Category> getCategories() {
		return categories;
	}

	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}


	public BigDecimal getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(BigDecimal productPrice) {
		this.productPrice = productPrice;
	}

	public Boolean getFeaturedSeller() {
		return featuredSeller;
	}

	public void setFeaturedSeller(Boolean featuredSeller) {
		this.featuredSeller = featuredSeller;
	}

	public Boolean getNewRelease() {
		return newRelease;
	}

	public void setNewRelease(Boolean newRelease) {
		this.newRelease = newRelease;
	}

	public Boolean getClearance() {
		return clearance;
	}

	public void setClearance(Boolean clearance) {
		this.clearance = clearance;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@JSON(include = false)
	public Attribute getAttribute() {
		if(getAttributes() != null) {
			Iterator<Attribute> it = getAttributes().iterator();
			return it.next();
		}
		return null;
	}
	
	public Attribute getAttributeName() {
		if(getAttributes() != null) {
			for(Attribute attribute : getAttributes()) {
				if("Name".equalsIgnoreCase(attribute.getName())) {
					return attribute;
				}
			}
		}
		return null;
	}
	
	public ProductImage getSmallImage() {
		if(getProductImages() != null) {
			for(ProductImage image : getProductImages()) {
				if(image.getImageSize() == ImageSize.SMALL) {
					return image;
				}
			}
		}
		return null;
	}
	
	@JSON(include = false)
	public List<ProductImage> getTinyImages() {
		List<ProductImage> tinyImages = new ArrayList<ProductImage>();
		if(getProductImages() != null) {
			for(ProductImage image : getProductImages()) {
				if(image.getImageSize() == ImageSize.TINY) {
					tinyImages.add(image);
				}
			}
		}
		return tinyImages;
	}
	
	@JSON(include = false)
	public List<ProductImage> getMediumImages() {
		List<ProductImage> mediumImages = new ArrayList<ProductImage>();
		if(getProductImages() != null) {
			for(ProductImage image : getProductImages()) {
				if(image.getImageSize() == ImageSize.MEDIUM) {
					mediumImages.add(image);
				}
			}
		}
		return mediumImages;
	}
	
	@JSON(include = false)
	public List<ProductImage> getBigImages() {
		List<ProductImage> bigImages = new ArrayList<ProductImage>();
		if(getProductImages() != null) {
			for(ProductImage image : getProductImages()) {
				if(image.getImageSize() == ImageSize.BIG) {
					bigImages.add(image);
				}
			}
		}
		return bigImages;
	}
	
	public ProductDescription getDescription() {
		if(descriptions != null && !descriptions.isEmpty()) {
			return descriptions.iterator().next();
		}
		return null;
	}
	
	public ProductDescription getDescription(Language language) {
		if(descriptions != null && !descriptions.isEmpty()) {
			for(ProductDescription productDescription : descriptions) {
				if(productDescription.getLanguage().equals(language)) {
					return productDescription;
				}
			}
		}
		return null;
	}
	
	public Attribute getAttributeByName(String name) {
		if(attributes != null && !attributes.isEmpty()) {
			for(Attribute att : attributes) {
				if(att.getName() != null && att.getName().equalsIgnoreCase("Name")) {
					return att;
				}
			}
		}
		return null;
	}
}
