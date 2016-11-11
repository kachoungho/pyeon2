package com.pyeon2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pyeon2.domain.Criteria;
import com.pyeon2.domain.PageMaker;
import com.pyeon2.service.PosService;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.SelectSearch;
import com.pyeon2.vo.UserVO;

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

	@RequestMapping(value="pos/ps_item_delete", method = RequestMethod.GET)
	public ModelAndView deleteform() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(".pos.pos_item_delete");

		return mav;
	}
	
	@RequestMapping(value="pos/ps_item_delete", method = RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setItem_code(request.getParameter("item_code"));
		vo.setArea(request.getParameter("area"));

		posService.Delete(vo);

		mav.setViewName(".pos.fin");
		return mav;
	}	

	@RequestMapping(value="pos/ps_item_select", method = RequestMethod.GET)
	public ModelAndView selectform() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(".pos.pos_item_select");

		return mav;
	}
	
	@RequestMapping(value="ps_selectpay", method = RequestMethod.GET)
	public ModelAndView selectalpay(HttpServletRequest request,Model model) {
		ModelAndView mav = new ModelAndView();
		List<UserVO> list;
		
		UserVO vo = new UserVO();
		vo.setUserid(request.getParameter("id"));
		
		try {
			list = posService.selectalpayAll(vo);
			mav.addObject("result", list);
			mav.setViewName(".pos.pos_selectpay");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="ps_selectpay", method = RequestMethod.POST)
	public ModelAndView selectalfroms(HttpServletRequest request,Model model){
		UserVO vo = new UserVO();
		ModelAndView mav = new ModelAndView();
		List<UserVO> list;
		System.out.println("request" + request.getParameter("ids"));
		vo.setUserid(request.getParameter("ids"));
		vo.setYear(request.getParameter("year"));
		vo.setMonth(request.getParameter("month"));
		
		try {
			list = posService.selectalpay(vo);
			mav.addObject("result", list);
			mav.setViewName(".pos.pos_selectpay");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return mav;
	}
	
	@RequestMapping(value="ps_selectpays", method = RequestMethod.GET)
	public ModelAndView selectmanpay(HttpServletRequest request,Model model) {
		ModelAndView mav = new ModelAndView();
		List<UserVO> list;
		
		UserVO vo = new UserVO();
		vo.setUserid(request.getParameter("id"));
		
		try {
			list = posService.selectmanpayAll(vo);
			mav.addObject("result", list);
			mav.setViewName(".pos.pos_selectpay");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="ps_selectpays", method = RequestMethod.POST)
	public ModelAndView selectmanfroms(HttpServletRequest request,Model model){
		UserVO vo = new UserVO();
		ModelAndView mav = new ModelAndView();
		List<UserVO> list;
		System.out.println("request" + request.getParameter("ids"));
		vo.setUserid(request.getParameter("ids"));
		vo.setYear(request.getParameter("year"));
		vo.setMonth(request.getParameter("month"));
		
		try {
			list = posService.selectmanpay(vo);
			mav.addObject("result", list);
			mav.setViewName(".pos.pos_selectpay");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return mav;
	}
	
	@RequestMapping("pos/ps_item_selectAll")
	public ModelAndView productList(String page){
		ModelAndView mav = new ModelAndView();
		
		List<ItemVO> list;
		int count = 0;
		int pageNum = 1;
		
		if(page != null && !page.equals("")){
			pageNum = Integer.parseInt(page);
		}
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(10);
			count = posService.getCount();
			list = posService.getList(cri);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			
			mav.setViewName(".pos.pos_item_selectAll");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mav;
	}
	
	@RequestMapping(value="pos/ps_item_delete_now", method = RequestMethod.GET)
	public ModelAndView deleteNow(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		List<ItemVO> list;
		int count = 0;
		int pageNum = 1;
		String page = request.getParameter("page");
		
		if(page != null && !page.equals("")){
			pageNum = Integer.parseInt(page);
		}
		
		vo.setItem_code(request.getParameter("item_code"));
		vo.setArea(request.getParameter("area"));
		
		posService.Delete(vo);
		
		pageNum = Integer.parseInt(request.getParameter("page"));
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(10);
			count = posService.getCount();
			list = posService.getList(cri);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			
			mav.setViewName(".pos.pos_item_selectAll");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping(value="pos/ps_item_select_now")
	public ModelAndView selectName(HttpServletRequest request,Model model){
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setItem_name(request.getParameter("item_name"));
		String page = request.getParameter("page");
		SelectSearch ss = new SelectSearch();
		
		List<ItemVO> list;
		int count = 0;
		int pageNum = 1;
		int perPageNum = 10;
		String item_name = request.getParameter("item_name");
		
		if(page != null && !page.equals("")){
			pageNum = Integer.parseInt(page);
		}
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(perPageNum);
			
			ss.setPage(pageNum);
			ss.setPerPageNum(perPageNum);
			ss.setItem_name("%"+item_name+"%");
			count = posService.getSelectCount(vo);
			list = posService.selectName(ss);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			System.out.println("list : " + list);
			
			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			
			mav.setViewName(".pos.pos_item_select_now");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
	}
}
