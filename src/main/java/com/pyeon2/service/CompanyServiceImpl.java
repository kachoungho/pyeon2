package com.pyeon2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.dao.CompanyDAO;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;

@Repository
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyDAO comDao;
	
	@Override
	public List<ItemVO> orderList() throws Exception {
		return comDao.orderList();	
	}

	@Override
	public void updateItemCount(ItemVO vo) throws Exception {
		comDao.updateItemCount(vo);
	}

	@Override
	public void odertDelete(ItemVO vo) throws Exception {
		comDao.odertDelete(vo);
	}

	@Override
	public List<MemberVO> getAdminMember() throws Exception {
		return comDao.getAdminMember();
	}

	@Override
	public List<MemberVO> getPSMember(MemberVO Mvo) throws Exception {
		return comDao.getPSMember(Mvo);
	}

	@Override
	public void insertAdminMember(MemberVO Mvo) throws Exception {
		comDao.insertAdminMember(Mvo);
	}

	@Override
	public void insertPosition(MemberVO Mvo) throws Exception {
		comDao.insertPosition(Mvo);
	}

	@Override
	public List<ItemVO> areaItemList(ItemVO vo) throws Exception {
		return comDao.areaItemList(vo);
	}

}
