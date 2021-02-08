package com.ezen.chord.task.service;

import java.util.*;
import com.ezen.chord.task.dto.*;

public interface TaskService {
	
	/*업무 시퀀스 조회*/
	public int getTaskSeq();
	
	////////////////////////////////////////////////////////	
	/*업무글 등록(tasktable)*/
	public int insertTaskService(TaskDTO taskDTO);
	/*업무글 등록(담당자)*/
	public int insertTaskPiService(TaskDTO taskDTO);
	/*업무글 등록(시작일)*/
	public int insertTaskStartDateService(TaskDTO taskDTO);
	/*업무글 등록(마감일)*/
	public int insertTaskEndDateService(TaskDTO taskDTO);
	/*업무글 등록(시작,마감일)*/
	public int insertTaskDateService(TaskDTO taskDTO);
	/*업무글 등록(타임라인테이블)*/
	public int insertTaskTimService(TaskDTO taskDTO);
	////////////////////////////////////////////////////////
	
	/*업무글 수정*/
	public int updateTask(TaskDTO taskDTO);
	
	/*업무글 삭제*/
	public int deleteTask(TaskDTO taskDTO);
	
	
	
}
