package com.ezen.chord.task.dao.imple;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.task.dao.TaskDAO;
import com.ezen.chord.task.dto.TaskDTO;

@Repository("taskDAO")
public class TaskDAOImple implements TaskDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	@Override
	public int getTaskSeq() {
		return sqlMap.selectOne("getTaskSeq");
	}
	
	/*업무글 등록(task table)*/
	@Override
	public int insertTaskDAO(TaskDTO taskDTO) {
		int result = sqlMap.insert("insertTask", taskDTO);
		System.out.println(taskDTO.getTask_title()+"dao부분");
		return result;
	}
	
	/*업무글 등록(담당자)*/
	@Override
	public int insertTaskPiDAO(TaskDTO taskDTO) {
		int result = sqlMap.insert("insertTaskPi", taskDTO);
		System.out.println(taskDTO.getMem_no()+"dao부분");
		return result;
	}
	
	/*업무글 등록(시작일)*/
	@Override
	public int insertTaskStartDateDAO(TaskDTO taskDTO) {
		int result = sqlMap.insert("insertTaskStartDate", taskDTO);
		System.out.println(taskDTO.getTask_start_date()+"dao부분");

		return result;
	}

	
	/*업무글 등록(마감일)*/
	@Override
	public int insertTaskEndDateDAO(TaskDTO taskDTO) {
		int result = sqlMap.insert("insertTaskEndDate", taskDTO);
		System.out.println(taskDTO.getTask_end_date()+"dao부분");
		return result;
	}
	
	/*업무글 등록(시작,마감일)*/
	@Override
	public int insertTaskDateDAO(TaskDTO taskDTO) {
		int result = sqlMap.insert("insertTaskDate", taskDTO);
		System.out.println(taskDTO.getTask_start_date()+"dao부분,s");
		System.out.println(taskDTO.getTask_end_date()+"dao부분,e");
		return result;
	}
	
	/*업무글 등록(타임라인테이블)*/	
	@Override
	public int insertTaskTimDAO(TaskDTO taskDTO) {
		int result = sqlMap.insert("insertTaskTim", taskDTO);
		
		return result;
	}
	
	/*전체업무 조회*/
	@Override
	public List<TaskDTO> selectAllTask() {
		// TODO Auto-generated method stub
		return sqlMap.selectList("selectAllTask");
	}
	
	
	@Override
	public int deleteTask(TaskDTO taskDTO) {
		return sqlMap.delete("deleteTask", taskDTO);
	}
	
	@Override
	public int updateTask(TaskDTO taskDTO) {
		return sqlMap.update("updateTask", taskDTO);
	}
}
