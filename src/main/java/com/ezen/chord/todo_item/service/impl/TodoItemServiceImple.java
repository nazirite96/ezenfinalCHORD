package com.ezen.chord.todo_item.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.chord.project_user.dto.ProjectUserDTO;
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
	public int insertTodoItemPiService(TodoItemDTO tiDTO) {
		int result = tiDAO.insertTodoItemPiDAO(tiDTO);
		return result;
	}
	
	@Override
	public int updateTodoItemService(TodoItemDTO tiDTO) {
		int result = tiDAO.updateTodoItemDAO(tiDTO);
		return result;
	}
	
	@Override
	public List<TodoItemDTO> getTiList(int todo_no) {
		return tiDAO.getTiList(todo_no);
	}
	
	@Override
	public List<ProjectUserDTO> tu_mem_list(int todo_item_no) {
		
		return tiDAO.tu_mem_list(todo_item_no);
	}
	
	@Override
	public int getTiSeq() {
		// TODO Auto-generated method stub
		return tiDAO.getTiSeq();
	}
}
