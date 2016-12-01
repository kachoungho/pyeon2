package com.pyeon2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pyeon2.service.CompanyService;
import com.pyeon2.vo.ItemVO;


@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService companyService;	
	
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
	
	
	@RequestMapping(value="orderApproval", method=RequestMethod.GET)
	public ModelAndView orderApprovalGET(Model model){
		System.out.println("orderApproval GET 요청 성공");
		ModelAndView mav = new ModelAndView();
		List<ItemVO> list;
		try {
			list = companyService.orderList();
			mav.addObject("orderList", list);
			mav.setViewName(".company.orderApproval");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	@RequestMapping(value="orderApproval", method=RequestMethod.POST)
	public ModelAndView orderApprovalPOST(HttpServletRequest request, Model model){
		System.out.println("orderApproval POST 요청 성공");
		ModelAndView mav = new ModelAndView();
		List<ItemVO> list;
		ItemVO vo = new ItemVO();
		
		vo.setItem_code(request.getParameter("item_code"));
		vo.setCount(Integer.parseInt(request.getParameter("count")));
		vo.setArea(request.getParameter("area"));
		
		try {
			companyService.updateItemCount(vo);
			companyService.odertDelete(vo);
			mav.setViewName(".company.orderApprovalsuc");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	@RequestMapping(value="orderCancel", method=RequestMethod.GET)
	public ModelAndView orderCancelGET(HttpServletRequest request){
		System.out.println("orderCancel GET 요청 성공");
		ModelAndView mav = new ModelAndView();
		
		ItemVO vo = new ItemVO();
		
		vo.setItem_code(request.getParameter("item_code"));
		vo.setArea(request.getParameter("area"));
		try {
			companyService.odertDelete(vo);
			mav.setViewName(".company.orderCancelSuc");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
