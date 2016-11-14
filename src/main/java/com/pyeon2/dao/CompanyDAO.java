package com.pyeon2.dao;

import java.util.List;

import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;

public interface CompanyDAO {
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

	// 아이디별 멤버 정보 불러오는 리스트 (수정하기위함)
	public List<MemberVO> getMember(MemberVO Mvo) throws Exception;

	// 아이디별 멤버 수정
	public void updateMember(MemberVO Mvo) throws Exception;

	// 모든 멤버 리스트 출력
	public List<MemberVO> getAllMember() throws Exception;
	
	// 멤버 정보 삭제
	public void deleteMember(MemberVO Mvo) throws Exception;
}
