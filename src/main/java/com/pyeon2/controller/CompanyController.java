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
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;

@Controller
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	@RequestMapping("company")
	public String getCompany() {
		return ".company";
	}

	@RequestMapping(value = "company/com_stock", method = RequestMethod.GET)
	public String comStockGET() {
		return ".company.company_stock";
	}

	@RequestMapping(value = "company/com_stock", method = RequestMethod.POST)
	public ModelAndView comStockPOST(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		ItemVO vo = new ItemVO();
		System.out.println("area : " + request.getParameter("area"));
		vo.setArea(request.getParameter("area"));
		List<ItemVO> list = companyService.areaItemList(vo);

		mav.addObject("result", list);
		mav.setViewName(".company.company_stock");

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
	@RequestMapping(value = "company/com_companyStock", method = RequestMethod.GET)
	public String companyStockGET() {
		return ".company.company_companyStock";
	}
	
	@RequestMapping(value = "company/com_companyStock", method = RequestMethod.POST)
	public ModelAndView companyStockPOST(HttpServletRequest request) throws Exception {
		ComItemVO vo = new ComItemVO();
		ModelAndView mav = new ModelAndView();
		List<ComItemVO> list = null;
		
		String category = request.getParameter("category");
		vo.setCategory(category);
		if(category.equals("all")){
			list = companyService.comItemListAll();
		} else {
			list = companyService.comItemList(vo);
		}
		
		
		mav.addObject("result", list);
		mav.setViewName(".company.company_companyStock");
		
		return mav;
	}
}
