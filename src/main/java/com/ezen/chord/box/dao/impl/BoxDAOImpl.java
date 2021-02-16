package com.ezen.chord.box.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.box.dao.BoxDAO;
import com.ezen.chord.box.dto.BoxDTO;

@Repository
public class BoxDAOImpl implements BoxDAO{
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public List<BoxDTO> selectBox(int mem_no) {
		// TODO Auto-generated method stub
		return sqlMap.selectList("selectBox", mem_no);
	}
	
	@Override
	public int insertBox(BoxDTO boxDTO) {
		// TODO Auto-generated method stub
		return sqlMap.insert("insertBox", boxDTO);
	}
	
	@Override
	public List<BoxDTO> selectBoxJoinBoxPro(int mem_no, int pro_no) {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("mem_no", mem_no);
		map.put("pro_no", pro_no);
		return sqlMap.selectList("selectBoxJoinBoxPro", map);
		
	}
}
