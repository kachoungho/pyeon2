package com.pyeon2.service;

import java.util.List;

import com.pyeon2.domain.Criteria;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.SelectSearch;
import com.pyeon2.vo.UserVO;

public interface PosService {
	// 발주 신청 메소드
	public void insertOrder(ItemVO vo) throws Exception;

	// 물품(재고) 전체 리스트 출력 메소드
	public List<ItemVO> getList(Criteria cri) throws Exception;

	// 물품(재고) 이름으로 검색하여 리스트 출력 메소드
	public List<ItemVO> selectName(SelectSearch ss) throws Exception;

	// 물품(재고) 제거 메소드
	public void Delete(ItemVO vo) throws Exception;

	// 알바 일했던시급
	public List<UserVO> selectalpayAll(UserVO vo) throws Exception;

	// 알바 날짜 선택 시급
	public List<UserVO> selectalpay(UserVO vo) throws Exception;

	// 알바 일했던시급
	public List<UserVO> selectmanpayAll(UserVO vo) throws Exception;

	// 알바 날짜 선택 시급
	public List<UserVO> selectmanpay(UserVO vo) throws Exception;

	// 물품(재고) 몰룍 수
	public int getCount();

	// 물품(재고) 선택된 물품 수
	public int getSelectCount(ItemVO vo);

	// 아르바이트 리스트 불러오기 (position=user인 아이들)
	public List<MemberVO> selectUser(MemberVO Mvo) throws Exception;

	// 아르바이트 리스트 불러오기 (id만 받아와서)
	public List<MemberVO> selectUserId(MemberVO Mvo) throws Exception;

	// 아르바이트생 정보 수정하기
	public void updateUser(MemberVO Mvo) throws Exception;

	// 아르바이트생 정보 삭제하기
	public void deleteUser(MemberVO Mvo) throws Exception;
	
	// 아르바이트생 권한 삭제하기
	public void deleteRole(MemberVO Mvo) throws Exception;

	// 아르바이트생 정보 입력
	public void insertUser(MemberVO Mvo) throws Exception;

	// 입력된 정보를 바탕으로 권한 자동으로 주기
	public void insertPosition(MemberVO Mvo) throws Exception;

	//계산 리스트
	public List<ItemVO> calcList() throws Exception;
			
	//계산 insert
	public void calcinsert(ItemVO vo) throws Exception;
			
	//count 추가 & price 올리기
	public void clacupdate(ItemVO vo) throws Exception;
			
	//찍힌 price 총합
	public int totalcalc() throws Exception;
			
	//sal테이블에 시간,가격,계산 번호 입력
	public void salinsert(ItemVO vo) throws Exception;
			
	//계산된 리스트를 저장(계산번호 추가)
	public void daycalcinser(ItemVO vo) throws Exception;
			
	//계산된 리스트 삭제
	public void calcdelete() throws Exception;
			
	//계산된 count만큼 item테이블에서 hit올라감
	public void hitupdate(ItemVO vo) throws Exception;
}
