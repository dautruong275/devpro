package com.devpro.shop.services;

import org.springframework.stereotype.Service;
import com.devpro.shop.entities.Contact;

@Service // Định nghĩa bean service
public class ContactService extends BaseService<Contact>{

	@Override
	protected Class<Contact> clazz() {
		// TODO Auto-generated method stub
		return Contact.class;
		
	}
	
}
