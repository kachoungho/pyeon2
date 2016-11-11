package com.pyeon2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.dao.PosDAO;
import com.pyeon2.vo.ItemVO;
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
	public List<ItemVO> getList() throws Exception {
		return posDao.getList();
	}

	@Override
	public List<ItemVO> selectName(ItemVO vo) throws Exception {
		return posDao.selectName(vo);
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

}
