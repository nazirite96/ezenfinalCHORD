package com.ezen.chord.task.service;

import java.util.*;
import com.ezen.chord.task.dto.*;

public interface TaskService {
	
	/*업무 시퀀스 조회*/
	public int getTaskSeq();
	
	/*업무글 등록*/
	public int insertTaskService(TaskDTO taskDTO);
	
	/*업무글 수정*/
	public int updateTask(TaskDTO taskDTO);
	
	/*업무글 삭제*/
	public int deleteTask(TaskDTO taskDTO);
	
	
	
}
