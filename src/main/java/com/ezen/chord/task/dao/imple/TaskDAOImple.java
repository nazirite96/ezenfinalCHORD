package com.ezen.chord.task.dao.imple;

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

	public TaskDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int getTaskSeq() {
		return sqlMap.selectOne("getTaskSeq");
	}
	
	@Override
	public int insertTaskDAO(TaskDTO taskDTO) {
		int result = sqlMap.insert("insertTask", taskDTO);
		System.out.println(taskDTO.getTask_title()+"dao부분");
		return result;
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
