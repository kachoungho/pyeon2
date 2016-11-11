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
	
	public List<MemberVO> getAdminMember() throws Exception;
	public List<MemberVO> getPSMember(MemberVO Mvo) throws Exception;
	public void insertAdminMember(MemberVO Mvo) throws Exception;
	public void insertPosition(MemberVO Mvo) throws Exception;
}
