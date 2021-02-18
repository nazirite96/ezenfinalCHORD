package com.ezen.chord.todo.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.todo.dao.TodoDAO;
import com.ezen.chord.todo.dto.TodoDTO;
import com.ezen.chord.todo_item.dao.TodoItemDAO;
import com.ezen.chord.todo_item.dto.TodoItemDTO;


@Repository("todoDAO")
public class TodoDAOImple implements TodoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	@Autowired
	private TodoItemDAO tiDAO;
	
	public TodoDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	@Override
	public int getTodoSeq() {
		int result = sqlMap.selectOne("getTodoSeq");
		return result;
	}
	@Override
	public int insertTodoDAO(TodoDTO todoDTO) {
		int result = sqlMap.insert("insertTodo", todoDTO);
		return result;
	}
	
	@Override
	public int insertTodoTimDAO(TodoDTO todoDTO) {
		int result = sqlMap.insert("insertTodoTim", todoDTO);
		return result;
	}	
	
	@Override
	public TodoDTO getTodoDetail(int todo_no) {
		TodoDTO result = sqlMap.selectOne("getTodoDetail", todo_no);
		List<TodoItemDTO> tiList = tiDAO.getTiList(todo_no);
		
		result.setTiList(tiList);
		
		return result;
	}
}
