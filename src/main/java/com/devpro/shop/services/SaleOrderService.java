package com.devpro.shop.services;

import org.springframework.stereotype.Service;

import com.devpro.shop.entities.SaleOrder;

@Service // Định nghĩa bean service
public class SaleOrderService extends BaseService<SaleOrder>{

	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
		
	}
	
}
