package com.ezen.chord.todo_item.service;

import java.util.List;

import com.ezen.chord.todo_item.dto.TodoItemDTO;

public interface TodoItemService {
	
	/*할일항목 시퀀스 조회*/
	public int getTiSeq();
	public int insertTodoItemService(TodoItemDTO tiDTO);
	public int insertTodoItemPiService(TodoItemDTO tiDTO);
	public List<TodoItemDTO> getTiList(int todo_no);
}
