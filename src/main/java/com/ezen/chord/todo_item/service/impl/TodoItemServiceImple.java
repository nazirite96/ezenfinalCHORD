package com.ezen.chord.todo_item.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.todo_item.dao.TodoItemDAO;
import com.ezen.chord.todo_item.dto.TodoItemDTO;
import com.ezen.chord.todo_item.service.TodoItemService;

@Service
public class TodoItemServiceImple implements TodoItemService {
	
	@Autowired
	private TodoItemDAO tiDAO;
	
	@Override
	public int insertTodoItemService(TodoItemDTO tiDTO) {
		int result = tiDAO.insertTodoItemDAO(tiDTO);
		return result;
	}
	
	@Override
	public List<TodoItemDTO> getTodoItemListService(int todo_no) {
		return tiDAO.getTodoItemListDAO(todo_no);
	}
}