package com.ezen.chord.timeline.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.project.dao.ProjectDAO;
import com.ezen.chord.project_user.dao.ProjectUserDAO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.reply.dao.ReplyDAO;
import com.ezen.chord.task.dao.TaskDAO;
import com.ezen.chord.task.dto.TaskDTO;
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
	@Autowired
	private ProjectUserDAO proUserDAO;
	@Autowired
	private TaskDAO taskDAO;

	@Override
	public int insertTim(TimelineDTO timDTO) {
		// TODO Auto-generated method stub
		return timDAO.insertTim(timDTO);
	}
		
	
	@Override
	public List<TimelineDTO> getTimelineByProNo(int pro_no, int page, int mem_no) {
		// TODO Auto-generated method stub
		List<TimelineDTO> list = timDAO.getTimelineByProNo(pro_no, page ,mem_no);
		for(int i = 0 ; i < list.size() ; i++) {
			list.get(i).setRepList(repDAO.selcetRepByTim_no(list.get(i).getTim_no()));
		}
		return list;
	}
	@Override
	public List<TimelineDTO> getCollection(int mem_no) {
		// TODO Auto-generated method stub
		List<TimelineDTO> list = timDAO.getCollection(mem_no);
		for(int i = 0 ; i < list.size() ; i++) {
			list.get(i).setRepList(repDAO.selcetRepByTim_no(list.get(i).getTim_no()));
		}
		return list;

	}
	
	@Override
	public List<TimelineDTO> getMyTimeline(int mem_no) {
		// TODO Auto-generated method stub
		List<TimelineDTO> list = timDAO.getMyTimeline(mem_no);
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
			result = timDAO.deleteTim(timDTO.getTim_no());
			break;
		case "schd":
			break;
		default:
			break;
		}
		
		
		
		return result;
	}
	
	@Override
	public List<FilesDTO> getFiles(int tim_no) {
		// TODO Auto-generated method stub
		return timDAO.getFiles(tim_no);
	}
	
	@Override
	public ProjectUserDTO getPro(int pro_no,int mem_no) {
		// TODO Auto-generated method stub
		return proUserDAO.selectProUserByProAndMem(pro_no, mem_no);
	}
	
	@Override
	public List<ProjectUserDTO> invitedProUserList(int pro_no) {
		// TODO Auto-generated method stub
		return proUserDAO.selectInvitedProUser(pro_no);
	}
	
	@Override
	public List<ProjectUserDTO> notInvitedProUserList(int pro_no, int com_no) {
		// TODO Auto-generated method stub
		return proUserDAO.selectNotInvitedProUser(pro_no, com_no);
	}
	
	@Override
	public TaskDTO getTask(int task_no) {
		// TODO Auto-generated method stub
		return taskDAO.getTaskDTO(task_no);
	}
	
	@Override
	public int getTimSeq() {
		// TODO Auto-generated method stub
		return timDAO.getTimSeq();
	}
	
	@Override
	public int deleteFix(int mem_no, int tim_no, int pro_no) {
		// TODO Auto-generated method stub
		return timDAO.deleteFix(mem_no, tim_no, pro_no);
	}
	@Override
	public int insertFix(int mem_no, int tim_no, int pro_no) {
		// TODO Auto-generated method stub
		return timDAO.insertFix(mem_no, tim_no, pro_no);
	}
	@Override
	public int deleteColl(int mem_no, int tim_no, int pro_no) {
		// TODO Auto-generated method stub
		return timDAO.deleteColl(mem_no, tim_no, pro_no);
	}
	@Override
	public int insertColl(int mem_no, int tim_no, int pro_no) {
		// TODO Auto-generated method stub
		return timDAO.insertColl(mem_no, tim_no, pro_no);
	}
}
