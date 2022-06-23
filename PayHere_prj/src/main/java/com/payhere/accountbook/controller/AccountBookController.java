package com.payhere.accountbook.controller;



import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/account")
@Log4j
public class AccountBookController {
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value="/List")
	public String List() {
		
		return "account/List";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value="/Details")
	public String Details() {
		
		return "account/Details";
	}
	@PreAuthorize("isAuthenticated()")
	@GetMapping(value="/DeletedList")
	public String DeletedList() {
		
		return "account/DeletedList";
	}
	
	

}
