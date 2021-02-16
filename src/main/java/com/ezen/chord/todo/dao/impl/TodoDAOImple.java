package com.ezen.chord.todo.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.chord.todo.dao.TodoDAO;
import com.ezen.chord.todo.dto.TodoDTO;

@Repository("todoDAO")
public class TodoDAOImple implements TodoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
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
}
