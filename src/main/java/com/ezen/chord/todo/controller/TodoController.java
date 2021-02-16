package com.ezen.chord.todo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.chord.project.service.ProjectService;
import com.ezen.chord.task.service.TaskService;
import com.ezen.chord.timeline.dto.TimelineDTO;
import com.ezen.chord.timeline.service.TimelineService;
import com.ezen.chord.todo.dto.TodoDTO;
import com.ezen.chord.todo.service.TodoService;
import com.ezen.chord.todo_item.dto.MultiTodo;
import com.ezen.chord.todo_item.dto.TodoItemDTO;
import com.ezen.chord.todo_item.service.TodoItemService;
import java.util.*;

@Controller
public class TodoController {
	
	@Autowired
	private TimelineService timService;
	
	@Autowired
	private ProjectService proService;
	
	@Autowired
	private TodoService todoService;
	
	@Autowired
	private TodoItemService todoItemService;	
	
	@RequestMapping("/todoInsert.do")
	public String todoInsert(TimelineDTO timDTO
			,TodoDTO todoDTO
			, MultiTodo multiTodo
			, HttpSession session){
		
		int mem_no = (Integer) session.getAttribute("memNo");
		
		int todo_no = todoService.getTodoSeq();
		int tim_no = timService.getTimSeq();
		
		todoDTO.setCont_kind("todo");
		todoDTO.setTodo_no(todo_no);
		todoDTO.setCont_no(todo_no);
		todoDTO.setPro_no(timDTO.getPro_no());		
		
		int insertCnt = todoService.insertTodoService(todoDTO);
		int resultTodoTim = todoService.insertTodoTimService(todoDTO);
		
		
		
		List<TodoItemDTO> tiList = multiTodo.getTiList();
		
		for(TodoItemDTO tiDTO : tiList) {
			System.out.println(todo_no+"컨트롤러");
			tiDTO.setTodo_no(todo_no);
			System.out.println(tiDTO.getTodo_item_content());
			
			todoItemService.insertTodoItemService(tiDTO);
			todoItemService.insertTodoItemPiService(tiDTO);
			System.out.println(tiDTO.getTi_mem_no()+"컨트롤러 mem테스트");
		}
		
		
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
}
