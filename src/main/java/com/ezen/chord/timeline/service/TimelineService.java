package com.ezen.chord.timeline.service;

import java.util.List;

import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.timeline.dto.TimelineDTO;

public interface TimelineService {
	
	public int insertTim(TimelineDTO timDTO);
	
	public List<TimelineDTO> getTimelineByProNo(int pro_no,int page);
	
	public int updateTim(TimelineDTO timDTO);
	
	public int deleteTim(TimelineDTO timDTO);
	
	public ProjectUserDTO getPro(int pro_no,int mem_no);
	
}
