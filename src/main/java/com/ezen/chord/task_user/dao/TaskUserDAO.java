package com.ezen.chord.task_user.dao;

import java.util.List;

import com.ezen.chord.task_user.dto.TaskUserDTO;

public interface TaskUserDAO {

	/*업무글의 지정자 목록 조회*/
	List<TaskUserDTO> getTaskUserList(int task_no);
}
