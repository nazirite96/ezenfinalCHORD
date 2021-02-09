package com.ezen.chord.schedule.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.schedule.dao.SchdDAO;
import com.ezen.chord.schedule.dto.SchdDTO;

@Repository
public class SchdDAOImpl implements SchdDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	@Override
	public int getSchdSeq() {
		// TODO Auto-generated method stub
		int result = sqlMap.selectOne("getSchdSeq");
		return result;
	}
	@Override
	public int insertSchd(SchdDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("insertSchd",dto);
		return result;
	}
	@Override
	public int insertParti(SchdDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("insertParti");
		return result;
	}
	@Override
	public int insertTime(SchdDTO dto) {
		// TODO Auto-generated method stub
		int result = sqlMap.insert("insertSchdulDate",dto);
		return result;
	}
	@Override
	public int insertTimeLine(SchdDTO dto) {
		// TODO Auto-generated method stub
		int result= sqlMap.insert("insertTimeLine", dto);
		return result;
	}
	
}
