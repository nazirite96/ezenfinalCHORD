package com.ezen.chord.todo_item.dao;

import com.ezen.chord.todo_item.dto.TodoItemDTO;
import java.util.*;

public interface TodoItemDAO {
	
	public int insertTodoItemDAO(TodoItemDTO tiDTO);
	public int insertTodoItemPiDAO(TodoItemDTO tiDTO);
	public List<TodoItemDTO> getTodoItemListDAO(int todo_no);
}
