package com.pyeon2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.dao.PosDAO;
import com.pyeon2.domain.Criteria;
import com.pyeon2.vo.ComItemVO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.SelectSearch;
import com.pyeon2.vo.UserVO;

@Repository
public class PosServiceImpl implements PosService {

	@Autowired
	private PosDAO posDao;
	
	@Override
	public void insertOrder(ItemVO vo) throws Exception {
		posDao.insertOrder(vo);
	}

	@Override
	public List<ItemVO> getList(Criteria cri) throws Exception {
		return posDao.getList(cri);
	}

	@Override
	public List<ItemVO> selectName(SelectSearch ss) throws Exception {
		return posDao.selectName(ss);
	}

	@Override
	public void Delete(ItemVO vo) throws Exception {
		posDao.Delete(vo);
	}
	
	@Override
	public List<UserVO> selectalpayAll(UserVO vo) throws Exception {
		return posDao.selectalpayAll(vo);
	}

	@Override
	public List<UserVO> selectalpay(UserVO vo) throws Exception {
		return posDao.selectalpay(vo);
	}

	@Override
	public List<UserVO> selectmanpayAll(UserVO vo) throws Exception {
		return posDao.selectmanpayAll(vo);
	}

	@Override
	public List<UserVO> selectmanpay(UserVO vo) throws Exception {
		return posDao.selectmanpay(vo);
	}
	
	@Override
	public int getCount() {
		return posDao.getCount();
	}

	@Override
	public int getSelectCount(ItemVO vo) {
		return posDao.getSelectCount(vo);
	}

	@Override
	public List<MemberVO> selectUser(MemberVO Mvo) throws Exception {
		return posDao.selectUser(Mvo);
	}
	
	@Override
	public List<MemberVO> selectUserId(MemberVO Mvo) throws Exception {
		return posDao.selectUserId(Mvo);
	}

	@Override
	public void updateUser(MemberVO Mvo) throws Exception {
		posDao.updateUser(Mvo);
	}

	@Override
	public void deleteUser(MemberVO Mvo) throws Exception {
		posDao.deleteUser(Mvo);
	}

	@Override
	public void deleteRole(MemberVO Mvo) throws Exception {
		posDao.deleteRole(Mvo);
	}

	@Override
	public void deleteUserTime(UserVO vo) throws Exception {
		posDao.deleteUserTime(vo);
	}

	@Override
	public void insertUser(MemberVO Mvo) throws Exception {
		posDao.insertUser(Mvo);
	}

	@Override
	public void insertPosition(MemberVO Mvo) throws Exception {
		posDao.insertPosition(Mvo);
	}

	@Override
	public void insertUserTime(UserVO vo) throws Exception {
		posDao.insertUserTime(vo);
	}

	@Override
	public List<ItemVO> calcList() throws Exception {
		return posDao.calcList();
	}

	@Override
	public void calcinsert(ItemVO vo) throws Exception {
		posDao.calcinsert(vo);
	}

	@Override
	public void clacupdate(ItemVO vo) throws Exception {
		posDao.clacupdate(vo);
	}

	@Override
	public int totalcalc() throws Exception {
		return posDao.totalcalc();
	}

	@Override
	public void salinsert(ItemVO vo) throws Exception {
		posDao.salinsert(vo);
		
	}

	@Override
	public void daycalcinser(ItemVO vo) throws Exception {
		posDao.daycalcinser(vo);
	}

	@Override
	public void calcdelete() throws Exception {
		posDao.calcdelete();
	}

	@Override
	public void hitupdate(ItemVO vo) throws Exception {
		posDao.hitupdate(vo);
	}

	@Override
	public String areaserch(ItemVO vo) throws Exception {
		return posDao.areaserch(vo);
	}
	
	@Override
	public List<ComItemVO> getCompanyList(Criteria cri) {
		return posDao.getCompanyList(cri);
	}

	@Override
	public int getCompanyCount() {
		return posDao.getCompanyCount();
	}

	//2016-11-15
	@Override
	public String getArea(String name) {
		return posDao.getArea(name);
	}

}
