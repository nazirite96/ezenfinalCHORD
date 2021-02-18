package com.ezen.chord.todo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.todo.dao.TodoDAO;
import com.ezen.chord.todo.dto.TodoDTO;
import com.ezen.chord.todo.service.TodoService;

@Service
public class TodoServiceImple implements TodoService {
	
	@Autowired
	private TodoDAO todoDAO;

	@Override
	public int getTodoSeq() {
		int result = todoDAO.getTodoSeq();
		return result;
	}
	
	@Override
	public int insertTodoService(TodoDTO todoDTO) {
		int result = todoDAO.insertTodoDAO(todoDTO);
		return result;
	}
	
	@Override
	public int insertTodoTimService(TodoDTO todoDTO) {
		int result = todoDAO.insertTodoTimDAO(todoDTO);
		return result;
	}
	
	@Override
	public TodoDTO getTodoDetail(int todo_no) {
		return todoDAO.getTodoDetail(todo_no);
	}
}
