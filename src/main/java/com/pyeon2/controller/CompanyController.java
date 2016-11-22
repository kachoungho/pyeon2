package com.pyeon2.controller;

import java.util.Calendar;
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
import com.pyeon2.service.MemberService;
import com.pyeon2.service.PosService;
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.NoticeVO;
import com.pyeon2.vo.SelectSearch;

@Controller
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private PosService posService;

	@Autowired
	private MemberService memberService;

	@RequestMapping("company")
	public ModelAndView getCompany(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		List<NoticeVO> list;

		try {
			
			// 달력 관련 부분
			Calendar cal = Calendar.getInstance(); // Calendar객체 cal생성
			int currentYear = cal.get(Calendar.YEAR); // 현재 날짜 기억
			int currentMonth = cal.get(Calendar.MONTH);
			int currentDate = cal.get(Calendar.DATE);
			String Year = request.getParameter("year"); // 나타내고자 하는 날짜
			String Month = request.getParameter("month");
			int year, month;
			if (Year == null && Month == null) { // 처음 호출했을 때
				year = currentYear;
				month = currentMonth;
			} else { // 나타내고자 하는 날짜를 숫자로 변환
				year = Integer.parseInt(Year);
				month = Integer.parseInt(Month);
				if (month < 0) {
					month = 11;
					year = year - 1;
				} // 1월부터 12월까지 범위 지정.
				if (month > 11) {
					month = 0;
					year = year + 1;
				}
			}

			cal.set(year, month, 1); // 현재 날짜를 현재 월의 1일로 설정
			int startDay = cal.get(Calendar.DAY_OF_WEEK); // 현재날짜(1일)의 요일
			int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 이 달의 끝나는 날
			int br = 0; // 7일마다 줄 바꾸기

			mav.addObject("year", new Integer(year));
			mav.addObject("month", new Integer(month));
			mav.addObject("currentYear", new Integer(currentYear));
			mav.addObject("currentMonth", new Integer(currentMonth));
			mav.addObject("currentDate", new Integer(currentDate));
			mav.addObject("startDay", new Integer(startDay));
			mav.addObject("end", new Integer(end));
			mav.addObject("br", br);
			// 달력 관련 부분 end
			
			// 미승인건 관련 부분
			list = companyService.getNotConfirm();
			int count = companyService.getNotConfirmCount();

			mav.addObject("result", list);
			mav.addObject("count", count);
			// 미승인건 관련 부분 end
			mav.setViewName(".company.company_main");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/*
	 * @RequestMapping(value = "company/com_stock", method = RequestMethod.GET)
	 * public String comStockGET() { return ".company.company_stock"; }
	 */

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

		if (page != null && !page.equals("")) {
			pageNum = Integer.parseInt(page);
		}

		if (area != null && !area.equals("")) {
			sArea = area;
		}

		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(7);

			vo.setArea("%" + sArea + "%");
			vo.setCri(cri);
			vo.setCategory("%" + category + "%");
			vo.setItem_name("%" + item_name + "%");

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

	@RequestMapping(value = "company/com_stock_select")
	public ModelAndView selectName(HttpServletRequest request, Model model) {
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

		if (request.getParameter("item_name") == null) {
			item_name = "";
		} else {
			item_name = request.getParameter("item_name");
		}
		vo.setCategory(category);
		vo.setItem_name("%" + item_name + "%");

		if (page != null && !page.equals("")) {
			pageNum = Integer.parseInt(page);
		}

		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(perPageNum);

			ss.setPage(pageNum);
			ss.setPerPageNum(perPageNum);
			ss.setItem_name("%" + item_name + "%");
			ss.setCategory(category);

			System.out.println("나와랏 :" + ss.getItem_name());

			count = posService.getSelectCount(vo);
			System.out.println("count : " + posService.getSelectCount(vo));
			list = posService.selectName(ss);

			PageMaker pageMaker = new PageMaker(); // 페이지 선택부분 처리
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
		int totalPrice = 0;
		int sequence = 0;

		vo.setItem_code(request.getParameter("item_code"));
		vo.setCount(Integer.parseInt(request.getParameter("count")));
		vo.setArea(request.getParameter("area"));
		vo.setItem_name(request.getParameter("item_name"));
		vo.setCategory(request.getParameter("category"));
		vo.setP2_time(request.getParameter("p2_time"));
		vo.setState("발주 승인");
		try {
			companyService.updateOrderState(vo);
			companyService.updateItemCount(vo);
			companyService.odertDelete(vo);
			companyService.orderUpdate(vo);
			totalPrice = posService.getPrice(vo);
			vo.setTotalPrice(totalPrice);
			sequence = posService.getSpendSequence(vo);
			vo.setBno(sequence);
			System.out.println("sequence : " + sequence);
			posService.orderSpend(vo);
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
		vo.setCount(Integer.parseInt(request.getParameter("count")));
		vo.setArea(request.getParameter("area"));
		vo.setState("발주 미승인");
		try {
			companyService.updateOrderState(vo);
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
			mav.addObject("result", list);
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
			mav.setViewName(".company.company_insert");

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

	@RequestMapping(value = "company/com_delete", method = RequestMethod.POST)
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
	/*
	 * @RequestMapping(value = "company/com_companyStock", method =
	 * RequestMethod.GET) public String companyStockGET() { return
	 * ".company.company_companyStock"; }
	 */

	@RequestMapping(value = "company/com_companyStock")
	public ModelAndView companyStockPOST(HttpServletRequest request, String page) throws Exception {
		ComItemVO vo = new ComItemVO();
		ModelAndView mav = new ModelAndView();
		List<ComItemVO> list = null;
		String category = request.getParameter("category");
		System.out.println("category" + category);
		int count = 0;
		int pageNum = 1;

		if (page != null && !page.equals("")) {
			pageNum = Integer.parseInt(page);
		}

		try {
			Criteria cri = new Criteria();
			cri.setPage(pageNum);
			cri.setPerPageNum(7);

			if (category == null || category.equals("all")) {
				category = "all";
				count = companyService.getComItemCount();
			} else {
				category = request.getParameter("category");
				count = companyService.getComItemCountCategory(category);
			}

			vo.setCategory(category);
			vo.setCri(cri);

			if (category.equals("all")) {
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

	@RequestMapping(value = "company/com_notice_list", method = RequestMethod.GET)
	public ModelAndView comnotice(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();

		List<NoticeVO> list = companyService.getnoticelist();
		mav.addObject("result", list);
		mav.setViewName(".company.company_notice_list");
		return mav;
	}

	@RequestMapping(value = "company/com_notice_list", method = RequestMethod.POST)
	public ModelAndView comnoticelist(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();

		NoticeVO Nvo = new NoticeVO();

		Nvo.setTitle(request.getParameter("title"));
		Nvo.setName(request.getParameter("name"));
		Nvo.setPosition(request.getParameter("position"));
		Nvo.setContant(request.getParameter("contant"));

		companyService.noticewrite(Nvo);

		List<NoticeVO> list = companyService.getnoticelist();

		mav.addObject("result", list);
		mav.setViewName(".company.company_notice_list");
		return mav;
	}

	@RequestMapping(value = "company/com_notice_write", method = RequestMethod.POST)
	public ModelAndView comnoticewrite(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();

		MemberVO Mvo = new MemberVO();
		Mvo.setId(request.getParameter("id"));

		List<MemberVO> list = memberService.getname(Mvo);
		mav.addObject("result", list);
		mav.setViewName(".company.company_notice_write");
		return mav;
	}

	@RequestMapping(value = "company/com_notice_contant", method = RequestMethod.GET)
	public ModelAndView comnoticecontant(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();

		NoticeVO Nvo = new NoticeVO();
		Nvo.setNoticenum(Integer.parseInt(request.getParameter("noticenum")));

		List<NoticeVO> list = companyService.getnoticecontant(Nvo);

		mav.addObject("result", list);
		mav.setViewName(".company.company_notice_contant");
		return mav;
	}

	@RequestMapping(value = "company/com_notice_contant", method = RequestMethod.POST)
	public ModelAndView comnoticecontantPO(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();

		NoticeVO Nvo = new NoticeVO();
		Nvo.setNoticenum(Integer.parseInt(request.getParameter("noticenum")));
		Nvo.setTitle(request.getParameter("title"));
		Nvo.setContant(request.getParameter("contant"));

		companyService.noticeupdate(Nvo);
		List<NoticeVO> list = companyService.getnoticecontant(Nvo);

		mav.addObject("result", list);
		mav.setViewName(".company.company_notice_contant");
		return mav;
	}

	@RequestMapping(value = "company/com_notice_modify", method = RequestMethod.POST)
	public ModelAndView comnoticecontantmo(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();

		NoticeVO Nvo = new NoticeVO();
		Nvo.setNoticenum(Integer.parseInt(request.getParameter("noticenum")));

		List<NoticeVO> list = companyService.getnoticecontant(Nvo);

		mav.addObject("result", list);
		mav.setViewName(".company.company_notice_modify");
		return mav;
	}

	@RequestMapping(value = "company/com_notice_delete", method = RequestMethod.POST)
	public ModelAndView comnoticedelete(HttpServletRequest request, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		NoticeVO Nvo = new NoticeVO();

		Nvo.setNoticenum(Integer.parseInt(request.getParameter("noticenum")));
		companyService.noticedelete(Nvo);

		mav.setViewName(".company.company_notice_delete");
		return mav;
	}

}
