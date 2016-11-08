package com.pyeon2.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pyeon2.dao.MemberDAO;

@Controller
public class LoginController {

	@Autowired
	private MemberDAO memberDAO;

	@RequestMapping(value="login", method = RequestMethod.GET)
	public String login() {

		return "login/login";
	}
	
	@RequestMapping(value="choice", method = RequestMethod.GET)
	public String choice(HttpServletRequest request) {
		
		return "login/choice";
	}
	
	@RequestMapping(value="admin", method = RequestMethod.GET)
	public String admin() {
		
		return "login/admin";
	}
	
	@RequestMapping(value="manager", method = RequestMethod.GET)
	public String manager() {
		
		return "login/manager";
	}
}
