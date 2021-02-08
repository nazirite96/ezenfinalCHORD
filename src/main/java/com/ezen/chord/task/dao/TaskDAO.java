package com.ezen.chord.task.dao;

import com.ezen.chord.task.dto.TaskDTO;

public interface TaskDAO {
	
	/*업무 시퀀스 조회*/
	public int getTaskSeq();
	
	////////////////////////////////////////////////////////
	/*업무글 등록(tasktable)*/
	public int insertTaskDAO(TaskDTO taskDTO);
	/*업무글 등록(담당자)*/
	public int insertTaskPiDAO(TaskDTO taskDTO);
	/*업무글 등록(시작일)*/
	public int insertTaskStartDateDAO(TaskDTO taskDTO);
	/*업무글 등록(마감일)*/
	public int insertTaskEndDateDAO(TaskDTO taskDTO);
	/*업무글 등록(시작,마감일)*/
	public int insertTaskDateDAO(TaskDTO taskDTO);
	/*업무글 등록(타임라인테이블)*/
	public int insertTaskTimDAO(TaskDTO taskDTO);
	////////////////////////////////////////////////////////
	
	
	/*업무글 수정*/
	public int updateTask(TaskDTO taskDTO);
	
	/*업무글 삭제*/
	public int deleteTask(TaskDTO taskDTO);
}
