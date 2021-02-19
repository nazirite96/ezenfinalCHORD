package com.ezen.chord.todo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
			int ti_no = todoItemService.getTiSeq();
			System.out.println(todo_no+"컨트롤러");
			tiDTO.setTodo_no(todo_no);
			tiDTO.setTodo_item_no(ti_no);
			System.out.println(tiDTO.getTodo_item_content());
			todoItemService.insertTodoItemService(tiDTO);
			todoItemService.insertTodoItemPiService(tiDTO);
			System.out.println(tiDTO.getTodo_item_no()+"컨트롤러 값테스트");
			System.out.println(tiDTO.getTi_mem_no()+"컨트롤러 값테스트");
			
		}
		
		
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
	
	
	@RequestMapping("/todoUpdate.do")
	public String todoUpdate(TimelineDTO timDTO,
							 @RequestParam("todo_no") int todo_no,
							 @RequestParam("tim_cont") String tim_cont,
							 @RequestParam(value="tu_mem_list", defaultValue = "1")List<Integer> tu_mem_list,
							 MultiTodo multiTodo,
							 HttpServletRequest request,
							 HttpSession session) {
		
		HttpSession sess=request.getSession();
		int mem_no = (Integer) sess.getAttribute("memNo");
		
		timDTO.setTim_cont(tim_cont);
		timDTO.setTim_no(timDTO.getTim_no());
		int result = timService.updateTim(timDTO);
		
		System.out.println(tim_cont+"todo");
		System.out.println(timDTO.getTim_no()+"todo");
		
			
			// 할일 항목 등록 List
			List<TodoItemDTO> tiList = multiTodo.getTiList();
			
			if(tiList != null){
				for (TodoItemDTO tiDTO : tiList) {
					
					if(tiDTO.getTodo_item_content() != null) {
						
						tiDTO.setTodo_no(todo_no);
						todoItemService.insertTodoItemService(tiDTO);
						todoItemService.insertTodoItemPiService(tiDTO);
					}
					
				}
			}
			
			// 할일 항목 수정 List
			List<TodoItemDTO> updateList = multiTodo.getTiUpdateList();
			
			for (TodoItemDTO tiDTO : updateList) {
				todoItemService.updateTodoItemService(tiDTO);
			}
			
			session.setAttribute("msg", "글이 수정되었습니다.");
			session.setAttribute("className", "alert-warning");
		
		
		return "redirect:/timeLine.do?pro_no="+timDTO.getPro_no()+"&mem_no="+mem_no;
	}
}
