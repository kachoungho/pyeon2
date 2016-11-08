package com.pyeon2.service;

import java.util.List;

import com.pyeon2.vo.ItemVO;

public interface Pyeon2Service {
	public void insertOrder(ItemVO vo) throws Exception;
	public List<ItemVO> getList() throws Exception;
	public List<ItemVO> selectName(ItemVO vo) throws Exception;
	public void Delete(ItemVO vo) throws Exception;
}
