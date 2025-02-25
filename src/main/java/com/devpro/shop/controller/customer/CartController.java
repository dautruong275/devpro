package com.devpro.shop.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop.controller.BaseController;
import com.devpro.shop.dto.Cart;
import com.devpro.shop.dto.CartItem;
import com.devpro.shop.entities.Product;
import com.devpro.shop.entities.SaleOrder;
import com.devpro.shop.services.ProductService;
import com.devpro.shop.entities.SaleOrderProducts;
import com.devpro.shop.services.SaleOrderService;

@Controller
public class CartController extends BaseController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private SaleOrderService saleOrderService;
	
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}
	private void calculateTotalPrice(final HttpServletRequest request) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		BigDecimal total = BigDecimal.ZERO;
		
		for(CartItem ci : cartItems) {
			total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
		}

		cart.setTotalPrice(total);
	}
	
	@RequestMapping(value = {"/ajax/addToCart"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, 
						final HttpServletRequest request,
						final HttpServletResponse response,
						final @RequestBody CartItem cartItem) throws IOException{
			HttpSession session = request.getSession();
			//Lay thong tin gio hang 
			Cart cart = null;
			if(session.getAttribute("cart") != null) {
				cart = (Cart) session.getAttribute("cart");
			} else {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			
			//Lay ds sp co trong gio hang
			List<CartItem> cartItems = cart.getCartItems();
			boolean isExists = false;
			for (CartItem item : cartItems) {
				if(item.getProductId() == cartItem.getProductId()) {
					isExists = true;
					item.setQuanlity(item.getQuanlity()+ cartItem.getQuanlity());
				}
			}	
				// neu sp chua co trong gio hang
			if (!isExists) {
				Product productInDb = productService.getById(cartItem.getProductId());
				cartItem.setProductName(productInDb.getTitle());
				cartItem.setPriceUnit(productInDb.getPrice());
				cart.getCartItems().add(cartItem);
			}
			this.calculateTotalPrice(request);
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			jsonResult.put("code", 200);
			jsonResult.put("status", "TC");
			jsonResult.put("totalItems", getTotalItems(request));
			session.setAttribute("totalItems", getTotalItems(request));
			
			return ResponseEntity.ok(jsonResult);
	}		
	
	@RequestMapping(value = { "/cart/view" }, method = RequestMethod.GET)
	public String cartView(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response)
			throws IOException {
		return "customer/cart"; // -> đường dẫn tới View.
	}
	
	
	@RequestMapping(value = {"/cart/checkout"}, method = RequestMethod.POST )
	public String cartCheckOut(final Model model,
							final  HttpServletRequest request,
							final HttpServletResponse response )throws Exception {
		// Lay thong tin khach hang 
		String customerFullName = request.getParameter("customerFullName");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerAddress = request.getParameter("ccustomerAddress");
		
		// Toa hoa don
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerFullName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerPhone(customerPhone);
		saleOrder.setCustomerAddress(customerAddress);
		
		//Ma hoa don
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
		
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());

			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}

		// lưu vào cơ sở dữ liệu
		saleOrderService.saveOrUpdate(saleOrder);

		// xóa dữ liệu giỏ hàng trong session
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", "0");
		return "redirect:/index";	
	}
	

}
