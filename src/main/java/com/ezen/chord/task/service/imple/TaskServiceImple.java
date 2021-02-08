package com.ezen.chord.task.service.imple;

import java.text.SimpleDateFormat;

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
	
	/*업무글 등록(task table)*/
	@Override
	public int insertTaskService(TaskDTO taskDTO) {
		int result = taskDAO.insertTaskDAO(taskDTO);
		System.out.println(taskDTO.getTask_title()+"service");
		
		return result;
	}
	
	/*업무글 등록(담당자)*/
	@Override
	public int insertTaskPiService(TaskDTO taskDTO) {
		int result = taskDAO.insertTaskPiDAO(taskDTO);
		return result;
	}
	
	/*업무글 등록(시작일)*/
	@Override
	public int insertTaskStartDateService(TaskDTO taskDTO) {
		System.out.println(taskDTO.getTime_start_date()+"시작일");
		if(taskDTO.getTime_start_date() == null || taskDTO.getTime_start_date().equals("")) {
			taskDTO.setTime_start_date("1990-01-01");
			System.out.println(taskDTO.getTime_start_date()+" 시작일 바꾼거");
		}
		int result = taskDAO.insertTaskStartDateDAO(taskDTO);
		return result;
	}
	
	/*업무글 등록(마감일)*/
	@Override
	public int insertTaskEndDateService(TaskDTO taskDTO) {
		System.out.println(taskDTO.getTime_end_date()+"마감일");
		if(taskDTO.getTime_end_date() == null || taskDTO.getTime_end_date().equals("")) {
			taskDTO.setTime_end_date("1990-01-01");
			System.out.println(taskDTO.getTime_end_date()+" 마감일 바꾼거");
		}		
		int result = taskDAO.insertTaskEndDateDAO(taskDTO);
		
		return result;
	}
	
	/*업무글 등록(시작,마감일)*/
	@Override
	public int insertTaskDateService(TaskDTO taskDTO) {
		
		if(taskDTO.getTime_start_date() == null || taskDTO.getTime_start_date().equals("")) {
			taskDTO.setTime_start_date("1990-01-01");
			System.out.println(taskDTO.getTime_start_date()+" 시작일 바꾼거");
		}		
		if(taskDTO.getTime_end_date() == null || taskDTO.getTime_end_date().equals("")) {
			taskDTO.setTime_end_date("1990-01-01");
			System.out.println(taskDTO.getTime_end_date()+" 마감일 바꾼거");
		}
		int result = taskDAO.insertTaskDateDAO(taskDTO);
		return result;
	}
	
	/*업무글 등록(타임라인테이블)*/
	@Override
	public int insertTaskTimService(TaskDTO taskDTO) {
		int result = taskDAO.insertTaskTimDAO(taskDTO);
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
