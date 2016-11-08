package com.pyeon2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pyeon2.service.Pyeon2Service;
import com.pyeon2.vo.ItemVO;

@Controller
public class PosController {

	@Autowired
	private Pyeon2Service pyeon2Service;

	@RequestMapping("pos")
	public String getCompany() {
		return ".pos";
	}

	@RequestMapping(value = "order", method = RequestMethod.GET)
	public ModelAndView orderGET(Model model) {
		System.out.println("order GET 요청 성공");

		ModelAndView mav = new ModelAndView();

		mav.setViewName(".pos.order");

		return mav;
	}

	@RequestMapping(value = "order", method = RequestMethod.POST)
	public ModelAndView orderPOST(ItemVO vo, Model model) throws Exception {
		System.out.println("order POST 요청 성공");

		ModelAndView mav = new ModelAndView();

		pyeon2Service.insertOrder(vo);

		mav.setViewName(".pos.ordersuc");

		return mav;
	}

	@RequestMapping(value = "ps_stock", method = RequestMethod.GET)
	public String posStock() {
		return ".pos.pos_stock";
	}

	@RequestMapping(value = "ps_sales", method = RequestMethod.GET)
	public String posSales() {
		return ".pos.pos_sales";
	}

	@RequestMapping(value = "ps_go_leave", method = RequestMethod.GET)
	public String posGo_leave() {
		return ".pos.pos_go_leave";
	}

	@RequestMapping(value = "ps_calc", method = RequestMethod.GET)
	public String posCalc() {
		return ".pos.pos_calc";
	}

	@RequestMapping("ps_item_selectAll")
	public ModelAndView productList() {
		ModelAndView mav = new ModelAndView();

		List<ItemVO> list;
		try {
			list = pyeon2Service.getList();
			mav.addObject("result", list);
			mav.setViewName(".pos.pos_item_selectAll");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value="ps_item_delete", method = RequestMethod.POST)
	public ModelAndView Delete(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setItem_code(request.getParameter("item_code"));
		vo.setArea(request.getParameter("area"));

		pyeon2Service.Delete(vo);

		mav.setViewName(".pos");
		return mav;
	}

	@RequestMapping(value="ps_item_delete", method = RequestMethod.GET)
	public ModelAndView fom() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(".pos.pos_item_delete");

		return mav;
	}

	@RequestMapping(value="ps_item_select", method = RequestMethod.POST)
	public ModelAndView selectName(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setItem_name(request.getParameter("item_name"));

		List<ItemVO> list = pyeon2Service.selectName(vo);

		mav.addObject("result", list);
		mav.setViewName(".pos.pos_item_selectAll");

		return mav;
	}

	@RequestMapping(value="ps_item_select", method = RequestMethod.GET)
	public ModelAndView selectform() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(".pos.pos_item_select");

		return mav;
	}
}
