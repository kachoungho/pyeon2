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
import com.pyeon2.service.CompanyService;
import com.pyeon2.service.PosService;
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.SelectSearch;

@Controller
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private PosService posService;

	@RequestMapping("company")
	public String getCompany() {
		return ".company";
	}

	/*@RequestMapping(value = "company/com_stock", method = RequestMethod.GET)
	public String comStockGET() {
		return ".company.company_stock";
	}*/

	@RequestMapping("company/com_stock")
	public ModelAndView comStockPOST(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		List<ItemVO> list;
		int count = 0;
		int pageNum = 1;
		String page = request.getParameter("page");
		String area = request.getParameter("area");
		String category = request.getParameter("category");
		String item_name = request.getParameter("item_name");
		
		String sArea = "판교";
		ItemVO vo = new ItemVO();
		
		if(page != null && !page.equals("")){
			pageNum = Integer.parseInt(page);
		}
		
		if(area != null && !area.equals("")){
			sArea = area;
		}
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(7);
			
			vo.setArea("%"+sArea+"%");
			vo.setCri(cri);
			vo.setCategory("%"+category+"%");
			vo.setItem_name("%"+item_name+"%");
			
			count = companyService.getAreaCount(vo);
			list = companyService.areaItemList(vo);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("area", area);
			mav.addObject("category", category);
			mav.addObject("item_name", item_name);
			
			mav.setViewName(".company.company_stock");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mav;
	}
	
	@RequestMapping(value="company/com_stock_select")
	public ModelAndView selectName(HttpServletRequest request,Model model){
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		
		String page = request.getParameter("page");
		String category = request.getParameter("category");
		String item_name = "";
		SelectSearch ss = new SelectSearch();
		
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
		vo.setItem_name("%"+item_name+"%");
		
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

			System.out.println("나와랏 :" + ss.getItem_name());
			
			count = posService.getSelectCount(vo);
			System.out.println("count : " + posService.getSelectCount(vo));
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
			
			
			mav.setViewName(".company.company_stock_select");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
	}

	@RequestMapping(value = "company/com_store", method = RequestMethod.GET)
	public String comStore() {
		return ".company.company_store";
	}

	@RequestMapping(value = "company/com_personnel", method = RequestMethod.GET)
	public String comPersonnel() {
		return ".company.company_personnel";
	}

	@RequestMapping(value = "company/com_orderApproval", method = RequestMethod.GET)
	public ModelAndView orderApprovalGET(Model model) {
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

	@RequestMapping(value = "company/com_orderApproval", method = RequestMethod.POST)
	public ModelAndView orderApprovalPOST(HttpServletRequest request, Model model) {
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
			companyService.orderUpdate(vo);
			mav.setViewName(".company.orderApprovalsuc");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "company/com_orderCancel", method = RequestMethod.GET)
	public ModelAndView orderCancelGET(HttpServletRequest request) {
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

	@RequestMapping("company/com_searchForm")
	public ModelAndView comPersonnelForm() {
		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		try {

			list = companyService.getAdminMember();
			mav.addObject("list", list);
			mav.setViewName(".company.company_searchForm");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "company/com_search", method = RequestMethod.POST)
	public ModelAndView comPersonnel(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		MemberVO Mvo = new MemberVO();

		String position = request.getParameter("position");
		Mvo.setPosition(position);
		
		try {

			if (position.equals("all")) {
				list = companyService.getAllMember();
			} else {
				list = companyService.getPSMember(Mvo);
			}

			mav.addObject("result", list);
			mav.setViewName(".company.company_search");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping("company/com_insertForm")
	public String comPersonnelInsertForm() {
		return ".company.company_insertForm";
	}

	@RequestMapping(value = "company/com_insert", method = RequestMethod.POST)
	public ModelAndView comPersonnelInsert(HttpServletRequest request, MemberVO memberVO) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		try {

			companyService.insertAdminMember(memberVO);

			String position = memberVO.getPosition();
			String id = memberVO.getId();
			String admin = "admin";
			String manager = "manager";

			// 관리자가 정보를 입력하면서 roll 테이블에 포지션에 따라 권한도 주어짐
			if (position.equals(admin)) {
				memberVO.setId(request.getParameter("id"));
				memberVO.setRole_name("ROLE_ADMIN");
				companyService.insertPosition(memberVO);

			} else if (position.equals(manager)) {
				memberVO.setId(request.getParameter("id"));
				memberVO.setRole_name("ROLE_MANAGER");
				companyService.insertPosition(memberVO);
			}

			list = companyService.getAdminMember();
			mav.addObject("list", list);
			mav.setViewName(".company.company_searchForm");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}


	@RequestMapping("company/com_updateForm")
	public ModelAndView comPersonnelUpdateForm(HttpServletRequest request, MemberVO Mvo) {

		ModelAndView mav = new ModelAndView();
		List<MemberVO> list;

		Mvo.setId(request.getParameter("id"));

		try {
			list = companyService.getMember(Mvo);

			mav.addObject("list", list);
			mav.setViewName(".company.company_updateForm");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	@RequestMapping(value = "company/com_update", method = RequestMethod.POST)
	public ModelAndView comPersonnelUpdate(HttpServletRequest request, MemberVO Mvo) {

		ModelAndView mav = new ModelAndView();

		try {
			companyService.updateMember(Mvo);
			mav.setViewName(".company.company_update");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}
	
	@RequestMapping(value="company/com_delete", method = RequestMethod.POST)
	public String comPersonnelDelete(HttpServletRequest request, MemberVO Mvo) {
		
		Mvo.setId(request.getParameter("id"));
		
		try {
			companyService.deleteMember(Mvo);
			companyService.deleteRole(Mvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".company.company_delete";
	}
	/*@RequestMapping(value = "company/com_companyStock", method = RequestMethod.GET)
	public String companyStockGET() {
		return ".company.company_companyStock";
	}*/
	
	@RequestMapping(value = "company/com_companyStock")
	public ModelAndView companyStockPOST(HttpServletRequest request, String page) throws Exception {
		ComItemVO vo = new ComItemVO();
		ModelAndView mav = new ModelAndView();
		List<ComItemVO> list = null;
		String category = request.getParameter("category");

		int count = 0;
		int pageNum = 1;

		if (page != null && !page.equals("")) {
			pageNum = Integer.parseInt(page);
		}

		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(7);

			if(category == null){
				category = "all";
				count = companyService.getComItemCount();
			}
			else{
				category = request.getParameter("category");
				count = companyService.getComItemCountCategory(category);
			}
			
			vo.setCategory(category);
			vo.setCri(cri);
			
			if(category.equals("all")){
				list = companyService.comItemListAll(cri);
			} else {
				list = companyService.comItemList(vo);
			}

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);

			mav.addObject("result", list);
			mav.addObject("pageNum", pageNum);
			mav.addObject("count", count);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("category", category);

			mav.setViewName(".company.company_companyStock");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mav;
	}
}
