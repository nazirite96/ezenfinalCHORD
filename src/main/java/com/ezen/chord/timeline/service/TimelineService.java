package com.ezen.chord.timeline.service;

import java.util.List;

import com.ezen.chord.files.dto.FilesDTO;
import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.task.dto.TaskDTO;
import com.ezen.chord.timeline.dto.TimelineDTO;

public interface TimelineService {
	
	public int insertTim(TimelineDTO timDTO);
	
	public List<TimelineDTO> getTimelineByProNo(int pro_no,int page,int mem_no);
	public List<TimelineDTO> getCollection(int mem_no);
	public List<TimelineDTO> getMyTimeline(int mem_no);
	
	public int updateTim(TimelineDTO timDTO);
	
	public int deleteTim(TimelineDTO timDTO);
	
	public ProjectUserDTO getPro(int pro_no,int mem_no);
	
	public List<ProjectUserDTO> invitedProUserList(int pro_no);
	
	public List<ProjectUserDTO> notInvitedProUserList(int pro_no,int com_no);
	
	public TaskDTO getTask(int task_no);
	
	public int getTimSeq();
	
	public int insertFix(int mem_no,int tim_no,int pro_no);
	
	public int deleteFix(int mem_no,int tim_no,int pro_no);
	
	public int insertColl(int mem_no,int tim_no,int pro_no);
	
	public int deleteColl(int mem_no,int tim_no,int pro_no);
	
	public List<FilesDTO> getFiles(int tim_no);
}
