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
	
	@Override
	public int updateTim(TimelineDTO timDTO) {
		// TODO Auto-generated method stub
		return timDAO.updateTim(timDTO);
	}
	@Override
	public int deleteTim(TimelineDTO timDTO) {
		// TODO Auto-generated method stub
		int result =0;
		switch (timDTO.getCont_kind()) {
		case "post":
			result = timDAO.deleteTim(timDTO.getTim_no());
			break;
		case "task":
			break;
		case "sch":
			break;
		default:
			break;
		}
		
		
		
		return result;
	}
	
}
