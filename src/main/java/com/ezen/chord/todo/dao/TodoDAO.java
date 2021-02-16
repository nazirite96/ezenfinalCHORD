package com.ezen.chord.todo.dao;

import com.ezen.chord.todo.dto.TodoDTO;

public interface TodoDAO {

	
	public int getTodoSeq();
	public int insertTodoDAO(TodoDTO todoDTO);
	public int insertTodoTimDAO(TodoDTO todoDTO);
	
}
