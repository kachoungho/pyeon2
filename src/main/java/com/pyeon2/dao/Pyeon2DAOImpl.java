package com.pyeon2.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pyeon2.vo.ItemVO;



@Repository
public class Pyeon2DAOImpl implements Pyeon2DAO {

	@Inject
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

}
