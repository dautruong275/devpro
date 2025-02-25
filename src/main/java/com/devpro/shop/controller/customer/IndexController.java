package com.devpro.shop.controller.customer;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop.services.CategoriesService;
import com.devpro.shop.services.ProductService;
import com.devpro.shop.controller.BaseController;
import com.devpro.shop.dto.CategorySearchModel;
import com.devpro.shop.dto.ProductSearchModel;
import com.devpro.shop.entities.Categories;
import com.devpro.shop.entities.Product;
import com.devpro.shop.services.PagerData;

@Controller // Đây là Bean tạo Controller 
public class IndexController extends BaseController {
	@Autowired 
	private CategoriesService categoryService;
	@Autowired
	private ProductService productService;
//		public String home(final Model model,
//							final HttpServletRequest request,
//							final HttpServletResponse response) throws IOException{
//			//,@PathVariable("seo") String seo
//			String name = request.getParameter("name");
//			String age = request.getParameter("age");
//			System.out.println("Name" + name + "Age " + age);
//			//System.out.println("Seo: " +seo);
//			//
//			return "customer/seo"; // Đường dẫn tới view
//		}
		@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
		public String home(	final Model model, 
							final HttpServletRequest request, 
							final HttpServletResponse response)throws IOException {
//			model.addAttribute("totalItems", 100);
//			model.addAttribute("itemsOnPage", 10);
			model.addAttribute("productsData", productService.search(null));
			return "customer/index"; 
		}
		
		// định nghĩa action
		@RequestMapping(value = { "/details/{seo}" }, method = RequestMethod.GET)
		public String details(	final Model model, final HttpServletRequest request, 
								final HttpServletResponse response, 
								@PathVariable("seo") String seo) throws IOException {
			
			ProductSearchModel productSearchModel = new ProductSearchModel();
			productSearchModel.seo = seo;
			PagerData<Product> pagerData = productService.search(productSearchModel);
			Product product = pagerData.getData().get(0);
			model.addAttribute("product", product);
			return "customer/details"; 
		}
		
		@RequestMapping(value = { "/category/{seo}" }, method = RequestMethod.GET)
		public String category(	final Model model, 
								final HttpServletRequest request,
								final HttpServletResponse response,
								@PathVariable("seo") String seo) throws IOException {
							CategorySearchModel categorySearchModel = new CategorySearchModel();
							categorySearchModel.setSeo(seo);
							Categories categories = categoryService.search(categorySearchModel).getData().get(0);
							model.addAttribute("CurrentCategory", categories);
							
							ProductSearchModel productSearchModel = new ProductSearchModel();
							productSearchModel.categoryId = categories.getId();
							model.addAttribute("productsData", productService.search(productSearchModel));
		
			return "customer/categories"; 
		}

		
}
