package com.ezen.chord.todo_item.service;

import java.util.List;

import com.ezen.chord.todo_item.dto.TodoItemDTO;

public interface TodoItemService {
	
	public int insertTodoItemService(TodoItemDTO tiDTO);
	public List<TodoItemDTO> getTodoItemListService(int todo_no);
}
