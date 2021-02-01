package com.ezen.chord.timeline.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.timeline.dao.TimelineDAO;
import com.ezen.chord.timeline.dto.TimelineDTO;
import com.ezen.chord.timeline.service.TimelineService;

@Service
public class TimelineServiceImpl implements TimelineService {
	
	@Autowired
	private TimelineDAO timDAO;

	@Override
	public int insertTim(TimelineDTO timDTO) {
		// TODO Auto-generated method stub
		return timDAO.insertTim(timDTO);
	}
	
	@Override
	public List<TimelineDTO> getTimelineByProNo(int pro_no, int page) {
		// TODO Auto-generated method stub
		return timDAO.getTimelineByProNo(pro_no, page);
	}

}
