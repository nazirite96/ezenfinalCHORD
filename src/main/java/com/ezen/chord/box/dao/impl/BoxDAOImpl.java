package com.ezen.chord.box.dao.impl;

import java.sql.Date;
import java.util.ArrayList;
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
	
@Override
	public int insertBoxWhenMemJoin(int mem_no) {
		// TODO Auto-generated method stub
		BoxDTO box = new BoxDTO();
		java.sql.Date date = new Date(0);
		box.setBox_no(0);
		box.setMem_no(mem_no);
		box.setBox_date(date);
		List<String> boxList = new ArrayList<String>();
		boxList.add("디자인팀");
		boxList.add("개발팀");
		boxList.add("기획팀");
		boxList.add("중요");
		for( String boxName : boxList) {
			box.setBox_name(boxName);
			sqlMap.insert("insertBoxWhenMemJoin", box);
		}
		
		return 1;
	}
}
