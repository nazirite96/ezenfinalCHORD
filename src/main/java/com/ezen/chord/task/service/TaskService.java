package com.ezen.chord.task.service;

import java.util.*;

import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.task.dto.*;

public interface TaskService {
	
	/*업무 시퀀스 조회*/
	public int getTaskSeq();
	
	////////////////////////////////////////////////////////	
	/*업무글 등록(task table)*/
	public int insertTaskService(TaskDTO taskDTO);
	/*업무글 등록(담당자)*/
	public int insertTaskPiService(TaskDTO taskDTO);
	public int insertTaskPic(int cont_no,int partic_no);
	/*업무글 등록(시작일)*/
	public int insertTaskStartDateService(TaskDTO taskDTO);
	/*업무글 등록(마감일)*/
	public int insertTaskEndDateService(TaskDTO taskDTO);
	/*업무글 등록(시작,마감일)*/
	public int insertTaskDateService(TaskDTO taskDTO);
	/*업무글 등록(타임라인테이블)*/
	public int insertTaskTimService(TaskDTO taskDTO);
	////////////////////////////////////////////////////////
	
	////////////////////////////////////////////////////////
	/*업무글 수정(task table)*/
	public int updateTaskService(TaskDTO taskDTO);
	/*업무글 수정(담당자)*/
	public int updateTaskPiService(TaskDTO taskDTO);
	/*업무글 수정(시작일)*/
	public int updateTaskStartDateService(TaskDTO taskDTO);
	/*업무글 수정(마감일)*/
	public int updateTaskEndDateService(TaskDTO taskDTO);
	/*업무글 수정(타임라인테이블)*/
	public int updateTaskTimService(TaskDTO taskDTO);	
	////////////////////////////////////////////////////////	
	
	
	/*전체업무 조회*/
	List<Map<String, Object>> selectAllTask();
	
	/*지정 담당자 삭제*/
	public int deleteTaskUserService(int cont_no);
	
	/*업무글 삭제*/
	public int deleteTask(int cont_no);
	
	public List<ProjectUserDTO> tu_mem_list(int task_no);
	
	
	
	
}
