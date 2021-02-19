package com.ezen.chord.todo_item.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.chord.todo.dto.TodoDTO;
import com.ezen.chord.todo.service.TodoService;
import com.ezen.chord.todo_item.dto.TodoItemDTO;
import com.ezen.chord.todo_item.service.TodoItemService;


@Controller
public class TodoItemController {

	
	@Autowired
	private TodoItemService tiService;
	
	@Autowired
	private TodoService todoService;
	
	
	@RequestMapping("/tiChkUpdate.do")
	@ResponseBody
	public int todoItemUpdate(@RequestParam("todo_item_no") int ti_no, 
							  @RequestParam("todo_item_chk") String ti_chk,
							  @RequestParam("todo_item_content") String ti_cont,
							  @RequestParam("todo_no") int todo_no){
		
		TodoItemDTO tiDTO = new TodoItemDTO();
		tiDTO.setTodo_item_no(ti_no);
		tiDTO.setTodo_item_chk(ti_chk);
		tiDTO.setTodo_item_content(ti_cont);
		
		// 할일 상세 조회
		TodoDTO todoDTO = todoService.getTodoDetail(todo_no);
		
		// 할일 update
		
		int updateCnt = tiService.updateTodoItemService(tiDTO);
		return updateCnt;
	}
}
