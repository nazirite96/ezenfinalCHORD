package com.ezen.chord.todo_item.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.project_user.dto.ProjectUserDTO;
import com.ezen.chord.todo_item.dao.TodoItemDAO;
import com.ezen.chord.todo_item.dto.TodoItemDTO;

@Repository("todoItemDAO")
public class TodoItemDAOImple implements TodoItemDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public TodoItemDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int insertTodoItemDAO(TodoItemDTO tiDTO) {
		int result = sqlMap.insert("insertTodoItem", tiDTO);
		return result;
	}
	
	@Override
	public int insertTodoItemPiDAO(TodoItemDTO tiDTO) {
		int result = sqlMap.insert("insertTodoItemPi", tiDTO);
		return result;
	}
	
	@Override
	public int updateTodoItemDAO(TodoItemDTO tiDTO) {
		int result = sqlMap.update("updateTodoItem", tiDTO);
		return result;
	}
	
	@Override
	public List<TodoItemDTO> getTiList(int todo_no) {
		List<TodoItemDTO> getTiList = sqlMap.selectList("getTiList", todo_no);
		return getTiList;
	}
	
	@Override
	public List<ProjectUserDTO> tu_mem_list(int todo_item_no) {
		List<ProjectUserDTO> partic = sqlMap.selectList("selectTodoPiByNo", todo_item_no);
		return partic;
	}
	
	@Override
	public int getTiSeq() {
		return sqlMap.selectOne("getTiSeq");
	}
	
	@Override
	public int deleteTodoItem(int cont_no) {
		return sqlMap.delete("deleteTodoItem", cont_no);
	}
	
	@Override
	public int deleteTodoItemPartic(int cont_no) {
		return sqlMap.delete("deleteTodoItemPartic", cont_no);
	}
}
