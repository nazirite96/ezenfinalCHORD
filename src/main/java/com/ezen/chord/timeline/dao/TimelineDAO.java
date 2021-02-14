package com.ezen.chord.timeline.dao;

import java.util.List;

import com.ezen.chord.timeline.dto.TimelineDTO;

public interface TimelineDAO {
	
	
	public int insertTim(TimelineDTO timDTO);
	
	public List<TimelineDTO> getTimelineByProNo(int pro_no,int page);
	
	public int updateTim(TimelineDTO timDTO);
	
	public int deleteTim(int tim_no);
	
	public int getTimSeq();
	
	
	
	
}
