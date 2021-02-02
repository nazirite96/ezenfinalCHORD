package com.ezen.chord.task.dao;

import com.ezen.chord.task.dto.TaskDTO;

public interface TaskDAO {
	/*업무 시퀀스 조회*/
	public int getTaskSeq();
	
	/*업무글 등록*/
	public int insertTaskDAO(TaskDTO taskDTO);
	
	/*업무글 수정*/
	public int updateTask(TaskDTO taskDTO);
	
	/*업무글 삭제*/
	public int deleteTask(TaskDTO taskDTO);
}
