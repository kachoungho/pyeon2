package com.pyeon2.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;

@Repository
public class CompanyDAOImpl implements CompanyDAO{

	@Autowired
	private SqlSession session;
	
	private static String namespace="com.pyeon2.mappers.CompanyMapper";
	
	@Override
	public List<ItemVO> orderList() throws Exception {
		return session.selectList(namespace + ".orderList");
	}

	@Override
	public void updateItemCount(ItemVO vo) throws Exception {
		session.update(namespace + ".updateItemCount", vo);
	}

	@Override
	public void odertDelete(ItemVO vo) throws Exception {
		session.delete(namespace + ".odertDelete", vo);
	}

	@Override
	public List<MemberVO> getAdminMember() throws Exception {
		return session.selectList(namespace + ".getAdminMember");
	}

	@Override
	public List<MemberVO> getPSMember(MemberVO Mvo) throws Exception {
		return session.selectList(namespace + ".getPSMember", Mvo);
	}

	@Override
	public void insertAdminMember(MemberVO Mvo) throws Exception {
		session.insert(namespace + ".insertAdminMember", Mvo);
	}

	@Override
	public void insertPosition(MemberVO Mvo) throws Exception {
		session.insert(namespace + ".insertPosition", Mvo);
	}

}
