package com.pyeon2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CompanyController {
	
	
	@RequestMapping("company")
	public String getCompany(){
		return ".company";
	}
	
	
	@RequestMapping(value="com_stock", method=RequestMethod.GET)
	public String comStockGET() {
		return ".company.company_stock";
	}
	
	
	@RequestMapping(value="com_store", method=RequestMethod.GET)
	public String comStore() {
		return ".company.company_store";
	}
	
	
	@RequestMapping(value="com_personnel", method=RequestMethod.GET)
	public String comPersonnel() {
		return ".company.company_personnel";
	}
}
