package com.ezen.chord.todo_item.dao;

import com.ezen.chord.todo_item.dto.TodoItemDTO;
import java.util.*;

public interface TodoItemDAO {
	
	/*할일항목 시퀀스 조회*/
	public int getTiSeq();	
	public int insertTodoItemDAO(TodoItemDTO tiDTO);
	public int insertTodoItemPiDAO(TodoItemDTO tiDTO);
	public List<TodoItemDTO> getTiList(int todo_no);
}
