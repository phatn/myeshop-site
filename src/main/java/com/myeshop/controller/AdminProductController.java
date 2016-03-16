package com.myeshop.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myeshop.dao.AttributeDao;
import com.myeshop.domain.Attribute;
import com.myeshop.domain.Category;
import com.myeshop.domain.ImageFormat;
import com.myeshop.domain.ImageSize;
import com.myeshop.domain.Language;
import com.myeshop.domain.Product;
import com.myeshop.domain.ProductAttributeValue;
import com.myeshop.domain.ProductDescription;
import com.myeshop.domain.ProductImage;
import com.myeshop.domain.ProductRelationship;
import com.myeshop.service.CategoryService;
import com.myeshop.service.ProductService;
import com.myeshop.web.contants.Constant;
import com.myeshop.web.entity.AttributeForm;
import com.myeshop.web.entity.ProductForm;
import com.myeshop.web.utils.ImageResize;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {
	
	private static Logger logger = Logger.getLogger(AdminProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AttributeDao attributeDao;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/edit/{productId}", method = RequestMethod.GET)
	public String edit(Model model, @PathVariable("productId") Long productId, HttpServletRequest request) {
		Product product = productService.getById(productId);
		ProductForm productForm = toProductForm(product);
		model.addAttribute("product", productForm);
		model.addAttribute("relatedProductCount", product.getRelationships().size());
		return "editProduct";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(Model model, HttpServletRequest request) {
		ProductForm productForm = new ProductForm();
		
		Language language = (Language)request.getAttribute(Constant.LANGUAGE);
		productForm.getCategories().addAll(categoryService.getAllRootCategories(language));
		model.addAttribute("product", productForm);
		model.addAttribute("relatedProductCount", 0);
		return "createProduct";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createSubmit(@ModelAttribute("product") @Valid ProductForm form, @RequestParam("categoryIds") List<Long> categoryIds,
			BindingResult result, HttpServletRequest request, RedirectAttributes redir) {
		
		if(result.hasErrors()) {
			return "createProduct";
		}
		
		List<Category> categories = categoryService.getByIds(categoryIds);
		
		Language language = (Language)request.getAttribute(Constant.LANGUAGE);
		ProductDescription proDes = new ProductDescription();
		proDes.setLanguage(language);
		proDes.setDescription(form.getDescription());
		Product product = new Product();
		product.getDescriptions().add(proDes);
		product.getCategories().addAll(categories);
		product.setProductPrice(form.getPrice());
		
		ProductDescription prodDes = new ProductDescription();
		prodDes.setDescription(form.getDescription());
		prodDes.setLanguage(language);
		product.getDescriptions().add(prodDes);
		prodDes.setProduct(product);
		
		ProductAttributeValue attributeValue = new ProductAttributeValue();
		attributeValue.setDateCreated(new Date());
		attributeValue.setValue(form.getName());
		Attribute newAttribute = new Attribute();
		newAttribute.setName("Name");
		newAttribute.getAttributeValues().add(attributeValue);
		attributeValue.setAttribute(newAttribute);
		product.getAttributes().add(newAttribute);
		newAttribute.setProduct(product);
		
		
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		MultipartFile multipartFileImage = form.getMultipartFileImage();
		if(multipartFileImage != null && !multipartFileImage.isEmpty()) {
			long currentTime = Calendar.getInstance().getTimeInMillis();
			String originalImage = rootDirectory + Constant.PATH_IMAGE_UPLOAD + "original" + Constant.FILE_SEPERATOR + "original_" + form.getId() + "_" + currentTime + ".png";
			logger.info("Path to upload image: " + originalImage);
			
			try {
				multipartFileImage.transferTo(new File(originalImage));
				addProductImages(product, rootDirectory, originalImage, currentTime, multipartFileImage.getOriginalFilename());
				
			} catch(Exception e) {
				throw new RuntimeException("Product Image saving failed", e);
			}
		}
		
		
		
		productService.create(product);
		for(Category cat : categories) {
			cat.getProducts().add(product);
			categoryService.update(cat);
		}
		
		redir.addFlashAttribute("message", "Created " + form.getName() + " product successfully.");
		return "redirect:/admin/category/list";
		
	}
	
	@RequestMapping(value = "/attributes/{productId}", method = RequestMethod.GET)
	public String getAttributes(Model model, @PathVariable("productId") Long productId, HttpServletRequest request) {
		List<Attribute> attributes = attributeDao.getAttributesByProductId(productId);
		AttributeForm attributeForm = toAttributeForm(attributes);
		model.addAttribute("attribute", attributeForm);
		model.addAttribute("productId", productId);
		return "productAttributes";
	}
	
	private AttributeForm toAttributeForm(List<Attribute> attributes) {
		AttributeForm attributeForm = new AttributeForm();
		for(Attribute attribute : attributes) {
			attributeForm.getAttributeMap().put(attribute.getName(), attribute.getAttributeValue().getValue());
		}
		return attributeForm;
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	String editSubmit(@ModelAttribute("product") @Valid ProductForm form, 
		BindingResult result, HttpServletRequest request, RedirectAttributes redir) {
	
		if(result.hasErrors()) {
			return "editProduct";
		}
		
		Product product = productService.getById(form.getId());
		
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		MultipartFile multipartFileImage = form.getMultipartFileImage();
		if(multipartFileImage != null && !multipartFileImage.isEmpty()) {
			long currentTime = Calendar.getInstance().getTimeInMillis();
			String originalImage = rootDirectory + Constant.PATH_IMAGE_UPLOAD + "original" + Constant.FILE_SEPERATOR + "original_" + form.getId() + "_" + currentTime + ".png";
			logger.info("Path to upload image: " + originalImage);
			
			try {
				multipartFileImage.transferTo(new File(originalImage));
				addProductImages(product, rootDirectory, originalImage, currentTime, multipartFileImage.getOriginalFilename());
				
			} catch(Exception e) {
				throw new RuntimeException("Product Image saving failed", e);
			}
		}
		Language language = (Language)request.getAttribute(Constant.LANGUAGE);
		product.setNewRelease(form.getNewRelease());
		product.setFeaturedSeller(form.getFeaturedSeller());
		product.setClearance(form.getClearance());
		product.setAvailable(form.getAvailable());
		product.setProductPrice(form.getPrice());
		ProductDescription prodDes = product.getDescription(language);
		
		if(prodDes != null) {
			prodDes.setDescription(form.getDescription());
		} else {
			prodDes = new ProductDescription();
			prodDes.setDescription(form.getDescription());
			prodDes.setLanguage(language);
			product.getDescriptions().add(prodDes);
			prodDes.setProduct(product);
		}
		
		Attribute attribute = product.getAttributeByName("Name");
		if(attribute != null) {
			attribute.getAttributeValue().setValue(form.getName());
		} else {
			ProductAttributeValue attributeValue = new ProductAttributeValue();
			attributeValue.setDateCreated(new Date());
			attributeValue.setValue(form.getName());
			Attribute newAttribute = new Attribute();
			newAttribute.setName("Name");
			newAttribute.getAttributeValues().add(attributeValue);
			attributeValue.setAttribute(newAttribute);
			product.getAttributes().add(newAttribute);
			newAttribute.setProduct(product);
		}
		productService.update(product);
		
		redir.addFlashAttribute("message", "Update " + form.getName() + " product successfully.");
		return "redirect:/admin/category/list";
	}
	
	@RequestMapping(value = "/delete/{productId}", method = RequestMethod.POST)
	public String delete(@PathVariable("productId") Long productId, @RequestParam("categoryId") Long categoryId, RedirectAttributes redir) {
		productService.deleteById(productId);
		redir.addFlashAttribute("message", "Delete successfully.");
		return "redirect:/admin/category/listProducts/" + categoryId;
	}
	
	@RequestMapping(value = "/addRelatedProducts/{productId}", method = RequestMethod.POST)
	public String addRelatedProducts(@PathVariable("productId") Long productId, @RequestParam("productIds") List<Long> productIds, 
			@RequestParam("chkRemoveValues") List<Boolean> chkRemoveValues, RedirectAttributes redir) {
		
		List<Long> relatedProdAddIds = new ArrayList<Long>();
		List<Long> relatedProdRemoveIds = new ArrayList<Long>();
		
		for(int i = 0; i < productIds.size(); i++) {
			if(!chkRemoveValues.get(i)) {
				relatedProdRemoveIds.add(productIds.get(i));
			} else {
				relatedProdAddIds.add(productIds.get(i));
			}
		}
		Product product = productService.getById(productId);
		
		Iterator<ProductRelationship> it = product.getRelationships().iterator();
		while(it.hasNext()) {
			ProductRelationship item = it.next();
			for(Long id : relatedProdRemoveIds) {
				if(item.getRelatedProduct().getId().longValue() == id.longValue()) {
					it.remove();
					break;
				}
			}
		}
		
		Iterator<Long> itAdd = relatedProdAddIds.iterator();
		while(itAdd.hasNext()) {
			Long id = itAdd.next();
			for(ProductRelationship proRel : product.getRelationships()) {
				if(id.longValue() == proRel.getRelatedProduct().getId().longValue()) {
					itAdd.remove();
					break;
				}
			}
		}
		
		List<Product> prodRels = productService.getByIds(relatedProdAddIds);
		
		for(Product prod : prodRels) {
			ProductRelationship prodRel = new ProductRelationship();
			prodRel.setDateCreated(new Date());
			prodRel.setProduct(product);
			prodRel.setRelatedProduct(prod);
			
			product.getRelationships().add(prodRel);
		}
		
		productService.update(product);
		
		redir.addFlashAttribute("message", "Update related products successfully.");
		return "redirect:/admin/product/edit/" + productId;
	}
	
	private ProductForm toProductForm(Product product) {
		ProductForm form = new ProductForm();
		form.setId(product.getId());
		if(product.getAttributeName() != null && product.getAttributeName().getAttributeValue() != null) {
			form.setName(product.getAttributeName().getAttributeValue().getValue());
		}
		form.setImage(product.getSmallImage().getImage());
		form.setNewRelease(product.getNewRelease());
		form.setClearance(product.getClearance());
		form.setFeaturedSeller(product.getFeaturedSeller());
		form.setAvailable(product.isAvailable());
		form.setDescription(product.getDescription() == null ? "" : product.getDescription().getDescription());
		form.getRelationships().addAll(product.getRelationships());
		form.setPrice(product.getProductPrice());
		return form;
	}
	
	@RequestMapping(value = "/relatedProducts/{productId}", method = RequestMethod.GET)
	public String listRelatedProducts(Model model, @PathVariable("productId") Long productId) {
		List<Product> products = productService.getRelatedProductsById(productId);
		List<Product> notRelProducts = productService.getNotRelatedProductsById(productId);
		model.addAttribute("products", products);
		model.addAttribute("notRelProducts", notRelProducts);
		model.addAttribute("productId", productId);
		return "relatedProducts";
	}
	
	@RequestMapping(value = "/relatedProducts/add", method = RequestMethod.POST)
	public String addRelatedProducts(Model model, @RequestParam("productIds") List<Long> productIds) {
		
		return "relatedProducts";
	}
	
	private void addProductImages(Product product, String rootDirectory, String originalImage, long currentTime, String originalFilename) {
		
		// Generate tiny image
		String tinyImageName = "t_" + product.getId() + "_" + currentTime + ".png";
		String pathNameDestTiny = rootDirectory +  Constant.PATH_IMAGE_UPLOAD + ImageSize.TINY.toString().toLowerCase() + Constant.FILE_SEPERATOR + tinyImageName;
		ImageResize.resize(originalImage, pathNameDestTiny, ImageSize.TINY.getHeight(), ImageFormat.PNG);
		
		
		ProductImage tinyProductImage = new ProductImage();
		tinyProductImage.setImage(tinyImageName);
		tinyProductImage.setImageSize(ImageSize.TINY);
		tinyProductImage.setProduct(product);
		tinyProductImage.setName(originalFilename);
		tinyProductImage.setDateCreated(new Date());
		
		// Generate small image
		String smalImageName = "s_" + product.getId() + "_" + currentTime + ".png";
		String pathNameDestSmall = rootDirectory +  Constant.PATH_IMAGE_UPLOAD + ImageSize.SMALL.toString().toLowerCase() + Constant.FILE_SEPERATOR + smalImageName;
		
		ImageResize.resize(originalImage, pathNameDestSmall, ImageSize.SMALL.getHeight(), ImageFormat.PNG);
		ProductImage smallProductImage = new ProductImage();
		smallProductImage.setImage(smalImageName);
		smallProductImage.setImageSize(ImageSize.SMALL);
		smallProductImage.setProduct(product);
		smallProductImage.setName(originalFilename);
		smallProductImage.setDateCreated(new Date());
		
		// Generate medium image
		String mediumImageName = "m_" + product.getId() + "_" + currentTime + ".png";
		String pathNameDestMedium = rootDirectory +  Constant.PATH_IMAGE_UPLOAD + ImageSize.MEDIUM.toString().toLowerCase() + Constant.FILE_SEPERATOR + mediumImageName;
		ImageResize.resize(originalImage, pathNameDestMedium, ImageSize.MEDIUM.getHeight(), ImageFormat.PNG);
		
		
		ProductImage mediumProductImage = new ProductImage();
		mediumProductImage.setImage(mediumImageName);
		mediumProductImage.setImageSize(ImageSize.MEDIUM);
		mediumProductImage.setProduct(product);
		mediumProductImage.setName(originalFilename);
		mediumProductImage.setDateCreated(new Date());
		
		// Generate big image
		String bigImageName = "b_" + currentTime + ".png";
		String pathNameDestBig = rootDirectory +  Constant.PATH_IMAGE_UPLOAD + ImageSize.BIG.toString().toLowerCase() + Constant.FILE_SEPERATOR + bigImageName;
		ImageResize.resize(originalImage, pathNameDestBig, ImageSize.BIG.getHeight(), ImageFormat.PNG);
		
		ProductImage bigProductImage = new ProductImage();
		bigProductImage.setImage(bigImageName);
		bigProductImage.setImageSize(ImageSize.BIG);
		bigProductImage.setProduct(product);
		bigProductImage.setName(originalFilename);
		bigProductImage.setDateCreated(new Date());
		
		product.getProductImages().add(tinyProductImage);
		product.getProductImages().add(smallProductImage);
		product.getProductImages().add(mediumProductImage);
		product.getProductImages().add(bigProductImage);
		
	}
	
}
