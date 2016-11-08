package com.pyeon2.dao;

import com.pyeon2.vo.MemberVO;

public interface MemberDAO {
	
	public MemberVO getMember(String id) throws Exception;
}
