package com.pyeon2.service;

import java.util.List;

import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.UserVO;

public interface PosService {
	//발주 신청 메소드
	public void insertOrder(ItemVO vo) throws Exception;
	
	// 물품(재고) 전체 리스트 출력 메소드
	public List<ItemVO> getList() throws Exception;
	
	// 물품(재고) 이름으로 검색하여 리스트 출력 메소드
	public List<ItemVO> selectName(ItemVO vo) throws Exception;
	
	// 물품(재고) 제거 메소드
	public void Delete(ItemVO vo) throws Exception;
	
	//알바 일했던시급
	public List<UserVO> selectalpayAll(UserVO vo) throws Exception;
			
	//알바 날짜 선택 시급
	public List<UserVO> selectalpay(UserVO vo) throws Exception;
			
	//알바 일했던시급
	public List<UserVO> selectmanpayAll(UserVO vo) throws Exception;
					
	//알바 날짜 선택 시급
	public List<UserVO> selectmanpay(UserVO vo) throws Exception;
	
	/* 현재 미사용 메소드(출/퇴근 이력 조회)
	public List<UserVO> usermoney(UserVO vo) throws Exception;
	public List<UserVO> usermoneyM(MemberVO Mvo) throws Exception;*/
}
