package com.devpro.shop.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop.dto.ContactModel;
import com.devpro.shop.entities.Contact;
import com.devpro.shop.services.ContactService;

@Controller // La 1 bean
public class ContactController {
	@Autowired 
	private ContactService contactService;
	@RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
	public String get_Contact(final Model model, 
						final HttpServletRequest request,
						final HttpServletResponse response) throws IOException{
		ContactModel contactModel = new ContactModel();
		contactModel.setThongBao("Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you with  a matter of hours to help you2");
		model.addAttribute("contact", new Contact());
		return "customer/contact";
	}
	@RequestMapping(value = {"/contact"}, method = RequestMethod.POST)
	public String post_CSontact(final Model model, 
						final HttpServletRequest request,
						final HttpServletResponse response,
						@ModelAttribute("contact") Contact contact) 
								throws IOException{
//		ContactModel contactModel = new ContactModel();
//		contactModel.setThongBao("Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you with  a matter of hours to help you1");
//		model.addAttribute("contactModel", contactModel);
//		
		contactService.saveOrUpdate(contact);
	//	model.addAttribute("DulieuBanNhapLa", contactModel.getEmail() + contactModel.getName());
		return "customer/contact";
	}
	@RequestMapping(value = {"/ajax/contact"}, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model, 
						final HttpServletRequest request,
						final HttpServletResponse response,
						final @RequestBody ContactModel contactModel) throws IOException{
		System.out.println("ContactModel" + contactModel.getEmail());
		Map<String, Object> jsonResult= new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", contactModel);
		return ResponseEntity.ok(jsonResult);
	}				
	
}