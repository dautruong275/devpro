package com.devpro.shop.services;

import org.springframework.stereotype.Service;

import com.devpro.shop.entities.Role;

@Service // Định nghĩa bean service
public class RolesService extends BaseService<Role>{

	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
		
	}
	
}
