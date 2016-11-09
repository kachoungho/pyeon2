package com.pyeon2.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.vo.ItemVO;



@Repository
public class Pyeon2DAOImpl implements Pyeon2DAO {

	@Autowired
	private SqlSession session;
	
	private static String namespace1="com.pyeon2.mappers.OrderMapper";
	private static String namespace2="com.lws.dao.ItemMapper";
	
	
	@Override
	public void insertOrder(ItemVO vo) throws Exception {
		session.insert(namespace1 + ".insertOrder", vo);

	}
	
	@Override
	public List<ItemVO> getList() throws Exception{
		
		return session.selectList(namespace2 + ".getList");
	}
	
	
	@Override
	public void Delete(ItemVO vo) {
		session.delete(namespace2 + ".Delete", vo);
	}


	@Override
	public List<ItemVO> selectName(ItemVO vo) {
		return session.selectList(namespace2 + ".selectName", vo);
	}
	
	
	@Override
	public List<ItemVO> orderList() throws Exception {
		return session.selectList(namespace1 + ".orderList");
	}


	@Override
	public void updateItemCount(ItemVO vo) throws Exception {
		session.update(namespace1 + ".updateItemCount", vo);
	}


	@Override
	public void odertDelete(ItemVO vo) throws Exception {
		session.delete(namespace1 + ".odertDelete", vo);
	}

}
