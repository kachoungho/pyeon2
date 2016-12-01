package com.pyeon2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.dao.CompanyDAO;
import com.pyeon2.vo.ItemVO;

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

}
