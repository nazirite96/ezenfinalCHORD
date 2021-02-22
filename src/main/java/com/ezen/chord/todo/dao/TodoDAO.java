package com.ezen.chord.todo.dao;

import com.ezen.chord.todo.dto.TodoDTO;

public interface TodoDAO {

	
	public int getTodoSeq();
	public int insertTodoDAO(TodoDTO todoDTO);
	public int insertTodoTimDAO(TodoDTO todoDTO);
	
	public TodoDTO getTodoDetail(int todo_no);
	
	public int deleteTodo(int cont_no);
	
}
