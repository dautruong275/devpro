package com.devpro.shop.services;

import org.springframework.stereotype.Service;

import com.devpro.shop.entities.SaleOrderProducts;

@Service // Định nghĩa bean service
public class SaleOderProductService extends BaseService<SaleOrderProducts>{

	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProducts.class;
		
	}
	
}
