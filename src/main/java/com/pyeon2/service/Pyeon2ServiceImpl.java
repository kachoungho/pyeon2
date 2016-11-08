package com.pyeon2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.dao.Pyeon2DAO;
import com.pyeon2.vo.ItemVO;

@Repository
public class Pyeon2ServiceImpl implements Pyeon2Service {
	
	@Autowired
	private Pyeon2DAO dao;

	@Override
	public void insertOrder(ItemVO vo) throws Exception {
		dao.insertOrder(vo);
	}

	@Override
	public List<ItemVO> getList() throws Exception {
		return dao.getList();
	}

	@Override
	public List<ItemVO> selectName(ItemVO vo) throws Exception {
		return dao.selectName(vo);
	}

	@Override
	public void Delete(ItemVO vo) throws Exception {
		dao.Delete(vo);
	}

}
