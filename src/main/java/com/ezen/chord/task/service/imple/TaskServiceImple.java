package com.ezen.chord.task.service.imple;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.task.dao.TaskDAO;
import com.ezen.chord.task.dto.TaskDTO;
import com.ezen.chord.task.service.TaskService;


@Service
public class TaskServiceImple implements TaskService {
	
	@Autowired
	private TaskDAO taskDAO;
	
	@Inject
	

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
		System.out.println(taskDTO.getTask_start_date()+"시작일");
		if(taskDTO.getTask_start_date() == null || taskDTO.getTask_start_date().equals("")) {
			taskDTO.setTask_start_date("1990-01-01");
			System.out.println(taskDTO.getTask_start_date()+" 시작일 바꾼거(insert)");
		}
		int result = taskDAO.insertTaskStartDateDAO(taskDTO);
		return result;
	}
	
	/*업무글 등록(마감일)*/
	@Override
	public int insertTaskEndDateService(TaskDTO taskDTO) {
		System.out.println(taskDTO.getTask_end_date()+"마감일");
		if(taskDTO.getTask_end_date() == null || taskDTO.getTask_end_date().equals("")) {
			taskDTO.setTask_end_date("1990-01-01");
			System.out.println(taskDTO.getTask_end_date()+" 마감일 바꾼거(insert)");
		}		
		int result = taskDAO.insertTaskEndDateDAO(taskDTO);
		
		return result;
	}
	
	/*업무글 등록(시작,마감일)*/
	@Override
	public int insertTaskDateService(TaskDTO taskDTO) {
		
		if(taskDTO.getTask_start_date() == null || taskDTO.getTask_start_date().equals("")) {
			taskDTO.setTask_start_date("1990-01-01");
			System.out.println(taskDTO.getTask_start_date()+" 시작일 바꾼거");
		}		
		if(taskDTO.getTask_end_date() == null || taskDTO.getTask_end_date().equals("")) {
			taskDTO.setTask_end_date("1990-01-01");
			System.out.println(taskDTO.getTask_end_date()+" 마감일 바꾼거");
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
	
	/*업무글 수정(task table)*/
	@Override
	public int updateTaskService(TaskDTO taskDTO) {
		int result = taskDAO.updateTaskDAO(taskDTO);
		return result;
	}
	/*업무글 등록(담당자)*/
	@Override
	public int updateTaskPiService(TaskDTO taskDTO) {
		int result = taskDAO.updateTaskPiDAO(taskDTO);
		return result;
	}
	/*업무글 수정(시작일)*/
	@Override
	public int updateTaskStartDateService(TaskDTO taskDTO) {
		
		if(taskDTO.getTask_start_date() == null || taskDTO.getTask_start_date().equals("")) {
			taskDTO.setTask_start_date("1990-01-01");
			System.out.println(taskDTO.getTask_start_date()+" 시작일 바꾼거(update)");
		}		
		int result = taskDAO.updateTaskStartDateDAO(taskDTO);
		return result;
	}
	/*업무글 수정(마감일)*/
	@Override
	public int updateTaskEndDateService(TaskDTO taskDTO) {
		if(taskDTO.getTask_end_date() == null || taskDTO.getTask_end_date().equals("")) {
			taskDTO.setTask_end_date("1990-01-01");
			System.out.println(taskDTO.getTask_end_date()+" 마감일 바꾼거(update)");
		}		
		int result = taskDAO.updateTaskEndDateDAO(taskDTO);
		return result;
	}
	/*업무글 수정(타임라인테이블)*/
	@Override
	public int updateTaskTimService(TaskDTO taskDTO) {
		int result = taskDAO.updateTaskTimDAO(taskDTO);
		return result;
	}
	
	/*전체업무 조회*/
	@Override
	public List<TaskDTO> selectAllTask() {
		
		// 반환값
		List<TaskDTO> resultList = new ArrayList<TaskDTO>();
		
		// 업무글
		List<TaskDTO> taskList = taskDAO.selectAllTask();
		
		for (TaskDTO taskDTO : taskList) {
			String task_start_date = taskDTO.getTask_start_date().substring(0, 10);
			String task_end_date = taskDTO.getTask_end_date().substring(0, 10);
			
			if(task_start_date.equals("1990-01-01")) {
				taskDTO.setTask_start_date("");
				taskDTO.setTask_end_date(task_end_date);
			}
			if(task_end_date.equals("1990-01-01")) {
				taskDTO.setTask_start_date(task_start_date);
				taskDTO.setTask_end_date("");
			}
			
			if(!task_start_date.equals("1990-01-01") && !task_end_date.equals("1990-01-01")){
				taskDTO.setTask_start_date(task_start_date);
				taskDTO.setTask_end_date(task_end_date);
			}
			
			resultList.add(taskDTO);
		}
		
		return resultList;
	}
	
	@Override
	public int deleteTaskUserService(int cont_no) {
		int result = taskDAO.deleteTaskUserDAO(cont_no);
		return result;
	}
	
	@Override
	public List<ProjectUserDTO> tu_mem_list(int task_no) {
		List<ProjectUserDTO> tu_mem_list = taskDAO.tu_mem_list(task_no);
		return tu_mem_list;
	}
	
	/*업무글 삭제*/
	@Override
	public int deleteTask(TaskDTO taskDTO) {
		return taskDAO.deleteTask(taskDTO);
	}
}
