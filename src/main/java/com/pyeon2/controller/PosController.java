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
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.SelectSearch;
import com.pyeon2.vo.UserVO;

@Controller
/* @RequestMapping(value="/pos/") */
public class PosController {

	@Autowired
	private PosService posService;

	/*
	 * @Autowired public UserService userService;
	 */

	@RequestMapping("pos")
	public String getCompany() {
		return ".pos";
	}

	@RequestMapping(value = "pos/ps_order", method = RequestMethod.GET)
	public ModelAndView orderGET(Model model, String page, String item_code, String item_name, String category, String name) {
		System.out.println("order GET 요청 성공");

		ModelAndView mav = new ModelAndView();

		List<ComItemVO> list;
		int count = 0;
		int pageNum = 1;
		String area = "";
		
		if(page != null && !page.equals("")){
			pageNum = Integer.parseInt(page);
		}
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(7);
			count = posService.getCompanyCount();
			list = posService.getCompanyList(cri);
			
			System.out.println("name : " + name);
			if(name == null){
				area = "";
			}
			else{
				area = posService.getArea(name);
			}
			
			System.out.println("List : " + list);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("item_code", item_code);
			mav.addObject("item_name", item_name);
			mav.addObject("category", category);
			mav.addObject("area", area);
			
			mav.setViewName(".pos.pos_order");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_order", method = RequestMethod.POST)
	public String orderPOST(ItemVO vo, Model model, String page) throws Exception {
		System.out.println("order POST 요청 성공");
		List<ItemVO> list;
		int compare = 0;
		list = posService.orderTempCompare();
		System.out.println("item_code : " + vo.getItem_code());
		System.out.println("area : " + vo.getArea());
		
		for(int i = 0; i < list.size(); i++){
			System.out.println("item_code : " + list.get(i).getItem_code());
			System.out.println("item_code : " + vo.getItem_code());
			System.out.println("area : " + list.get(i).getArea());
			System.out.println("area : " + vo.getArea());
			if(list.get(i).getItem_code().equals(vo.getItem_code()) && list.get(i).getArea().equals(vo.getArea())){
				compare = 1;
			}
		}
		
		if(compare == 1){
			posService.updateOrderTemp(vo);
		}
		else{
			posService.insertOrderTemp(vo);
		}
		
		
		return "redirect:ps_order";
	}
	
	@RequestMapping(value = "pos/ps_order_temp", method = RequestMethod.GET)
	public ModelAndView orderTempGet(ItemVO vo, String page, String item_code, String area){
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
			cri.setPerPageNum(7);
			count = posService.orderTempCount();
			list = posService.orderTempList(cri);
			
			System.out.println("List : " + list);
			System.out.println("count : " + count);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("item_code", item_code);
			mav.addObject("area", area);
			
			mav.setViewName(".pos.pos_order_temp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_order_temp", method = RequestMethod.POST)
	public ModelAndView orderTempPost(List<ItemVO> result, String page){
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}
	
	@RequestMapping(value = "pos/ps_order_temp_delete", method = RequestMethod.GET)
	public ModelAndView orderTempDelete(String page, String item_code, String area){
		ModelAndView mav = new ModelAndView();
		List<ItemVO> list;
		int count = 0;
		int pageNum = Integer.parseInt(page);
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(7);
			
			ItemVO vo = new ItemVO();
			vo.setArea(area);
			vo.setItem_code(item_code);
			
			posService.orderTempDelete(vo);
			count = posService.orderTempCount();
			list = posService.orderTempList(cri);
			
			System.out.println("List : " + list);
			System.out.println("count : " + count);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("item_code", item_code);
			mav.addObject("area", area);
			
			mav.setViewName(".pos.pos_order_temp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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


	@RequestMapping(value = "pos/ps_item_delete", method = RequestMethod.POST)
	public ModelAndView delete(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setItem_code(request.getParameter("item_code"));
		vo.setArea(request.getParameter("area"));

		posService.Delete(vo);

		mav.setViewName(".pos.fin");
		return mav;
	}


	@RequestMapping(value = "pos/ps_selectpay", method = RequestMethod.GET)
	public ModelAndView selectalpay(HttpServletRequest request, Model model) {
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

	@RequestMapping(value = "pos/ps_selectpay", method = RequestMethod.POST)
	public ModelAndView selectalfroms(HttpServletRequest request, Model model) {
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

	@RequestMapping(value = "pos/ps_selectpays", method = RequestMethod.GET)
	public ModelAndView selectmanpay(HttpServletRequest request, Model model) {
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

	@RequestMapping(value = "pos/ps_selectpays", method = RequestMethod.POST)
	public ModelAndView selectmanfroms(HttpServletRequest request, Model model) {
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
	public ModelAndView productList(String page) {
		ModelAndView mav = new ModelAndView();

		List<ItemVO> list;
		int count = 0;
		int pageNum = 1;

		if (page != null && !page.equals("")) {
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

	@RequestMapping(value = "pos/ps_item_delete_now", method = RequestMethod.GET)
	public ModelAndView deleteNow(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		List<ItemVO> list;
		int count = 0;
		int pageNum = 1;
		String page = request.getParameter("page");

		if (page != null && !page.equals("")) {
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
	      
	      String page = request.getParameter("page");
	      String category = request.getParameter("category");
	      String id = request.getParameter("id");
	      String item_name = "";
	      SelectSearch ss = new SelectSearch();

	      System.out.println(id);
	      
	      String area = posService.getArea(id);
	      vo.setArea(area);
	      System.out.println(area);
	      List<ItemVO> list;
	      int count = 0;
	      int pageNum = 1;
	      int perPageNum = 7;
	      
	      if(request.getParameter("item_name") == null){
	         item_name = "";
	      }
	      else{
	         item_name = request.getParameter("item_name");
	      }
	      vo.setCategory(category);
	      
	      
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
	         ss.setCategory(category);
	         ss.setArea(area);
	         
	         
	         System.out.println("상품명 :" + item_name);
	         System.out.println("카테고리 :" + vo.getCategory());
	         System.out.println("나와랏 :" + ss.getItem_name());
	         
	         if(item_name.equals("")){
	        	 count = posService.getSelectCount2(vo);
	         } else {
	        	 vo.setItem_name("%"+item_name+"%");
		         count = posService.getSelectCount(vo);
	         }
	         
	         
	         System.out.println("count : " + count);
	         list = posService.selectName(ss);
	         
	         PageMaker pageMaker = new PageMaker(); //페이지 선택부분 처리
	         pageMaker.setCri(cri);
	         pageMaker.setTotalCount(count);
	         
	         mav.addObject("result", list);
	         mav.addObject("pageNum", pageNum);
	         mav.addObject("count", count);
	         mav.addObject("pageMaker", pageMaker);
	         mav.addObject("category", category);
	         mav.addObject("item_name", item_name);
	         mav.addObject("area", area);
	         
	         mav.setViewName(".pos.pos_item_select_now");
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return mav;
	   }
	
	
	@RequestMapping("pos/ps_user_selectForm")
	public ModelAndView posPersonnelForm(HttpServletRequest request, MemberVO Mvo) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		Mvo.setId(request.getParameter("id"));

		try {
			list = posService.selectUser(Mvo);

			mav.addObject("list", list);
			mav.setViewName(".pos.pos_user_select");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping("pos/ps_user_updateForm")
	public ModelAndView posPersonnelUpdateForm(HttpServletRequest request, MemberVO Mvo) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		Mvo.setId(request.getParameter("id"));

		try {
			list = posService.selectUserId(Mvo);

			mav.addObject("list", list);
			mav.setViewName(".pos.pos_user_updateForm");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping("pos/ps_user_update")
	public String posPersonnelUpdate(HttpServletRequest request, MemberVO Mvo) {

		Mvo.setId(request.getParameter("id"));

		try {
			posService.updateUser(Mvo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ".pos.pos_user_update";
	}

	@RequestMapping(value = "pos/ps_user_delete", method = RequestMethod.POST)
	public String comPersonnelDelete(HttpServletRequest request, MemberVO Mvo, UserVO vo) {

		Mvo.setId(request.getParameter("id"));
		vo.setUserid(request.getParameter("id"));

		try {
			posService.deleteUserTime(vo);
			posService.deleteUser(Mvo);
			posService.deleteRole(Mvo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ".pos.pos_user_delete";
	}

	@RequestMapping("pos/ps_user_insertForm")
	public ModelAndView posPersonnelInsertForm(HttpServletRequest request, MemberVO Mvo) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		Mvo.setId(request.getParameter("id"));

		try {
			list = posService.selectUserId(Mvo);

			mav.addObject("list", list);
			mav.setViewName(".pos.pos_user_insertForm");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "pos/ps_user_insert", method = RequestMethod.POST)
	public ModelAndView comPersonnelInsert(HttpServletRequest request, MemberVO Mvo, UserVO vo) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		try {

			posService.insertUser(Mvo);

			String position = Mvo.getPosition();
			String id = Mvo.getId();
			String user = "user";

			// 매니저가 정보를 입력하면서 role 테이블에 포지션에 따라 권한도 주어짐
			if (position.equals(user)) {
				Mvo.setId(request.getParameter("id"));
				Mvo.setRole_name("ROLE_USER");
				posService.insertPosition(Mvo);
				
				// p2_user 테이블에 최초 데이터 저장 (이 후로 시간은 다른 메소드에서 업데이트)
				vo.setUserid(request.getParameter("id"));
				posService.insertUserTime(vo);
			}

			list = posService.selectUser(Mvo);

			mav.addObject("list", list);
			mav.setViewName(".pos.pos_user_select");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}
	
	@RequestMapping(value="pos/ps_calcform", method = RequestMethod.GET)
	public ModelAndView calcget(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		vo.setId(request.getParameter("id"));
		String area = posService.areaserch(vo);
		mav.addObject("area", area);
		mav.setViewName(".pos.pos_calc");

		return mav;
	}
	
	@RequestMapping(value = "pos/ps_calc", method = RequestMethod.POST)
	public ModelAndView calcpost(HttpServletRequest request, Model model) throws Exception{
		
		ItemVO vo = new ItemVO();
		vo.setItem_code(request.getParameter("item_code"));
		vo.setArea(request.getParameter("area"));
		
		/*vo.setPay(Integer.parseInt(request.getParameter("pay")));*/
		ModelAndView mav = new ModelAndView();
		int cal = 0;
		int total = 0;
		/*int pay = vo.getPay();*/
		List<ItemVO> list = posService.calcList();
		for(int i =0 ; i < list.size() ; i++){
			if(vo.getItem_code().equals(list.get(i).getItem_code())&& vo.getArea().equals(list.get(i).getArea())){
				cal = 1;
			}
		}
		
		switch (cal) {
			case 1:
			{
				posService.clacupdate(vo);
				break;
			}
			case 0:
			{
				posService.calcinsert(vo);
				break;
			}
			default:
			{
				break;
			}
		}
		
		list = posService.calcLists(vo);
		total = posService.totalcalc(vo);
		/*pay = pay - total;*/
		
		mav.addObject("result", list);
		mav.addObject("total",total);
		mav.addObject("area", vo.getArea());
		/*mav.addObject("pay",pay);*/
		mav.setViewName(".pos.pos_calc");

		return mav;
	}
	
	@RequestMapping(value = "pos/ps_daycalc", method = RequestMethod.POST)
	public ModelAndView calcpostday(HttpServletRequest request, Model model) throws Exception{
		ItemVO vo = new ItemVO();
		vo.setArea(request.getParameter("area"));
		vo.setPay(Integer.parseInt(request.getParameter("pay")));
		ModelAndView mav = new ModelAndView();
		int total = 0;
		int pay = vo.getPay();
		List<ItemVO> list = posService.calcList();
		mav.addObject("area", vo.getArea());
		total = posService.totalcalc(vo);
		pay = pay - total;
		
		mav.addObject("result", list);
		mav.addObject("total",total);
		mav.addObject("pay",pay);
		
		mav.setViewName(".pos.pos_calc");

		return mav;
	}
	
	@RequestMapping(value = "pos/ps_daycalcfin", method = RequestMethod.POST)
	public ModelAndView calcpostfinday(HttpServletRequest request, Model model) throws Exception{
		ItemVO vo = new ItemVO();
		
		ModelAndView mav = new ModelAndView();
		vo.setTotal(Integer.parseInt(request.getParameter("total")));
		vo.setArea(request.getParameter("area"));
		posService.salinsert(vo);
		
		List<ItemVO> list = posService.calcList();
		
		for(int i = 0 ; i<list.size() ; i++){
			vo.setItem_code(list.get(i).getItem_code());
			vo.setItem_name(list.get(i).getItem_name());
			vo.setCount(list.get(i).getCount());
			vo.setCategory(list.get(i).getCategory());
			vo.setArea(list.get(i).getArea());
			vo.setPrice(list.get(i).getPrice());
			
			posService.daycalcinser(vo);
			posService.hitupdate(vo);
		}
		mav.addObject("area", vo.getArea());
		posService.calcdelete(vo);
		
		
		mav.setViewName(".pos.pos_calc");

		return mav;
	}
	
	@RequestMapping(value = "pos/ps_calccancle", method = RequestMethod.POST)
	public ModelAndView calccancle(HttpServletRequest request, Model model) throws Exception{

		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		
		vo.setArea(request.getParameter("area"));
		posService.calcdelete(vo);
		mav.addObject("area", vo.getArea());
		mav.setViewName(".pos.pos_calc");
		return mav;
	}

}
