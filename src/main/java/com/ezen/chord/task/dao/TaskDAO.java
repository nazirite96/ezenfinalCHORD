package com.ezen.chord.task.dao;

import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.task.dto.TaskDTO;
import java.util.*;

public interface TaskDAO {
	
	/*업무 시퀀스 조회*/
	public int getTaskSeq();
	
	////////////////////////////////////////////////////////
	/*업무글 등록(tasktable)*/
	public int insertTaskDAO(TaskDTO taskDTO);
	/*업무글 등록(담당자)*/
	public int insertTaskPiDAO(TaskDTO taskDTO);
	public int insertTaskPic(int cont_no,int partic_no);
	/*업무글 등록(시작일)*/
	public int insertTaskStartDateDAO(TaskDTO taskDTO);
	/*업무글 등록(마감일)*/
	public int insertTaskEndDateDAO(TaskDTO taskDTO);
	/*업무글 등록(시작,마감일)*/
	public int insertTaskDateDAO(TaskDTO taskDTO);
	/*업무글 등록(타임라인테이블)*/
	public int insertTaskTimDAO(TaskDTO taskDTO);
	////////////////////////////////////////////////////////
	
	////////////////////////////////////////////////////////
	/*업무글 수정(task table)*/
	public int updateTaskDAO(TaskDTO taskDTO);
	/*업무글 수정(담당자)*/
	public int updateTaskPiDAO(TaskDTO taskDTO);
	/*업무글 수정(시작일)*/
	public int updateTaskStartDateDAO(TaskDTO taskDTO);
	/*업무글 수정(마감일)*/
	public int updateTaskEndDateDAO(TaskDTO taskDTO);
	/*업무글 수정(타임라인테이블)*/
	public int updateTaskTimDAO(TaskDTO taskDTO);	
	////////////////////////////////////////////////////////	
	
	/*전체업무 조회*/
	public List<TaskDTO> selectAllTask();
	
	public int updateTask(TaskDTO taskDTO);
	
	/*업무글 삭제*/
	public int deleteTask(int cont_no);
	
	public int deleteTaskTime(int cont_no);
	
	/*업무 지정자 삭제*/
	public int deleteTaskUserDAO(int cont_no);
	
	public TaskDTO getTaskDTO(int task_no);
	
	public List<ProjectUserDTO> tu_mem_list(int task_no);
	
}
