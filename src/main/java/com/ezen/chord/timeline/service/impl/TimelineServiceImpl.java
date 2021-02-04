package com.ezen.chord.timeline.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.project.dao.ProjectDAO;
import com.ezen.chord.project.dto.ProjectDTO;
import com.ezen.chord.reply.dao.ReplyDAO;
import com.ezen.chord.timeline.dao.TimelineDAO;
import com.ezen.chord.timeline.dto.TimelineDTO;
import com.ezen.chord.timeline.service.TimelineService;

@Service
public class TimelineServiceImpl implements TimelineService {
	
	@Autowired
	private TimelineDAO timDAO;
	@Autowired
	private ReplyDAO repDAO;
	@Autowired
	private ProjectDAO proDAO;

	@Override
	public int insertTim(TimelineDTO timDTO) {
		// TODO Auto-generated method stub
		return timDAO.insertTim(timDTO);
	}
		
	
	@Override
	public List<TimelineDTO> getTimelineByProNo(int pro_no, int page) {
		// TODO Auto-generated method stub
		List<TimelineDTO> list = timDAO.getTimelineByProNo(pro_no, page);
		for(int i = 0 ; i < list.size() ; i++) {
			list.get(i).setRepList(repDAO.selcetRepByTim_no(list.get(i).getTim_no()));
		}
		return list;
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
	
	@Override
	public ProjectDTO getPro(int pro_no) {
		// TODO Auto-generated method stub
		return proDAO.getPro(pro_no);
	}
	
	
	
}
