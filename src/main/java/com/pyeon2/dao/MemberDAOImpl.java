package com.pyeon2.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO getMember(String id) throws Exception {
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		return memberDAO.getMember(id);
	}

}
