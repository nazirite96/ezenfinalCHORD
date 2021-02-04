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
	public int insertTaskService(TaskDTO taskDTO) {
		int result = taskDAO.insertTaskDAO(taskDTO);
		System.out.println(taskDTO.getTask_title()+"service");
		System.out.println(taskDTO.getTime_kind()+"service단테스트");
		String time_kind = taskDTO.getTime_kind();
		String[] time_kind_s = time_kind.split(",");
		String test = time_kind_s[0];
		System.out.println(test+"service단");
		
		
		return result;
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
