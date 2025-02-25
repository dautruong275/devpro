package com.devpro.shop.compoments;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.devpro.shop.entities.Categories;
import com.devpro.shop.entities.Product;
import com.devpro.shop.services.CategoriesService;
@Component
public class ApplicationStartup implements ApplicationListener<ApplicationReadyEvent>{
	@Autowired
	private CategoriesService categoriesService;
	
	@Override
	public void onApplicationEvent(final ApplicationReadyEvent event) {
		this.seedCategory();
		
	}
	
	public void seedCategory() {
		Categories cateJava = categoriesService.getByTransactQuerySQL("Select * FROM tbl_category WHERE Name = 'java'");
		
		if(cateJava == null) {
			cateJava = new Categories();
			cateJava.setName("java1");
			cateJava.setDescription("java");
			cateJava.setCreatedDate(new Date());
			// Them dah sach san pham cho java
//			Set<Products> products = new HashSet<Products>();
			for(int i = 0; i < 10; i++) {
				Product p =  new Product();
				p.setTitle("java Titel " + i);
				p.setShortDes("ShortDescription " + i);
				p.setDetails("Details " + i);
				p.setPrice(new BigDecimal("1000"));
				p.setCreatedDate(new Date());
				cateJava.addProduct(p);
			}
		}
		else {
			cateJava.setCreatedDate(new Date());
		}
		
		categoriesService.saveOrUpdate(cateJava);
	
	}

}
