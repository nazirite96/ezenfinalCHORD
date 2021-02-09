package com.ezen.chord.task_user.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.task_user.dao.TaskUserDAO;
import com.ezen.chord.task_user.dto.TaskUserDTO;

@Repository
public class TaskUserDAOImple implements TaskUserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;

	public TaskUserDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	

}
