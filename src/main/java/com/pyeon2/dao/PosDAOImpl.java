package com.pyeon2.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pyeon2.domain.Criteria;
import com.pyeon2.vo.ItemVO;
import com.pyeon2.vo.MemberVO;
import com.pyeon2.vo.SelectSearch;
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
	public List<ItemVO> getList(Criteria cri) throws Exception {
		return session.selectList(namespace + ".getList", cri);
	}

	@Override
	public List<ItemVO> selectName(SelectSearch ss) throws Exception {
		return session.selectList(namespace + ".selectName", ss);
	}

	@Override
	public void Delete(ItemVO vo) throws Exception {
		session.delete(namespace + ".Delete", vo);		
	}

	
	@Override
	public List<UserVO> selectalpayAll(UserVO vo) throws Exception {
		return session.selectList(namespace +".selectalpayAll", vo);
	}

	@Override
	public List<UserVO> selectalpay(UserVO vo) throws Exception {
		return session.selectList(namespace +".selectalpay", vo);
	}

	@Override
	public List<UserVO> selectmanpayAll(UserVO vo) throws Exception {
		return session.selectList(namespace +".selectmanpayAll", vo);
	}

	@Override
	public List<UserVO> selectmanpay(UserVO vo) throws Exception {
		return session.selectList(namespace +".selectmanpay", vo);
	}
	
	@Override
	public int getCount() {
		return session.selectOne(namespace +".getCount");
	}

	@Override
	public int getSelectCount(ItemVO vo) {
		return session.selectOne(namespace +".getSelectCount", vo);
	}

	@Override
	public List<MemberVO> selectUser(MemberVO Mvo) throws Exception {
		return session.selectList(namespace + ".selectUser", Mvo);
	}

	@Override
	public List<MemberVO> selectUserId(MemberVO Mvo) throws Exception {
		return session.selectList(namespace + ".selectUserId", Mvo);
	}

	@Override
	public void updateUser(MemberVO Mvo) throws Exception {
		session.update(namespace + ".updateUser", Mvo);
	}

	@Override
	public void deleteUser(MemberVO Mvo) throws Exception {
		session.delete(namespace + ".deleteUser", Mvo);
	}

	@Override
	public void deleteRole(MemberVO Mvo) throws Exception {
		session.delete(namespace + ".deleteRole", Mvo);
	}

	@Override
	public void insertUser(MemberVO Mvo) throws Exception {
		session.insert(namespace + ".insertUser", Mvo);
	}

	@Override
	public void insertPosition(MemberVO Mvo) throws Exception {
		session.insert(namespace + ".insertPosition", Mvo);
	}

}
