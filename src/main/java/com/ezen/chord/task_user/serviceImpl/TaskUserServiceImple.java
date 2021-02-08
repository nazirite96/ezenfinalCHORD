package com.ezen.chord.task_user.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.task_user.dao.TaskUserDAO;
import com.ezen.chord.task_user.dto.TaskUserDTO;
import com.ezen.chord.task_user.service.TaskUserService;

@Repository
public class TaskUserServiceImple implements TaskUserService {
	
	@Inject
	private TaskUserDAO taskUserDAO;	
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public TaskUserServiceImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	/*업무글의 지정자 목록 조회*/
	@Override
	public List<TaskUserDTO> getTaskUserList(int task_no) {
		List<TaskUserDTO> result = taskUserDAO.getTaskUserList(task_no);
		return result;
	}
}
