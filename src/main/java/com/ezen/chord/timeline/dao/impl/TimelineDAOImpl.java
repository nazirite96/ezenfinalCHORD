package com.ezen.chord.timeline.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.files.dto.FilesDTO;
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
	public List<TimelineDTO> getTimelineByProNo(int pro_no, int page,int mem_no) {
		// TODO Auto-generated method stub
		Map<String,Integer> map = new HashMap();
		map.put("pro_no", pro_no);
		map.put("mem_no", mem_no);
		map.put("page", page);
		
		return sqlmap.selectList("getTimelinByProNo", map);
	}
	@Override
	public List<TimelineDTO> getCollection(int mem_no) {
		// TODO Auto-generated method stub
		return sqlmap.selectList("getCollection", mem_no);
	}
	@Override
	public List<TimelineDTO> getMyTimeline(int mem_no) {
		// TODO Auto-generated method stub
		return sqlmap.selectList("getMyTimeline", mem_no);
	}
	@Override
	public List<FilesDTO> getFiles(int tim_no) {
		// TODO Auto-generated method stub
		return sqlmap.selectList("getFiles", tim_no);
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
	
	@Override
	public int deleteFix(int mem_no, int tim_no, int pro_no) {
		// TODO Auto-generated method stub
		return sqlmap.delete("deleteFix", tim_no);
	}
	
	@Override
	public int insertFix(int mem_no, int tim_no, int pro_no) {
		// TODO Auto-generated method stub
		return sqlmap.insert("insertFix", tim_no);
	}
	
	@Override
	public int deleteColl(int mem_no, int tim_no, int pro_no) {
		// TODO Auto-generated method stub
		Map<String,Integer> map = new HashMap();
		map.put("tim_no", tim_no);
		map.put("mem_no", mem_no);
		return sqlmap.delete("deleteColl", map);
	}
	
	@Override
	public int insertColl(int mem_no, int tim_no, int pro_no) {
		// TODO Auto-generated method stub
		Map<String,Integer> map = new HashMap();
		map.put("tim_no", tim_no);
		map.put("mem_no", mem_no);
		return sqlmap.insert("insertColl", map);
	}
}
