package com.devpro.shop.controller.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop.entities.Product;
import com.devpro.shop.services.CategoriesService;
import com.devpro.shop.services.ProductService;

@Controller
public class AdminProductController2 {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoriesService categoriesService;
	/*
	 * Danh sách sản phẩm
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws IOXception
	 */
	//Dinh nghia action
	
	@RequestMapping(value = { "/admin/product/addOrUpdate2"}, method = RequestMethod.GET)
	public String viewProduct(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") Product product// Spring-form biding vơi product model
			) throws IOException {
			model.addAttribute("categories",categoriesService.findAll());	
			model.addAttribute("product", new Product()); // gửi danh sách products xuống views
			productService.saveOrUpdate(product);
		return "administrator/productAddOrUpdate2"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/product/addOrUpdate2"}, method = RequestMethod.POST)
	public String addProduct(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") Product product// Spring-form biding vơi product model
			) throws IOException {
				
		return "administrator/productAddOrUpdate2"; // -> đường dẫn tới View.
	}
	

}
