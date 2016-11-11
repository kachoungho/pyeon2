package com.pyeon2.service;

import java.util.List;

import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;

public interface CompanyService {
	// 발주 목록 확인 메소드
	public List<ItemVO> orderList() throws Exception;
	
	// 발주 승인 시 해당 지점의 재고 갯수 추가해주는 메소드
	public void updateItemCount(ItemVO vo) throws Exception;
	
	// 발주 승인 후 발주신청 목록 제거 메소드
	public void odertDelete(ItemVO vo) throws Exception;
	
	// 본사에서 회원 검색했을 때 관리자(admin)와 지점장(manager)만 출력
	public List<MemberVO> getAdminMember() throws Exception;
	
	// 관리자/지점장 sorting 해서 리스트 출력
	public List<MemberVO> getPSMember(MemberVO Mvo) throws Exception;
	
	// 관리자/지점장 정보 입력
	public void insertAdminMember(MemberVO Mvo) throws Exception;
	
	// 입력된 정보를 바탕으로 권한 자동으로 주기
	public void insertPosition(MemberVO Mvo) throws Exception;
	
	// 지점별 재고 현황(물품) 불러오는 리스트
	public List<ItemVO> areaItemList(ItemVO vo) throws Exception;
}
