package com.ezen.chord.todo.service;

import com.ezen.chord.todo.dto.TodoDTO;

public interface TodoService {
	
	public int getTodoSeq();
	
	public int insertTodoService(TodoDTO todoDTO);
	public int insertTodoTimService(TodoDTO todoDTO);
}
