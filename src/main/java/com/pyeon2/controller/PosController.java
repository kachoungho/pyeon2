package com.pyeon2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pyeon2.service.PosService;
import com.pyeon2.vo.ItemVO;

@Controller
/*@RequestMapping(value="/pos/")*/
public class PosController {

	@Autowired
	private PosService posService;
	
	/*@Autowired
	public UserService userService;*/

	@RequestMapping("pos")
	public String getCompany() {
		return ".pos";
	}

	@RequestMapping(value = "pos/ps_order", method = RequestMethod.GET)
	public ModelAndView orderGET(Model model) {
		System.out.println("order GET 요청 성공");

		ModelAndView mav = new ModelAndView();

		mav.setViewName(".pos.pos_order");

		return mav;
	}

	@RequestMapping(value = "pos/ps_order", method = RequestMethod.POST)
	public ModelAndView orderPOST(ItemVO vo, Model model) throws Exception {
		System.out.println("order POST 요청 성공");

		ModelAndView mav = new ModelAndView();

		posService.insertOrder(vo);

		mav.setViewName(".pos.pos_ordersuc");

		return mav;
	}

	@RequestMapping(value = "pos/ps_stock", method = RequestMethod.GET)
	public String posStock() {
		return ".pos.pos_stock";
	}

	@RequestMapping(value = "pos/ps_sales", method = RequestMethod.GET)
	public String posSales() {
		return ".pos.pos_sales";
	}

	@RequestMapping(value = "pos/ps_go_leave", method = RequestMethod.GET)
	public String posGo_leave() {
		return ".pos.pos_go_leave";
	}

	@RequestMapping(value = "pos/ps_calc", method = RequestMethod.GET)
	public String posCalc() {
		return ".pos.pos_calc";
	}

	@RequestMapping("pos/ps_item_selectAll")
	public ModelAndView productList() {
		ModelAndView mav = new ModelAndView();

		List<ItemVO> list;
		try {
			list = posService.getList();
			mav.addObject("result", list);
			mav.setViewName(".pos.pos_item_selectAll");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value="pos/ps_item_delete", method = RequestMethod.POST)
	public ModelAndView Delete(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setItem_code(request.getParameter("item_code"));
		vo.setArea(request.getParameter("area"));

		posService.Delete(vo);

		mav.setViewName(".pos");
		return mav;
	}

	@RequestMapping(value="pos/ps_item_delete", method = RequestMethod.GET)
	public ModelAndView fom() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(".pos.pos_item_delete");

		return mav;
	}

	@RequestMapping(value="pos/ps_item_select", method = RequestMethod.POST)
	public ModelAndView selectName(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setItem_name(request.getParameter("item_name"));

		List<ItemVO> list = posService.selectName(vo);

		mav.addObject("result", list);
		mav.setViewName(".pos.pos_item_selectAll");

		return mav;
	}

	@RequestMapping(value="pos/ps_item_select", method = RequestMethod.GET)
	public ModelAndView selectform() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(".pos.pos_item_select");

		return mav;
	}
	
	
/*
	@RequestMapping(value = "usermoneytotal" , method = RequestMethod.GET)
	public ModelAndView usertotal(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		UserVO vo = new UserVO();
		MemberVO Mvo = new MemberVO();
		String id = request.getParameter("id");
		System.out.println("id : " + id);
		vo.setUserid(id);
		
		Mvo = userService.checkId(vo);
		
		System.out.println("Mvo.getPosition() : " + Mvo.getPosition());
		System.out.println("Mvo.getArea() : " + Mvo.getArea());
		
		if(Mvo.getPosition().equals("manager")){
			List<UserVO> list = userService.usermoneyM(Mvo);
			mav.addObject("result", list);
			
		} else if(Mvo.getPosition().equals("user")){
			List<UserVO> list2 = userService.usermoney(vo);
			mav.addObject("result", list2);
			
		}
		
		mav.setViewName(".pos.usermonrytotal");
		return mav;
	}*/
}
