package com.devpro.shop.controller.administrator;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop.dto.ProductSearchModel;
import com.devpro.shop.entities.Product;
import com.devpro.shop.services.CategoriesService;
import com.devpro.shop.services.ProductService;
import com.devpro.shop.controller.BaseController;

@Controller
public class AdminProductController extends BaseController{
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
	
	@RequestMapping(value = { "/admin/product/list","/admin/list-product"}, method = RequestMethod.GET)

	public String adminProductList(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") Product product) throws IOException {
		// code cũ là lấy tất cả sản phẩm
				List<Product> products = productService.findAll();

				// gửi danh sách products xuống views
				model.addAttribute("products", products);
				
				// code mới dùng phân trang
				
				ProductSearchModel searchModel = new ProductSearchModel();
				searchModel.keyword = request.getParameter("keyword");
				searchModel.setPage(getCurrentPage(request));
				searchModel.categoryId = super.getInteger(request, "categoryId");// request.getParameter("categoryId");
				
//				searchModel.page = getCurrentPage(request);
				model.addAttribute("productsWithPaging", productService.search(searchModel));
				model.addAttribute("searchModel", searchModel);
				
				// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
				// để tìm các views
				// /WEB-INF/views/user/index.jsp
				return "administrator/productList"; // -> đường dẫn tới View.
	}
	
	/*
	 *Them sản phẩm moi
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws IOXception
	 */
	//Dinh nghia action
	@RequestMapping(value = { "/admin/product/addOrUpdate"}, method = RequestMethod.GET)
	public String adminProductAddOrUpdate(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		model.addAttribute("categories",categoriesService.findAll());	
		model.addAttribute("product", new Product()); // gửi danh sách products xuống views
		return "administrator/productAddOrUpdate"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/product/addOrUpdate"}, method = RequestMethod.POST)
	public String addProduct(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("product") Product product, // Spring-form biding vơi product model
			@RequestParam("productAvatar") MultipartFile productAvatar, // hứng file đẩy lên
			@RequestParam("productPictures") MultipartFile[] productPictures // hứng file đẩy lên
			) throws IOException {
				// cần kiểm tra xem id của product
				// = null || = 0 thì thêm mới
				// ngược lại là chỉnh sửa
			if(product.getId() == null || product.getId() <= 0) { // thêm mới
				productService.add(product, productAvatar, productPictures);
			} else { //chỉnh sửa
				productService.update(product, productAvatar, productPictures);
			
					}
		return "administrator/productAddOrUpdate"; // -> đường dẫn tới View.
	}
	
	@RequestMapping(value = { "/admin/productedit/{productId}"}, method = RequestMethod.GET)
	public String EditProductAddOrUpdate(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId) throws IOException {		
		model.addAttribute("categories",categoriesService.findAll());
		Product product = productService.getById(productId);
		model.addAttribute("product", product);//gửi danh sách products xuống views
		return "administrator/productAddOrUpdate"; // -> đường dẫn tới View.
	}
	

}
