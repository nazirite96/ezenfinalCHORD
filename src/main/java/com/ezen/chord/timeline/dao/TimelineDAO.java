package com.ezen.chord.timeline.dao;

import java.util.List;

import com.ezen.chord.timeline.dto.TimelineDTO;

public interface TimelineDAO {
	
	
	public int insertTim(TimelineDTO timDTO);
	
	public List<TimelineDTO> getTimelineByProNo(int pro_no,int page,int mem_no);
	public List<TimelineDTO> getCollection(int mem_no);
	
	public int updateTim(TimelineDTO timDTO);
	
	public int deleteTim(int tim_no);
	
	public int getTimSeq();
	
	public int insertFix(int mem_no,int tim_no,int pro_no);
	
	public int deleteFix(int mem_no,int tim_no,int pro_no);
	
	public int insertColl(int mem_no,int tim_no,int pro_no);
	
	public int deleteColl(int mem_no,int tim_no,int pro_no);
	
	
}
