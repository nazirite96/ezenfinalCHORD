package com.ezen.chord.task.service.imple;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.task.dao.TaskDAO;
import com.ezen.chord.task.dto.TaskDTO;
import com.ezen.chord.task.service.TaskService;


@Service
public class TaskServiceImple implements TaskService {
	
	@Inject
	private TaskDAO taskDAO;
	
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public TaskServiceImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	/*업무 시퀀스 조회*/
	@Override
	public int getTaskSeq() {
		return taskDAO.getTaskSeq();
	}
	
	/*업무글 등록*/
	@Override
	public int insertTask(TaskDTO taskDTO) {
		return taskDAO.insertTask(taskDTO);
	}
	
	/*업무글 수정*/
	@Override
	public int updateTask(TaskDTO taskDTO) {
		return taskDAO.updateTask(taskDTO);
	}
	
	/*업무글 삭제*/
	@Override
	public int deleteTask(TaskDTO taskDTO) {
		return taskDAO.deleteTask(taskDTO);
	}
}
