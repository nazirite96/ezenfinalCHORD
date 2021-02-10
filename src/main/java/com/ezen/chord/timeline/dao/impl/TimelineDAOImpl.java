package com.ezen.chord.timeline.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.timeline.dao.TimelineDAO;
import com.ezen.chord.timeline.dto.TimelineDTO;

@Repository
public class TimelineDAOImpl implements TimelineDAO{
	
	
	@Autowired
	private SqlSessionTemplate sqlmap;
	
	@Override
	public int insertTim(TimelineDTO timDTO) {
		// TODO Auto-generated method stub
		return sqlmap.insert("insertTim", timDTO);
	}
	
	@Override
	public List<TimelineDTO> getTimelineByProNo(int pro_no, int page) {
		// TODO Auto-generated method stub
		Map<String,Integer> map = new HashMap();
		map.put("pro_no", pro_no);
		map.put("page", page);
		
		return sqlmap.selectList("getTimelinByProNo", map);
	}
	
	@Override
	public int updateTim(TimelineDTO timDTO) {
		// TODO Auto-generated method stub
		return sqlmap.update("updateTim", timDTO);
	}
	
	@Override
	public int deleteTim(int tim_no) {
		// TODO Auto-generated method stub
		return sqlmap.delete("deleteTim", tim_no);
	}
	
	@Override
	public int getTimSeq() {
		// TODO Auto-generated method stub
		return sqlmap.selectOne("getTimSeq");
	}
}
