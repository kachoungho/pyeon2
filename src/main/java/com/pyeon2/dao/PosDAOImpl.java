package com.pyeon2.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.UserVO;

@Repository
public class PosDAOImpl implements PosDAO{

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.pyeon2.mappers.PosMapper";

	@Override
	public void insertOrder(ItemVO vo) throws Exception {
		session.insert(namespace + ".insertOrder", vo);
	}

	@Override
	public List<ItemVO> getList() throws Exception {
		return session.selectList(namespace + ".getList");
	}

	@Override
	public List<ItemVO> selectName(ItemVO vo) throws Exception {
		return session.selectList(namespace + ".selectName", vo);
	}

	@Override
	public void Delete(ItemVO vo) throws Exception {
		session.delete(namespace + ".Delete", vo);		
	}

	
	/*
	@Override
	public List<UserVO> usermoney(UserVO vo) throws Exception {
		return session.selectList(namespace+".usermoney",vo);
	}	

	@Override
	public List<UserVO> usermoneyM(MemberVO Mvo) throws Exception {
		return session.selectList(namespace+".usermoneyM",Mvo);
	}
	*/
}
